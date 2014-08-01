RiftSharp
=========

This is a VERY basic implementation of a .NET assembly to
import Oculus Rift functionality in your .NET project.
This code is barebone (e.g. no error or exception handling),
but since I couldn't find another simple open source .NET
wrapper for the Rift I thought it might be usefull for some.

It consists of:

RiftSharpDll
------------
A C++ wrapper DLL (RiftSharpDll), wrapping
the Oculus LibOVR C++ library. The solution file opens with
Visual C++ Express 2010. You will see that the LibOVR project
is missing, simply import the LibOVR project from the 
Oculus SDK.

RiftSharp
---------
The actual C# wrapper assembly. VERY basic. Only supports
retrieving the orientation of the headset. Feel free to extend.
It contains simple classes for Quaternion and Euler angles. This
to remove dependency on any external library.

RiftSharpTest
-------------
The simplest possible example on how to use the RiftSharp
assembly. Be sure to copy the RiftSharpDll C++ dll to the
binary folder.