// RiftSharpDll.cpp : Defines the exported functions for the DLL application.
//

#include "stdafx.h"
#include "RiftSharpDll.h"
#include "OVR_CAPI.h"

// Choose whether the SDK performs rendering/distortion, or the application. 
#define          SDK_RENDER 1  //Do NOT switch until you have viewed and understood the Health and Safety message.
                               //Disabling this makes it a non-compliant app, and not suitable for demonstration. In place for development only.
const bool       FullScreen = true; //Should be true for correct timing.  Use false for debug only.


// Include Non-SDK supporting Utilities from other files
#include "RenderTiny_D3D11_Device.h"
HWND Util_InitWindowAndGraphics    (Recti vp, int fullscreen, int multiSampleCount, bool UseAppWindowFrame, RenderDevice ** pDevice);
void Util_ReleaseWindowAndGraphics (RenderDevice* pRender);
bool Util_RespondToControls        (float & EyeYaw, Vector3f & EyePos, Quatf PoseOrientation);
void PopulateRoomScene             (Scene* scene, RenderDevice* render);

//Structures for the application
ovrHmd             HMD;
ovrEyeRenderDesc   EyeRenderDesc[2];
ovrRecti           EyeRenderViewport[2];
RenderDevice*      pRender = 0;
Texture*           pRendertargetTexture = 0;
Scene*             pRoomScene = 0;

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

using namespace OVR;

Ptr<DeviceManager>	pManager;
Ptr<HMDDevice>		pHMD;
Ptr<SensorDevice>	pSensor;
SensorFusion		FusionResult;
HMDInfo			Info;
bool			InfoLoaded;

RIFTSHARPDLL_API double Initialize()
{
	System::Init();

	double result=0;

	pManager = *DeviceManager::Create();

	pHMD = *pManager->EnumerateDevices<HMDDevice>().CreateDevice();

	if (pHMD)
	{	
		result=1;
		InfoLoaded = pHMD->GetDeviceInfo(&Info);

		pSensor = *pHMD->GetSensor();
	}
	else
	{
		pSensor = *pManager->EnumerateDevices<SensorDevice>().CreateDevice();
	}
	
	if (pSensor)
	{
		FusionResult.AttachToSensor(pSensor);
	}

	return result;
}

RIFTSHARPDLL_API double Uninitialize()
{
	pSensor.Clear();
	pHMD.Clear();
	pManager.Clear();

	System::Destroy();

	return -1;
}

RIFTSHARPDLL_API double GetYawPitchRoll(float* yaw, float* pitch, float* roll)
{
	if (pSensor)
	{
		Quatf quaternion = FusionResult.GetOrientation();
		quaternion.GetEulerAngles<Axis_Y, Axis_X, Axis_Z>(yaw, pitch, roll);
		return 0;
	}
	else
		return -1;
}

RIFTSHARPDLL_API double GetYaw(void)
{
	Quatf quaternion = FusionResult.GetOrientation();
	float yaw = quaternion.y;
	float pitch = quaternion.x;
	float roll = quaternion.z;
	quaternion.GetEulerAngles<Axis_Y, Axis_X, Axis_Z>(&yaw, &pitch, &roll);
	return yaw*RAD2DEG;

}
/*
RIFTSHARPDLL_API double GetPitch(void)
{
	Quatf quaternion = FusionResult.GetOrientation();
	float yaw = quaternion.y;
	float pitch = quaternion.x;
	float roll = quaternion.z;
	quaternion.GetEulerAngles<Axis_Y, Axis_X, Axis_Z>(&yaw, &pitch, &roll);
	return pitch*57.2957795;

}
*/

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

