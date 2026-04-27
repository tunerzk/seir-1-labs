Deploy a proof-of-concept (POC) static website that is entirely automated with GCS (a GCP bucket) with some sample static assets I provide and an image of your choosing.

BASIC SETUP:
Navigate to where you want to do this project.
Make a folder for it if needed. This folder cannot be inside an existing local Git repo.
Open VS Code.
Open the terminal in VS Code.
Use pwd to make sure you are in the right folder.
Run this command to download the needed assets: curl https://raw.githubusercontent.com/aaron-dm-mcdonald/class7.5-notes/refs/heads/main/week-7/bam/download-assets.sh | sh
Make your provider.tf, backend.tf, and such as we have done in class.
Make a basic bucket in a main.tf file (or whatever you call it).
Make sure it works.
Get the static assets in the bucket with Terraform, one at a time, testing each time.
Make the bucket publicly accessible and make sure a friend in class can access the objects from their computer.
Adjust the settings on the bucket for static website hosting.
Work on the output for the index page's URL.

FOLLOW UP QUESTIONS:
When you are done, ideally you can answer the following:

Is Terraform a good tool to provision buckets?
Is Terraform an ideal tool to upload objects into buckets? Why or why not?
Explain how you wrote the output (if you did). The output can be challenging.
IAM and access:
Did you need uniform bucket-level access? Do you know what it does?
Explain the IAM resource. Why is it needed? Was it hard to implement? Did the hints help?
What setting did you change to enable static website hosting on the bucket?
What changes could improve this infrastructure?
