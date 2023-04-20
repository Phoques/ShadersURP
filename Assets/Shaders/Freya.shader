Shader "Unlit/Freya"
{
    Properties // Input Data
    {
        _Value("Value", Float) = 1.0
    }
        SubShader
    {
        Tags { "RenderType" = "Opaque" }

        ZWrite On

        Pass
        {
            CGPROGRAM
            #pragma vertex vert
            #pragma fragment frag

            #include "UnityCG.cginc"

            float _Value;

            struct appdata // (Mesh Data per-vertex mesh data)
            {
                float4 vertex : POSITION; // vertex position
                float3 normals : NORMAL; // Normals being the vertex facing direction, float 3 because it exists in 3 directional vector
                //float4 tangent : TANGENT; // Float 4 because first 3 components are the direction of the tangent, then 4th is the sine component.
                //float4 color : COLOR; // float 4 because Red Green Blue Alpha.
                float4 uv : TEXCOORD0; // UV coordinates / channels can have multiple co-ords if you have example, normal maps, would be texcoord0, then lightmaps is texcoord1
            };

            struct v2f // Vertex shader 2 Fragment shader (v2f) often also called interpolators, as it interpolates vert to frag. e.g returning two vert colours,
                //the frags between will slowly blend colours in the middle and have the hard colours at each vert.
     {
         float4 vertex : SV_POSITION; // SV_POSITION is the Clip space position of each vertex
         //float2 uv : TEXCOORD0; // IS NOT THE SAME as UV channels, is used for passing data (Not sure)
     };


     v2f vert(appdata v)
     {
         v2f o; // o is usually for output.
         o.vertex = UnityObjectToClipPos(v.vertex); // converts local space to clip space.
         return o;
     }

     //float (32 bit float, use float everywhere unless you need to optimise)
     //half (16 bit float, decent performant)
     //fixed (low precision, less memory more performant)
     // Apparently fixed and half are rarely used in PC gaming, but mobile gaming half is useful.


     float4 frag(v2f i) : SV_Target
     {
         return float4(1, 0, 0, 1);
     }
     ENDCG
 }
    }
}
