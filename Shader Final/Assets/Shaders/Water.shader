Shader "Custom/water" {
	Properties {
		_MainTex ("Albedo (RGB)", 2D) = "white" {}
		_BumpMap("Normal Map", 2D) = "bump" {}
		_Amplitude("Amplitude", float) = 0
		_Frequency("Frequency", float) = 1
		_Offset("Offset", float) = 0
		_Center("Center", vector) = (0, 0, 0, 0)
		_Glossiness("Smoothness", Range(0,1)) = 0.5
		_Metallic("Metallic", Range(0,1)) = 0.0
			
		
	}
	SubShader {
		Tags { "RenderType"="Opaque" }
		LOD 200
		
		CGPROGRAM
		// Physically based Standard lighting model, and enable shadows on all light types
		#pragma surface surf Standard fullforwardshadows vertex:vert

		// Use shader model 3.0 target, to get nicer looking lighting
		#pragma target 3.0

		sampler2D _MainTex;
		sampler2D _BumpMap;
		half _Amplitude;
		half _Frequency;
		half _Offset;
		half2 _Center;



		void vert(inout appdata_full v) 
		{
			half2 uv = v.texcoord.xy;
			uv.x -= _Center.x;
			uv.y -= _Center.y;
			half x = uv.x * uv.x + uv.y * uv.y;
			half a = _Amplitude * sin(_Frequency *(x - _Offset * _Time.x));
			v.vertex.xyz += v.normal * a;
		}

		struct Input {
			float2 uv_MainTex;
			float2 uv_BumpMap;
		};
		half _Glossiness;
		half _Metallic;

		

		void surf (Input IN, inout SurfaceOutputStandard o) {
			o.Normal = UnpackNormal(tex2D(_BumpMap, IN.uv_BumpMap));
			// Albedo comes from a texture tinted by color
			fixed4 c = tex2D (_MainTex, IN.uv_MainTex);
			o.Metallic = _Metallic;
			o.Smoothness = _Glossiness;
			o.Albedo = c.rgb;
			o.Alpha = c.a;
		}
		ENDCG
	} 
	FallBack "Diffuse"
}

