//
// Simple passthrough vertex shader
//
attribute vec3 in_Position;                  // (x,y,z)
attribute vec4 in_Colour;                    // (r,g,b,a)
attribute vec2 in_TextureCoord;              // (u,v)
//attribute vec3 in_Normal;                  // (x,y,z)     unused in this shader.

varying vec2 v_vTexcoord;
varying vec4 v_vColour;

mat4 leftMat=mat4(1,0,0,1,0,1,0,0,0,0,1,0,0,0,0,1);
//mat4 leftMat=mat4(0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0);

/*(1,0,0,2),
(0,1,0,0),
(0,0,1,0),
(0,0,0,1);*/

void main()
{
    vec4 object_space_pos = vec4( in_Position.x, in_Position.y, in_Position.z, 1.0);
    mat4 view_Off = gm_Matrices[MATRIX_VIEW]*leftMat;
    gl_Position = ((gm_Matrices[MATRIX_WORLD]*gm_Matrices[MATRIX_PROJECTION])* view_Off ) * object_space_pos;

    
    v_vColour = in_Colour;
    v_vTexcoord = in_TextureCoord;
}
//######################_==_YOYO_SHADER_MARKER_==_######################@~//
// Simple passthrough fragment shader
//
varying vec2 v_vTexcoord;
varying vec4 v_vColour;

void main()
{
    gl_FragColor = v_vColour * texture2D( gm_BaseTexture, v_vTexcoord );
}

