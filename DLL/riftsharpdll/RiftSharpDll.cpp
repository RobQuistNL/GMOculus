// RiftSharpDll.cpp : Defines the exported functions for the DLL application.
//

#include "stdafx.h"
#include "RiftSharpDll.h"
#include "OVR.h"

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

