using UnityEngine;
using System.Collections;

public class pants : MonoBehaviour {

    public float rate = 0.5f;

    [SerializeField]
    Material material;
    
    float saturation;


	// Use this for initialization
	void Start () {
        material = GetComponent<Renderer>().material;

        if (material.shader.name != "Custom/fancypants")
        {
            Destroy(this);
        }
        saturation = material.GetFloat("_Saturate");
	}
	
	// Update is called once per frame
	void Update () {
        saturation -= Time.deltaTime * rate;
        if (saturation < 0)
            saturation = 0;
        material.SetFloat("_Saturate", saturation);
	
	}
}
