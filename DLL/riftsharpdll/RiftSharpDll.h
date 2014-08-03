// The following ifdef block is the standard way of creating macros which make exporting 
// from a DLL simpler. All files within this DLL are compiled with the RIFTSHARPDLL_EXPORTS
// symbol defined on the command line. This symbol should not be defined on any project
// that uses this DLL. This way any other project whose source files include this file see 
// RIFTSHARPDLL_API functions as being imported from a DLL, whereas this DLL sees symbols
// defined with this macro as being exported.
#ifdef RIFTSHARPDLL_EXPORTS
#define RIFTSHARPDLL_API __declspec(dllexport)
#else
#define RIFTSHARPDLL_API __declspec(dllimport)
#endif

extern "C" RIFTSHARPDLL_API double Initialize(void);

extern "C" RIFTSHARPDLL_API double Uninitialize(void);

//extern "C" RIFTSHARPDLL_API double GetYawPitchRoll(float* yaw, float* pitch, float* roll);

extern "C" RIFTSHARPDLL_API double GetYaw(void);

extern "C" RIFTSHARPDLL_API double GetPitch(void);

extern "C" RIFTSHARPDLL_API double GetRoll(void);

//extern "C" RIFTSHARPDLL_API double GetQuaternion(float* x, float* y, float* z, float* w);