using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace RiftSharp
{
    /// <summary>
    /// A simple class describing a Quaternion.
    /// </summary>
    public class Quaternion
    {
        public float X { get; set; }
        public float Y { get; set; }
        public float Z { get; set; }
        public float W { get; set; }

        /// <summary>
        /// Default constructor.
        /// </summary>
        public Quaternion()
        {
        }

        /// <summary>
        /// Constructor with initialization of all fields.
        /// </summary>
        /// <param name="x"></param>
        /// <param name="y"></param>
        /// <param name="z"></param>
        /// <param name="w"></param>
        public Quaternion(float x, float y, float z, float w)
        {
            this.X = x;
            this.Y = y;
            this.Z = z;
            this.W = w;
        }
    }
}
