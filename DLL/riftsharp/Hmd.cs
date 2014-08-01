using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Runtime.InteropServices;

namespace RiftSharp
{
    /// <summary>
    /// A wrapper class for the Oculus Rift. Use the static "Instance" property to gain access.
    /// </summary>
    public class Hmd : IDisposable
    {
        #region DLL imports from RiftSharpDll
        [DllImport("RiftSharpDll.dll", CallingConvention = CallingConvention.Cdecl)]
        protected static extern void Initialize();
        [DllImport("RiftSharpDll.dll", CallingConvention = CallingConvention.Cdecl)]
        protected static extern void Uninitialize();
        [DllImport("RiftSharpDll.dll", CallingConvention = CallingConvention.Cdecl)]
        protected static extern int GetYawPitchRoll(ref float yaw, ref float pitch, ref float roll);
        [DllImport("RiftSharpDll.dll", CallingConvention = CallingConvention.Cdecl)]
        protected static extern int GetQuaternion(ref float x, ref float y, ref float z, ref float w);
        #endregion

        #region Private fields
        private static Hmd instance = new Hmd();
        private bool initialized = false;
        #endregion

        #region Public static fields
        /// <summary>
        /// Gets the singleton instance of the HMD.
        /// </summary>
        public static Hmd Instance
        {
            get { return instance; }
        }
        #endregion

        #region Public properties
        /// <summary>
        /// Gets the orientation of the HMD in Euler angles.
        /// </summary>
        public RiftSharp.YawPitchRoll YawPitchRoll
        {
            get
            {
                float yaw = 0, pitch = 0, roll = 0;
                if (GetYawPitchRoll(ref yaw, ref pitch, ref roll) == 0)
                    return new RiftSharp.YawPitchRoll(yaw, pitch, roll);
                else
                    return new RiftSharp.YawPitchRoll();
            }
        }

        /// <summary>
        /// Gets the orientation of the HMD in Quaternion format.
        /// </summary>
        public RiftSharp.Quaternion Quaternion
        {
            get
            {
                float x = 0, y = 0, z = 0, w = 0;
                if (GetQuaternion(ref x, ref y, ref z, ref w) == 0)
                    return new RiftSharp.Quaternion(x, y, z, w);
                else
                    return new RiftSharp.Quaternion();
            }
        }
        #endregion

        #region Private constructor
        /// <summary>
        /// Private constructor that does the initialization of the HMD.
        /// It's private to support the singleton pattern.
        /// </summary>
        private Hmd()
        {
            if (!initialized)
            {
                Initialize();
                initialized = true;
            }
        }
        #endregion

        #region IDisposable
        /// <summary>
        /// Clean up.
        /// </summary>
        public void Dispose()
        {
            if (initialized)
            {
                Uninitialize();
                initialized = false;
            }
        }
        #endregion
    }
}
