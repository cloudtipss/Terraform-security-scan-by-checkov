# Terraform-security-scan-by-checkov


Enter the directory with code for s3 : 

    cd terraform/s3
    terraform init

Multiline plan, convert of plan to JSON and scan : 

    terraform plan --out tfplan.binary && \ 
    terraform show --json tfplan.binary > tfplan.json && \ 
    checkov -f tfplan.json