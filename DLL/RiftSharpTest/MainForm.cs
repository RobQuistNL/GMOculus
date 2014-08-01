using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Windows.Forms;
using System.Runtime.InteropServices;
using RiftSharp;

namespace RiftSharpTest
{
   

    public partial class MainForm : Form
    {       
        private Timer timer = new Timer();
        
        public MainForm()
        {
            InitializeComponent();

            timer.Interval = 100;
            timer.Tick += new EventHandler(timer_Tick);
            timer.Start();
        }

        void timer_Tick(object sender, EventArgs e)
        {
            YawPitchRoll ypr = Hmd.Instance.YawPitchRoll;
            labelYaw.Text = string.Format("{0} °", (ypr.Yaw * 180 / Math.PI).ToString("F02"));
            labelPitch.Text = string.Format("{0} °", (ypr.Pitch * 180 / Math.PI).ToString("F02")); ;
            labelRoll.Text = string.Format("{0} °", (ypr.Roll * 180 / Math.PI).ToString("F02")); ;
        }
    }
}
