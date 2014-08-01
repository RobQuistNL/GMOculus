using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace RiftSharp
{
    /// <summary>
    /// Class describing orientation using Euler angles.
    /// </summary>
    public class YawPitchRoll
    {
        /// <summary>
        /// Gets/sets the Yaw angle in radians (turn left/right).
        /// </summary>
        public float Yaw { get; set; }
        /// <summary>
        /// Gets/sets the Pitch angle in radians (up/down).
        /// </summary>
        public float Pitch { get; set; }
        /// <summary>
        /// Gets/sets the Roll angle in radians (roll left/right).
        /// </summary>
        public float Roll { get; set; }

        /// <summary>
        /// Default constructor.
        /// </summary>
        public YawPitchRoll()
        {

        }

        /// <summary>
        /// Constructor with field initialization.
        /// </summary>
        /// <param name="yaw">The yaw angle in radians.</param>
        /// <param name="pitch">The pitch angle in radians.</param>
        /// <param name="roll">The roll angle in radians.</param>
        public YawPitchRoll(float yaw, float pitch, float roll)
        {
            this.Yaw = yaw;
            this.Pitch = pitch;
            this.Roll = roll;
        }
    }
}
