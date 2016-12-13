﻿using UnityEngine;
using System.Collections;

public class MouseClick : MonoBehaviour
{

	// Use this for initialization
	void Start ()
    {
	
	}
	
	// Update is called once per frame
	void Update ()
    {
	   if (Input.GetMouseButtonDown(0))
        {
            RaycastHit hit;
            Ray ray = Camera.main.ScreenPointToRay(Input.mousePosition);
            if (Physics.Raycast(ray, out hit))
            {
                if (hit.collider.gameObject.tag == "Burnable")
                {
                    Dissolve DissolveScript = hit.collider.gameObject.GetComponent<Dissolve>();
                    DissolveScript.BurnBabyBurn = true;
                }
            }
        }
	}
}
