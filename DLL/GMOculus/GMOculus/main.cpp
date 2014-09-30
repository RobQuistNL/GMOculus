#define GMO extern "C" __declspec (dllexport)
#define OVR_D3D_VERSION 11
#define RAD2DEG (57.2957795)

#ifdef _UNICODE
typedef const wchar_t* LPCTSTR;
#else
typedef const char* LPCTSTR;
#endif

double VERSION = 2;
#define SDK_RENDER = 1;
#define OVR_D3D_VERSION 11
bool NON_HMD = true;

//#include "..\..\LibOVR\Src\Kernel\OVR_Array.h"
//#include "..\..\LibOVR\Src\Kernel/OVR_String.h"
//#include "..\..\LibOVR\Src\Kernel/OVR_Color.h"
#include "..\..\LibOVR\Src\OVR_CAPI.h"
#include "RenderTiny_D3D11_Device.h"
#include <windows.h>
#include <windowsx.h>
#include <d3d9.h>
#include <d3dx9.h>
HWND Util_InitWindowAndGraphics    (Recti vp, int fullscreen, int multiSampleCount, bool UseAppWindowFrame, RenderDevice ** pDevice, HWND handle);
//void Util_ReleaseWindowAndGraphics (RenderDevice* pRender);
//bool Util_RespondToControls        (float & EyeYaw, Vector3f & EyePos, Quatf PoseOrientation);
//void PopulateRoomScene             (Scene* scene, RenderDevice* render);

#include "..\..\LibOVR\Src\OVR_CAPI_D3D.h"
#include <d3d11.h>
#include "..\..\LibOVR\Src\Kernel\OVR_Math.h"
//#include "windows.h"

extern HWND hWnd;
bool			   FullScreen = true;
ovrHmd             HMD;
OVR::Posef         currentPose;
ovrFrameTiming     hmdFrameTiming;
ovrD3D11Texture    EyeTexture[2];
ovrEyeRenderDesc   EyeRenderDesc[2];
ovrRecti           EyeRenderViewport[2];
ovrPosef           headPose[2];
RenderDevice*      pRender = 0;
Texture*           pRendertargetTexture = 0;
float currentYaw, currentPitch, currentRoll;
double currentX, currentY, currentZ;

void getTrackingData() {
	currentYaw, currentPitch,currentRoll, currentX, currentY, currentZ = -1;

	// Query the HMD for the current tracking state.
	ovrTrackingState ts = ovrHmd_GetTrackingState(HMD, ovr_GetTimeInSeconds());
	if (ts.StatusFlags & (ovrStatus_OrientationTracked | ovrStatus_PositionTracked)) {
		currentPose = ts.HeadPose.ThePose;
				currentPose.Rotation.GetEulerAngles<OVR::Axis_Y, OVR::Axis_X, OVR::Axis_Z>(&currentYaw, &currentPitch, &currentRoll);
		currentYaw *= RAD2DEG;
		currentPitch *= RAD2DEG;
		currentRoll *= RAD2DEG;
		currentRoll = -currentRoll;
		currentX = currentPose.Translation.x + ts.HeadPose.ThePose.Position.x;
		currentY = currentPose.Translation.y + ts.HeadPose.ThePose.Position.y;
		currentZ = currentPose.Translation.z + ts.HeadPose.ThePose.Position.z;
	}
}

int Init() { return 1; };
void ProcessAndRender() {};
void Release() {};


GMO double getVersion() {
	return VERSION;
}

GMO double initialize() {
	ovr_Initialize();
	HMD = ovrHmd_Create(0);
	if (!HMD) {
		#if DEBUG
			MessageBoxA(NULL, "No oculus device found", "No oculus device found", MB_ICONWARNING);
		#endif
		return 0; //No device found
	}
	if (HMD->ProductName[0] == '\0') {
		#if DEBUG
			MessageBoxA(NULL, "Rift detected, display disabled", "Rift detected, display disabled", MB_ICONWARNING);
		#endif
		return 2; //Rift deetected, display disabled
	}

	// Some settings might be changed here lateron.
	ovrHmd_SetEnabledCaps(HMD, ovrHmdCap_LowPersistence | ovrHmdCap_DynamicPrediction);// | ovrHmdCap_ExtendDesktop);

	// Start the sensor which informs of the Rift's pose and motion
    ovrHmd_ConfigureTracking(HMD, ovrTrackingCap_Orientation |
                            ovrTrackingCap_MagYawCorrection |
                            ovrTrackingCap_Position, 0);

	return 1;
}

GMO double uninitialize() {
	ovrHmd_Destroy(HMD);
	ovr_Shutdown();
	return 1;
}

GMO double getYaw() {
	getTrackingData();
	return currentYaw;
}

GMO double getPitch() {
	getTrackingData();
	return currentPitch;
}

GMO double getRoll() {
	getTrackingData();
	return currentRoll;
}

GMO double getX() {
	getTrackingData();
	return currentX * 100;
}

GMO double getY() {
	getTrackingData();
	return -currentZ * 100; //Y and Z are swapped in GM
}

GMO double getZ() {
	getTrackingData();
	return currentY * 100; //Y and Z are swapped in GM
}

GMO double beginFrame() {
	if (NON_HMD) { return 1; }
	ovrHmd_BeginFrame(HMD, 0);
	pRender->BeginScene();
	pRender->SetDefaultRenderTarget();
	pRender->SetFullViewport();
	return 1;
}

GMO double endFrame() {
	if (NON_HMD) { return 1; }
	static ovrPosef eyeRenderPose[2]; 
	static float    BodyYaw(3.141592f);
	static Vector3f HeadPos(0.0f, 1.6f, -5.0f);
	HeadPos.y = ovrHmd_GetFloat(HMD, OVR_KEY_EYE_HEIGHT, HeadPos.y);

    //pRender->SetRenderTarget ( pRendertargetTexture );
	
    //pRender->SetViewport (Recti(0,0, pRendertargetTexture->GetWidth(),
    //                                    pRendertargetTexture->GetHeight() ));  
    //pRender->Clear();
	for (int eyeIndex = 0; eyeIndex < ovrEye_Count; eyeIndex++)
	{
        ovrEyeType eye = HMD->EyeRenderOrder[eyeIndex];
        eyeRenderPose[eye] = ovrHmd_GetEyePose(HMD, eye);

        // Get view and projection matrices
		Matrix4f rollPitchYaw       = Matrix4f::RotationY(BodyYaw);
		Matrix4f finalRollPitchYaw  = rollPitchYaw * Matrix4f(eyeRenderPose[eye].Orientation);
		Vector3f finalUp            = finalRollPitchYaw.Transform(Vector3f(0,1,0));
		Vector3f finalForward       = finalRollPitchYaw.Transform(Vector3f(0,0,-1));
		Vector3f shiftedEyePos      = HeadPos + rollPitchYaw.Transform(eyeRenderPose[eye].Position);
        Matrix4f view = Matrix4f::LookAtRH(shiftedEyePos, shiftedEyePos + finalForward, finalUp); 
		Matrix4f proj = ovrMatrix4f_Projection(EyeRenderDesc[eye].Fov, 0.01f, 10000.0f, true);

		//pRender->SetViewport(Recti(EyeRenderViewport[eye]));
		//pRender->SetProjection(proj);
		pRender->SetDepthMode(true, true);
		
		//pRoomScene->Render(pRender, Matrix4f::Translation(EyeRenderDesc[eye].ViewAdjust) * view);
	}
	//pRender->BlendState
	
	//pRender->Clear(0.0f, 0.0f, 0.0f, 0.0f);
	//pRender->Present( true );
	pRender->UpdateMonitorOutputs();
    pRender->FinishScene();
	ovrHmd_EndFrame(HMD, headPose, &EyeTexture[0].Texture);
	return 1;
}

GMO double getEyePos(double eyeIndexInput) {
	//int eyeIndex = (int) eyeIndexInput;
	//ovrEyeType eye = HMD->EyeRenderOrder[eyeIndex];
	//headPose[eye] = ovrHmd_GetEyePose(HMD, eye);
	return 1;
}

GMO double moveWindow(void* windowHandle, double x, double y) {
	HWND handle = (HWND) windowHandle;
    SetWindowPos(handle, 0, x, y, 0, 0, SWP_NOZORDER | SWP_NOSIZE);
	return 1;
}

GMO double enableTextureFiltering( long devicepointer ){
    LPDIRECT3DDEVICE9 device = (LPDIRECT3DDEVICE9)devicepointer;

    // Enable 8x Anisotropic Filtering
    device->SetSamplerState(0, D3DSAMP_MAXANISOTROPY, 8);
    device->SetSamplerState(0, D3DSAMP_MINFILTER, D3DTEXF_ANISOTROPIC);

    // Enable Linear Filtering
    device->SetSamplerState(0, D3DSAMP_MAGFILTER, D3DTEXF_LINEAR);
    device->SetSamplerState(0, D3DSAMP_MIPFILTER, D3DTEXF_LINEAR);
    return 1.0;
}

GMO double linkWindowHandle(void* windowHandle) {
	if (NON_HMD) { return 1; }
	const int eyeRenderMultisample = 1;
	const int backBufferMultisample = 1;

	//HWND handle = GetWindow((HWND)(int)windowHandle, GW_OWNER);
	//HWND handle = (HWND) (int) windowHandle;
	HWND handle = (HWND) windowHandle;

	/*
	 * This function returns the passed windows' title. Just to debug / test
	LPWSTR title;
	GetWindowText(handle, title, GetWindowTextLength(handle) + 1);
	MessageBox(NULL, (LPCWSTR)title, (LPCWSTR)title, MB_ICONWARNING);
	MessageBoxA(NULL, (LPCSTR)title, (LPCSTR)title, MB_ICONWARNING);
	*/
	hWnd = handle;
	ovrHmd_AttachToWindow(HMD, handle, NULL, NULL);

	Sizei recommenedTex0Size = ovrHmd_GetFovTextureSize(HMD, ovrEye_Left,  HMD->DefaultEyeFov[0], 1.0f);
    Sizei recommenedTex1Size = ovrHmd_GetFovTextureSize(HMD, ovrEye_Right, HMD->DefaultEyeFov[1], 1.0f);
	Sizei RenderTargetSize;
    RenderTargetSize.w = recommenedTex0Size.w + recommenedTex1Size.w;
    RenderTargetSize.h = max ( recommenedTex0Size.h, recommenedTex1Size.h );

	bool UseAppWindowFrame = true;//(HMD->HmdCaps & ovrHmdCap_ExtendDesktop) ? false : true;
	HWND window = Util_InitWindowAndGraphics(Recti(HMD->WindowsPos, HMD->Resolution), FullScreen, backBufferMultisample, 1,&pRender, handle);
    pRendertargetTexture = pRender->CreateTexture(Texture_RGBA | Texture_RenderTarget |
                                                  eyeRenderMultisample,
                                                  RenderTargetSize.w, RenderTargetSize.h, NULL);
    // The actual RT size may be different due to HW limits.
    RenderTargetSize.w = pRendertargetTexture->GetWidth();
    RenderTargetSize.h = pRendertargetTexture->GetHeight();

    // Initialize eye rendering information.
    // The viewport sizes are re-computed in case RenderTargetSize changed due to HW limitations.
    ovrFovPort eyeFov[2] = { HMD->DefaultEyeFov[0], HMD->DefaultEyeFov[1] } ;

    EyeRenderViewport[0].Pos  = Vector2i(0,0);
    EyeRenderViewport[0].Size = Sizei(RenderTargetSize.w / 2, RenderTargetSize.h);
    EyeRenderViewport[1].Pos  = Vector2i((RenderTargetSize.w + 1) / 2, 0);
    EyeRenderViewport[1].Size = EyeRenderViewport[0].Size;

	EyeTexture[0].D3D11.Header.API            = ovrRenderAPI_D3D11;
    EyeTexture[0].D3D11.Header.TextureSize    = RenderTargetSize;
    EyeTexture[0].D3D11.Header.RenderViewport = EyeRenderViewport[0];
    EyeTexture[0].D3D11.pTexture              = pRendertargetTexture->Tex.GetPtr();
    EyeTexture[0].D3D11.pSRView               = pRendertargetTexture->TexSv.GetPtr();

    // Right eye uses the same texture, but different rendering viewport.
    EyeTexture[1] = EyeTexture[0];
    EyeTexture[1].D3D11.Header.RenderViewport = EyeRenderViewport[1];

    // Configure d3d11.
    ovrD3D11Config d3d11cfg;
    d3d11cfg.D3D11.Header.API         = ovrRenderAPI_D3D11;
    d3d11cfg.D3D11.Header.RTSize      = Sizei(HMD->Resolution.w, HMD->Resolution.h);
    d3d11cfg.D3D11.Header.Multisample = backBufferMultisample;
    d3d11cfg.D3D11.pDevice            = pRender->Device;
    d3d11cfg.D3D11.pDeviceContext     = pRender->Context;
    d3d11cfg.D3D11.pBackBufferRT      = pRender->BackBufferRT;
    d3d11cfg.D3D11.pSwapChain         = pRender->SwapChain;
	
    if (!ovrHmd_ConfigureRendering(HMD, &d3d11cfg.Config,
		                           ovrDistortionCap_Chromatic | ovrDistortionCap_Vignette |
                                   ovrDistortionCap_TimeWarp | ovrDistortionCap_Overdrive,
								   eyeFov, EyeRenderDesc)) return -2;

	
	return 1;
}

GMO const char* getHMDName() {
	return HMD->ProductName;
}

