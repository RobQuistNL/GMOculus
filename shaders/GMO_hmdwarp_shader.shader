//
// Simple passthrough vertex shader
//
attribute vec3 in_Position;                  // (x,y,z)
attribute vec4 in_Colour;                    // (r,g,b,a)
attribute vec2 in_TextureCoord;              // (u,v)
//attribute vec3 in_Normal;                  // (x,y,z)     unused in this shader.

varying vec2 v_vTexcoord;
varying vec4 v_vColour;

void main()
{
    vec4 object_space_pos = vec4( in_Position.x, in_Position.y, in_Position.z, 1.0);
    gl_Position = gm_Matrices[MATRIX_WORLD_VIEW_PROJECTION] * object_space_pos;
    
    v_vColour = in_Colour;
    v_vTexcoord = in_TextureCoord;
    
}

//######################_==_YOYO_SHADER_MARKER_==_######################@~//
// Simple passthrough fragment shader
//

varying vec2 v_vTexcoord;
varying vec4 v_vColour;

uniform sampler2D passedTextureLeft;
uniform sampler2D passedTextureRight;

int switchEyes = 1;

// left
float as = 0.9/1.0;
float w = 1.0;
float h = 1.0;
float scaleFactor = 1.0;

vec2 leftLensCenter  = vec2((w -0.2 * 0.5)*0.5, h*0.5);
vec2 rightLensCenter = vec2((w + 0.2 * 0.5)*0.5, h*0.5);

vec2 Scale        = vec2((w/2.0) * scaleFactor, (h/2.0) * scaleFactor * as);
vec2 ScaleIn      = vec2((1.4), (1.4) / as);
vec4 HmdWarpParam = vec4(1, 0.22, 0.24, 0);



vec2 screenCenter   = vec2(0.5, 0.5);

vec2 HmdWarp(vec2 in01, vec2 lensCenter)
{
   vec2 theta = (in01 - lensCenter) * ScaleIn; // Scales to [-1, 1]
   float rSq = theta.x * theta.x + theta.y * theta.y;
   vec2 rvector = theta * (HmdWarpParam.x + HmdWarpParam.y * rSq +
      HmdWarpParam.z * rSq * rSq +
      HmdWarpParam.w * rSq * rSq * rSq);
   return lensCenter + Scale * rvector;
}

void main()
{
    //gl_FragColor = v_vColour * texture2D( gm_BaseTexture, v_vTexcoord );
    
    vec2 texcoord = v_vTexcoord;
     if (texcoord.x > 0.5) {
         texcoord.x -= 0.5;
      }
      texcoord.x *= 2.0;

      if (v_vTexcoord.x > 0.5) {
        texcoord.x += 0.015;
         vec2 texcoord = HmdWarp(texcoord, rightLensCenter);
          if (any(bvec2(clamp(texcoord,screenCenter-vec2(0.5,0.5), screenCenter+vec2(0.5,0.5)) - texcoord)))
          {
            gl_FragColor = vec4(vec3(0.0), 1.0);
            return;
          }
         vec3 Reye;
         
         Reye = switchEyes == 1 ? texture2D(passedTextureLeft, texcoord.xy).rgb : texture2D(passedTextureRight, texcoord.xy).rgb;
            
         gl_FragColor.rgb = Reye;
         gl_FragColor.a = 1.0;
         
         
      } else {
        texcoord.x -= 0.015;
         vec2 texcoord = HmdWarp(texcoord, leftLensCenter);
          if (any(bvec2(clamp(texcoord,screenCenter-vec2(0.5,0.5), screenCenter+vec2(0.5,0.5)) - texcoord)))
          {
            gl_FragColor = vec4(vec3(0.0), 1.0);
            return;
          }
         vec3 Leye;
         Leye = switchEyes == 1 ? texture2D(passedTextureRight, texcoord.xy).rgb : texture2D(passedTextureLeft, texcoord.xy).rgb;
            
         gl_FragColor.rgb = Leye;
         gl_FragColor.a = 1.0;
         }
}
