SEIR-I Lab 2 (GCP Terraform) — Iowa VM + Startup Script + Port 80
Goal

Students will deploy the Lab 1 VM stack via Terraform:
    Compute Engine VM
    Firewall rule to allow HTTP (port 80)
    Startup script installs nginx + serves the ops panel (/, /healthz, /metadata)
    Region/zone in Iowa (us-central1-a by default)
    <img width="1218" height="406" alt="image" src="https://github.com/user-attachments/assets/79d7e699-7899-4e25-9a53-8c7fadeba26a" />
    <img width="1516" height="286" alt="image" src="https://github.com/user-attachments/assets/cf646e33-f7be-471a-b129-2eae8d8ecef9" />
    <img width="1467" height="649" alt="image" src="https://github.com/user-attachments/assets/f6b884bc-9251-414b-a5f5-9fafcc410f5a" />
    <img width="1355" height="402" alt="image" src="https://github.com/user-attachments/assets/8c2d361a-4ad3-48ce-993c-199210b292c6" />
    <img width="1232" height="691" alt="image" src="https://github.com/user-attachments/assets/812f5681-2823-4d3d-9120-b36e78a5b046" />





    

Workforce relevance

This is the real transition from “click ops” to “cloud engineer”:
    reproducible deployments
    version-controlled infrastructure
    predictable changes
    reviewable diff

1) Follow instructions for adding terraform files to a folder.
2) Add security .json file to the folder.
3) From the command line, do the following:

        terraform init
        terraform validate
        terraform plan -out tfplan
        terraform apply tfplan

        terraform output vm_url
 <img width="536" height="94" alt="image" src="https://github.com/user-attachments/assets/23ac3bf3-58f9-409a-9b21-11070292a773" />
  

Find the URL and open it in your browser.
<img width="1790" height="742" alt="image" src="https://github.com/user-attachments/assets/9fdf9446-b303-4567-9f70-559fd7c8befe" />


All GAtes:
Find it, Run it: --> https://github.com/BalericaAI/SEIR-1/blob/main/weekly_lessons/weekb/python/gate_lab2_http.sh

CLI
    VM_IP=$(terraform output -raw vm_external_ip)
    VM_IP="$VM_IP" ./gate_lab2_http.sh
    <img width="1203" height="360" alt="image" src="https://github.com/user-attachments/assets/5b782875-f0c1-4529-baac-edc138c2bccc" />


    Deliverables

Students submit:
    main.tf (and/or split files)
    terraform plan output saved as plan.txt
    <img width="726" height="316" alt="image" src="https://github.com/user-attachments/assets/aaab6dbc-e48f-4d1a-b1bc-5f84de34b669" />
    <img width="414" height="399" alt="image" src="https://github.com/user-attachments/assets/00eee162-c7b4-4dd9-8e9d-727e444bb33a" />

    terraform apply proof (screenshot or terminal output)
 <img width="1132" height="261" alt="image" src="https://github.com/user-attachments/assets/de1d05e8-9943-4123-b0fa-2b14b47b3c4b" />

    gate_result.json + badge.txt from the gate script
    VM URL proof: homepage loads on port 80
<img width="1238" height="151" alt="image" src="https://github.com/user-attachments/assets/3b386d51-04ba-425f-bed9-ba9abf0ee6f6" />


   🌟 Lab 2 Summary — GCP Compute Engine + Terraform Deployment
For this lab, I deployed a fully automated web server on Google Cloud Platform using Terraform. I created a Compute Engine VM, attached metadata, and used a startup script to configure an NGINX web server that serves both a custom HTML banner and a dynamic /metadata JSON endpoint. I also implemented a /healthz endpoint for basic health checks.

During deployment, I resolved several issues including incorrect project ID input, disabled Compute Engine API, and a failing startup script caused by Windows line endings and heredoc misuse. After converting the script to Unix format and loading it properly with Terraform’s file() function, the VM deployed successfully and NGINX started as expected.

The final deliverables include the public VM URL, working /healthz and /metadata endpoints, screenshots of the rendered web page, and the Terraform configuration files (main.tf, variables.tf, outputs.tf, and startup.sh). This lab reinforced key concepts in infrastructure-as-code, metadata usage, automation, and debugging cloud-init/startup scripts. 



