using UnityEngine;
using System.Collections;

public class Dissolve : MonoBehaviour {

    public float rate = 0.5f;

    [SerializeField]
    Material burnMaterial;

    float Threshold1 = 0;
    float Threshold2 = 0;
    
    public bool BurnBabyBurn = false;

    // Use this for initialization
    void Start()
    {
        burnMaterial = GetComponent<Renderer>().material;

        if (burnMaterial.shader.name != "Custom/burn")
        {
            Destroy(this);
        }
        burnMaterial.SetFloat("_Thres1", Threshold1);
        burnMaterial.SetFloat("_Thres2", Threshold2);
    }

    // Update is called once per frame
    void Update()
    {
        if (BurnBabyBurn != false)
        {
            Threshold2 += (Time.deltaTime * rate);
            Threshold1 += (Time.deltaTime * rate) * 0.5f;

            Threshold1 = Mathf.Clamp01(Threshold1);
            Threshold2 = Mathf.Clamp01(Threshold2);


            burnMaterial.SetFloat("_Thres1", Threshold1);
            burnMaterial.SetFloat("_Thres2", Threshold2);
        }
    }
}
