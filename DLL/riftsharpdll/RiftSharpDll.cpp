// RiftSharpDll.cpp : Defines the exported functions for the DLL application.
//

#include "stdafx.h"
#include "RiftSharpDll.h"
#include "RenderTiny_D3D11_Device.h"
#include "OVR_CAPI.h"
#include "Player.h"


// Choose whether the SDK performs rendering/distortion, or the application. 
#define          SDK_RENDER 1  //Do NOT switch until you have viewed and understood the Health and Safety message.
                               //Disabling this makes it a non-compliant app, and not suitable for demonstration. In place for development only.
const bool       FullScreen = true; //Should be true for correct timing.  Use false for debug only.


// Include Non-SDK supporting Utilities from other files

//#include "../CommonSrc/Render/Render_Device.h"
//HWND Util_InitWindowAndGraphics    (Recti vp, int fullscreen, int multiSampleCount, bool UseAppWindowFrame, RenderDevice ** pDevice);
//void Util_ReleaseWindowAndGraphics (RenderDevice* pRender);
//bool Util_RespondToControls        (float & EyeYaw, Vector3f & EyePos, Quatf PoseOrientation);
//void PopulateRoomScene             (Scene* scene, RenderDevice* render);

//Structures for the application
ovrHmd             HMD;
//ovrEyeRenderDesc   EyeRenderDesc[2];
//ovrRecti           EyeRenderViewport[2];
//RenderDevice*      pRender = 0;
//Texture*           pRendertargetTexture = 0;
//Scene*             pRoomScene = 0;
Player			   ThePlayer;
float hmdYaw, hmdPitch, hmdRoll;


// Specifics for whether the SDK or the APP is doing the distortion.
#if SDK_RENDER
	#define OVR_D3D_VERSION 11
	#include "OVR_CAPI_D3D.h"
	ovrD3D11Texture    EyeTexture[2];
#else
	ShaderSet *         Shaders;  
	ID3D11InputLayout * VertexIL;
	Ptr<Buffer>         MeshVBs[2];
	Ptr<Buffer>         MeshIBs[2]; 
	ovrVector2f         UVScaleOffset[2][2];
#endif

#define RAD2DEG (57.2957795)



void getRiftData() {
ThePlayer.HeadPose.Rotation.GetEulerAngles<Axis_Y, Axis_X, Axis_Z>(&hmdYaw, &hmdPitch, &hmdRoll);
/*OVR_sprintf(buf, sizeof(buf),
            " HMD YPR:%4.0f %4.0f %4.0f   Player Yaw: %4.0f\n"
            " FPS: %.1f  ms/frame: %.1f Frame: %03d %d\n"
            " Pos: %3.2f, %3.2f, %3.2f  HMD: %s\n"
            " EyeHeight: %3.2f, IPD: %3.1fmm\n" //", Lens: %s\n"
            " FOV %3.1fx%3.1f, Resolution: %ix%i\n"
            "%s",
            RadToDegree(hmdYaw), RadToDegree(hmdPitch), RadToDegree(hmdRoll),
            RadToDegree(ThePlayer.BodyYaw.Get()),
            FPS, SecondsPerFrame * 1000.0f, FrameCounter, TotalFrameCounter % 2,
            ThePlayer.BodyPos.x, ThePlayer.BodyPos.y, ThePlayer.BodyPos.z,
            //GetDebugNameHmdType ( TheHmdRenderInfo.HmdType ),
            Hmd->ProductName,
            ThePlayer.UserEyeHeight,
            ovrHmd_GetFloat(Hmd, OVR_KEY_IPD, 0) * 1000.0f,
            //( EyeOffsetFromNoseLeft + EyeOffsetFromNoseRight ) * 1000.0f,
            //GetDebugNameEyeCupType ( TheHmdRenderInfo.EyeCups ),  // Lens/EyeCup not exposed
                    
            (leftFov.GetHorizontalFovDegrees() + rightFov.GetHorizontalFovDegrees()) * 0.5f,
            (leftFov.GetVerticalFovDegrees() + rightFov.GetVerticalFovDegrees()) * 0.5f,

            pixelSizeWidth, pixelSizeHeight,

            latency2Text
            );*/
}



RIFTSHARPDLL_API double Initialize()
{
	ovr_Initialize();
	HMD = ovrHmd_Create(0);
    if (!HMD) {
        //MessageBoxA(NULL,"Oculus Rift not detected.","", MB_OK);
        return 0;
    }
	if (HMD->ProductName[0] == '\0') {
        //MessageBoxA(NULL,"Rift detected, display not enabled.","", MB_OK);
		return 2;
	}

	ovrHmd_SetEnabledCaps(HMD, ovrHmdCap_LowPersistence | ovrHmdCap_DynamicPrediction);

	// Start the sensor which informs of the Rift's pose and motion
    ovrHmd_ConfigureTracking(HMD, ovrTrackingCap_Orientation |
                            ovrTrackingCap_MagYawCorrection |
                            ovrTrackingCap_Position, 0);

	return 1;
}

RIFTSHARPDLL_API double Uninitialize()
{
	ovrHmd_Destroy(HMD);
    //Util_ReleaseWindowAndGraphics(pRender);
	ovr_Shutdown(); 
	return 1;
}

RIFTSHARPDLL_API double getYaw() {
	getRiftData();
	return hmdYaw;
}

RIFTSHARPDLL_API double getPitch() {
	getRiftData();
	return hmdPitch;
}

RIFTSHARPDLL_API double getRoll() {
	getRiftData();
	return hmdRoll;
}




/*
RIFTSHARPDLL_API char* getHmdResolution() {
	return HMD->Resolution;
}
*/



/*RIFTSHARPDLL_API double GetYawPitchRoll(float* yaw, float* pitch, float* roll)
{
	if (pSensor)
	{
		Quatf quaternion = FusionResult.GetOrientation();
		quaternion.GetEulerAngles<Axis_Y, Axis_X, Axis_Z>(yaw, pitch, roll);
		return 0;
	}
	else
		return -1;
}*/

/* WORKING ON THE YAW PITCH ROLL FETCHING. Check out the 0.4.0 demo SDK with the RoomTiny example,
Many pretty things there.
RIFTSHARPDLL_API double GetYaw(void)
{
	ovrHmd
	Quatf quaternion = FusionResult.GetOrientation();
	float yaw = quaternion.y;
	float pitch = quaternion.x;
	float roll = quaternion.z;
	quaternion.GetEulerAngles<Axis_Y, Axis_X, Axis_Z>(&yaw, &pitch, &roll);
	return yaw*RAD2DEG;

}

RIFTSHARPDLL_API double GetPitch(void)
{
  Quatf quaternion = FusionResult.GetOrientation();
  float yaw, pitch, roll = 0.0f;
  quaternion.GetEulerAngles<Axis_Y, Axis_X, Axis_Z>(&yaw, &pitch, &roll);
  return pitch*RAD2DEG;
}

RIFTSHARPDLL_API double GetRoll(void)
{
	Quatf quaternion = FusionResult.GetOrientation();
	float yaw = quaternion.y;
	float pitch = quaternion.x;
	float roll = quaternion.z;
	quaternion.GetEulerAngles<Axis_Y, Axis_X, Axis_Z>(&yaw, &pitch, &roll);
	return roll*RAD2DEG;
}


RIFTSHARPDLL_API double GetQuaternion(float* x, float* y, float* z, float* w)
{
	if (pSensor)
	{
		Quatf quaternion = FusionResult.GetOrientation();
		*x = quaternion.x;
		*y = quaternion.y;
		*z = quaternion.z;
		*w = quaternion.w;		
		return 0;
	}
	else
		return -1;
}
*/
