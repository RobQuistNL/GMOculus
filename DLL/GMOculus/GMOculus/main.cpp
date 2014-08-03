#define GMO extern "C" __declspec (dllexport)
#define OVR_D3D_VERSION 11
#define RAD2DEG (57.2957795)

#ifdef _UNICODE
typedef const wchar_t* LPCTSTR;
#else
typedef const char* LPCTSTR;
#endif

double VERSION = 2;

#define SDK_RENDERING = 1;

#include <d3d11.h>
#include "..\..\LibOVR\Src\Kernel\OVR_Math.h"
#include "windows.h"

//#include "..\..\LibOVR\Src\Kernel\OVR_Array.h"
//#include "..\..\LibOVR\Src\Kernel/OVR_String.h"
//#include "..\..\LibOVR\Src\Kernel/OVR_Color.h"
#include "..\..\LibOVR\Src\OVR_CAPI.h"
#include "..\..\LibOVR\Src\OVR_CAPI_D3D.h"

//ovrD3D11Texture    EyeTexture[2];
ovrHmd HMD;
OVR::Posef currentPose;
ovrFrameTiming hmdFrameTiming;
ovrPosef headPose[2];
float currentYaw, currentPitch, currentRoll;


void getTrackingData() {
	// Query the HMD for the current tracking state.
	ovrTrackingState ts = ovrHmd_GetTrackingState(HMD, ovr_GetTimeInSeconds());
	if (ts.StatusFlags & (ovrStatus_OrientationTracked | ovrStatus_PositionTracked)) {
		currentPose = ts.HeadPose.ThePose;
		currentPose.Rotation.GetEulerAngles<OVR::Axis_Y, OVR::Axis_X, OVR::Axis_Z>(&currentYaw, &currentPitch, &currentRoll);
		currentYaw *= RAD2DEG;
		currentPitch *= RAD2DEG;
		currentRoll *= RAD2DEG;
		currentRoll = -currentRoll;
	} else {
		currentYaw = -1;
		currentPitch = -1;
		currentRoll = -1;
	}
}

GMO double getVersion() {
	return VERSION;
}

GMO double initialize() {
	ovr_Initialize();
	HMD = ovrHmd_Create(0);
	if (!HMD) {
		return 0; //No device found
	}
	if (HMD->ProductName[0] == '\0') {
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

GMO double beginFrame() {
	ovrHmd_BeginFrame(HMD, 0);
	return 1;
}

GMO double endFrame() {
	ovrHmd_EndFrame(HMD, headPose, 0);
	return 1;
}

GMO double getEyePos(double eyeIndexInput) {
	int eyeIndex = (int) eyeIndexInput;
	ovrEyeType eye = HMD->EyeRenderOrder[eyeIndex];
	headPose[eye] = ovrHmd_GetEyePose(HMD, eye);
	return 1;
}

GMO double linkWindowHandle(void* windowHandle) {
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

	return ovrHmd_AttachToWindow(HMD, handle, NULL, NULL);
}

GMO const char* getHMDName() {
	return HMD->ProductName;
}

