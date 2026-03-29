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

Find the URL and open it in your browser.
<img width="1790" height="742" alt="image" src="https://github.com/user-attachments/assets/9fdf9446-b303-4567-9f70-559fd7c8befe" />


All GAtes:
Find it, Run it: --> https://github.com/BalericaAI/SEIR-1/blob/main/weekly_lessons/weekb/python/gate_lab2_http.sh

CLI
    VM_IP=$(terraform output -raw vm_external_ip)
    VM_IP="$VM_IP" ./gate_lab2_http.sh

    Deliverables

Students submit:
    main.tf (and/or split files)
    terraform plan output saved as plan.txt
    terraform apply proof (screenshot or terminal output)
    <img width="1132" height="261" alt="image" src="https://github.com/user-attachments/assets/de1d05e8-9943-4123-b0fa-2b14b47b3c4b" />

    gate_result.json + badge.txt from the gate script
    VM URL proof: homepage loads on port 80



