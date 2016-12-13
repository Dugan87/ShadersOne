using UnityEngine;
using System.Collections;

public class wind : MonoBehaviour {

    Material material;

    public Vector4 start = Vector4.zero;
    public Vector4 end = Vector4.zero;

    float t;
    int sign = 1;

    // Use this for initialization
    void Start ()
    {
        material = GetComponent<MeshRenderer>().material;

        if (material.shader.name != "Custom/bendy")
            Destroy(this);	
	}
	
	// Update is called once per frame
	void Update ()
    {
        t += sign * Time.deltaTime;
        if (t > 1)
        {
            sign = -1;
            t = 1;
        }
        else if (t < 0)
        {
            sign = 1;
            t = 0;
        }
        Vector4 lerp = Vector4.Lerp(start, end, t);
        material.SetVector("_ControlPoint", lerp);
	
	}
}
