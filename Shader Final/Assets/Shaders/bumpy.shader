Shader "Custom/bumpy" {
	Properties {
		_MainTex ("Albedo (RGB)", 2D) = "white" {}
		_BumpMap("Normal Map", 2D) = "bump" {}
		_Threshold("Threshold", Range(0,1)) = 0
		_SnowColor("SnowColor", Color) = (1,1,1,1)
		
	}
	SubShader {
		Tags { "RenderType"="Opaque" }
		LOD 200
		
		CGPROGRAM
		// Physically based Standard lighting model, and enable shadows on all light types
		#pragma surface surf Standard fullforwardshadows

		// Use shader model 3.0 target, to get nicer looking lighting
		#pragma target 3.0

		sampler2D _MainTex;
		sampler2D _BumpMap;
		half	  _Threshold;
		half4	  _SnowColor;

		struct Input {
			float2 uv_MainTex;
			float2 uv_BumpMap;
		};

		

		void surf (Input IN, inout SurfaceOutputStandard o) {
			// Albedo comes from a texture tinted by color
			fixed4 c = tex2D (_MainTex, IN.uv_MainTex);
			o.Normal = UnpackNormal(tex2D(_BumpMap, IN.uv_BumpMap));

			half3 up = half3(0, 0, 1);
			half NdotUp = dot(o.Normal, up);

			o.Albedo = NdotUp < 1 - _Threshold ? c.rgb : _SnowColor.rgb;
			o.Alpha = c.a;

		}
		ENDCG
	} 
	FallBack "Diffuse"
}
