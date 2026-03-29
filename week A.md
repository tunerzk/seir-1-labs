
Instructions:

Follow the instructor's guidance for how to make a homepage with a VM.

If you use GCP CLI then: gcloud init
You need to select default Region and project.

Show your work:
1) Browser proof
        Open: http://<EXTERNAL_IP>/
  <img width="1482" height="653" alt="Screenshot 2026-03-14 173920" src="https://github.com/user-attachments/assets/882addb0-78fb-4a8a-8531-cdc5cb6ddd36" />
  <img width="1474" height="630" alt="image" src="https://github.com/user-attachments/assets/4e962467-58a1-4787-8f15-d2441eba1b9b" />

 



3) at the end of the lesson, SSH into your VM and curl it
    curl localhost
    curl -s localhost | head
  <img width="1110" height="497" alt="image" src="https://github.com/user-attachments/assets/2cc55de8-f9c7-4dff-9fce-cadc815b6230" />
  <img width="1088" height="808" alt="image" src="https://github.com/user-attachments/assets/36007d66-1933-4dbc-affb-2c5327046ef2" />
  <img width="1059" height="233" alt="image" src="https://github.com/user-attachments/assets/0b373bc0-a9d7-4657-a596-b408d3e47006" />


 
   

5) Service Proof
    systemctl status nginx --no-pager
  <img width="1264" height="309" alt="image" src="https://github.com/user-attachments/assets/2ad72a34-5612-4f30-b0de-c801ff20356a" />
 

Bonus: For the fearless who want some head.

If you want the page to refresh every 10 seconds (extra dopamine):

Add this inside <head>:
    <meta http-equiv="refresh" content="10">

If you use supera.sh then....


1) Machine proof
        curl -s localhost/healthz
   <img width="704" height="103" alt="image" src="https://github.com/user-attachments/assets/1a165add-6a9e-412d-b349-7ea4a0e6ef8c" />


3) Engineer proof 
        curl -s localhost/metadata | jq .
 <img width="732" height="120" alt="image" src="https://github.com/user-attachments/assets/d1189293-6caa-4748-87d7-451b74482e42" />
 That means NGINX is running, but there is no file named /var/www/html/metadata, so the lab’s “Engineer Proof” endpoint doesn’t exist yet.
<img width="913" height="197" alt="image" src="https://github.com/user-attachments/assets/47dec8d9-36fa-40bc-a1d5-b697d6661014" />
**** RESTART NGINX****    sudo systemctl restart nginx
   <img width="1053" height="148" alt="image" src="https://github.com/user-attachments/assets/a2a813ac-ac84-4e18-84f6-3691f08623c6" />

   ****UPDATE METADATA***
   <img width="1110" height="253" alt="image" src="https://github.com/user-attachments/assets/8e65e479-74fc-4922-afb8-ec6f3f64c6c8" />


   
  | Check | Command | Expected |
| --- | --- | --- |
| Machine Proof | ``curl ``-s ``localhost/healthz`` | ``ok`` |
| Engineer Proof | `curl -s localhost/metadata | jq .` | Valid JSON | 

Beautiful — that output means your **Engineer Proof is officially PASSED**.

Here’s what your VM just proved:

```json
{
  "engineer": "true",
  "level": "1",
  "mission": "automation"
}
```

That’s exactly the structured JSON the lab expects. Your metadata endpoint is working, NGINX is serving it correctly, and `jq` is parsing it cleanly. Nicely done.

If your `/healthz` endpoint is also returning the expected value, then both validation checks are complete and your lab environment is fully operational.

If you want to keep leveling this up — maybe automate these endpoints in your startup script, add versioning, or build out the next mission — I’m ready to help you push it further.



  
   

SEIR-I Lab 1 Gate Philosophy 

Real engineers never say: --> “It works on my screen.”

They prove:
                The service is reachable
                The health endpoint works
                The metadata endpoint returns valid JSON
                The deployed infrastructure identifies itself

So the gate script checks exactly those things.

Lab 1 Gate Script
Find it here: --> hhttps://github.com/BalericaAI/SEIR-1/blob/main/weekly_lessons/weeka/script/gate_gcp_vm_http_ok.sh
#NOTE!!!! You need to find the IP and change it! 
<img width="1219" height="110" alt="image" src="https://github.com/user-attachments/assets/e64c8226-213e-48a6-a9f2-306f06674c5e" />



Run it like this!
                VM_IP=34.82.55.21 ./gate_gcp_vm_http_ok.sh
Remember, 34.82.55.21 is an example!! That's not your IP!  You have to find your own IP!  Don't ask the teach about this!!
<img width="955" height="170" alt="image" src="https://github.com/user-attachments/assets/ffc43709-bf65-453c-925b-7867a4f95fe8" />



Example output:
                Lab 1 Gate Result: PASS
                
                PASS: Homepage reachable (HTTP 200)
                PASS: /healthz endpoint returned 'ok'
                PASS: /metadata returned valid JSON
                PASS: metadata contains instance_name
                PASS: metadata contains region

Files created:
                gate_result.json
                badge.txt

Example gate_result.json

                {
                  "lab": "SEIR-I Lab 1",
                  "target": "34.82.55.21",
                  "status": "PASS",
                  "details": [
                    "PASS: Homepage reachable (HTTP 200)",
                    "PASS: /healthz endpoint returned 'ok'",
                    "PASS: /metadata returned valid JSON"
                  ],
                  "failures": []
                }

*****BADGE TEXT****
<img width="706" height="63" alt="image" src="https://github.com/user-attachments/assets/64060aa4-7c55-4c93-9d40-e9821ce41fe7" />














         
               
