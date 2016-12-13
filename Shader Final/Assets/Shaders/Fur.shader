Shader "Unlit/Fur"
{
	Properties
	{
		_MainTex ("Texture", 2D) = "white" {}
		_Spacing ("Fur Spacing", float) = 0.5
	}
	SubShader
	{
		Tags { "RenderType"="Transparent" "Queue" = "Transparent" }
		Blend SrcAlpha OneMinusSrcAlpha
		LOD 100

		Pass
		{
			CGPROGRAM
			
			#pragma vertex vert
			#pragma fragment frag
			#define EXTRUDE 0
			#include "furhelper.cginc"

			ENDCG
		}
			Pass
		{
			CGPROGRAM

#pragma vertex vert
#pragma fragment frag
#define EXTRUDE 1
#include "furhelper.cginc"

			ENDCG
		}
			Pass
		{
			CGPROGRAM

	#pragma vertex vert
	#pragma fragment frag
	#define EXTRUDE 2
	#include "furhelper.cginc"

			ENDCG
		}
			Pass
		{
			CGPROGRAM

#pragma vertex vert
#pragma fragment frag
#define EXTRUDE 3
#include "furhelper.cginc"

			ENDCG
		}
			Pass
		{
			CGPROGRAM

#pragma vertex vert
#pragma fragment frag
#define EXTRUDE 4
#include "furhelper.cginc"

			ENDCG
		}
			Pass
		{
			CGPROGRAM

#pragma vertex vert
#pragma fragment frag
#define EXTRUDE 5
#include "furhelper.cginc"

			ENDCG
		}
			Pass
		{
			CGPROGRAM

#pragma vertex vert
#pragma fragment frag
#define EXTRUDE 6
#include "furhelper.cginc"

			ENDCG
		}
			Pass
		{
			CGPROGRAM

#pragma vertex vert
#pragma fragment frag
#define EXTRUDE 7
#include "furhelper.cginc"

			ENDCG
		}
			Pass
		{
			CGPROGRAM

#pragma vertex vert
#pragma fragment frag
#define EXTRUDE 8
#include "furhelper.cginc"

			ENDCG
		}
			Pass
		{
			CGPROGRAM

#pragma vertex vert
#pragma fragment frag
#define EXTRUDE 9
#include "furhelper.cginc"

			ENDCG
		}
				Pass
			{
				CGPROGRAM

#pragma vertex vert
#pragma fragment frag
#define EXTRUDE 10
#include "furhelper.cginc"

				ENDCG
			}
	}
}
