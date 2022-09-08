Shader "Custom/BPShader"
{
         Properties 
         {
             _Color ("Color", color) = (1,1,1,1)
             _SpecColor ("Spec color", color) = (0.5,0.5,0.5,0.5)
             _Glossiness("Shininess", Range(0, 255)) = 10
         }
         SubShader 
         {
             Tags { "RenderType"="Opaque" }
             LOD 200
          
             CGPROGRAM
             #pragma surface surf BlinnPhong
             #pragma target 3.0
  
             struct appdata 
             {
                 float4 vertex : POSITION;
                 float3 normal : NORMAL;
             };
  
             struct Input 
             {
                 float3 normal : NORMAL;
             };
  
             float _Glossiness;
             fixed4 _Color;
     
             void surf (Input IN, inout SurfaceOutput o)
             {
                 o.Albedo = _Color.rgb;
                 o.Specular = _Glossiness;
                 o.Gloss = 1;
             }
             ENDCG
         }
    FallBack "Diffuse"
}