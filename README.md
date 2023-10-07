# Terraform-security-scan-by-checkov


Enter the directory with code for s3 : 

    cd terraform/s3
    terraform init

Multiline plan, convert of plan to JSON and scan : 

    terraform plan --out tfplan.binary && \ 
    terraform show --json tfplan.binary > tfplan.json && \ 
    checkov -f tfplan.json

# Github action for using checkov 

Fie : .github/workflows/tf-checkov.yml

Runs a github actions pipeline in the terraform/s3
If any of the security checks fail, build will fail

Example of output : 

    terraform_plan scan results:

    Passed checks: 4, Failed checks: 1, Skipped checks: 0

    Check: CKV_AWS_93: "Ensure S3 bucket policy does not lockout all but root user. (Prevent lockouts needing root account fixes)"
            PASSED for resource: aws_s3_bucket.example
            File: /tfplan.json:0-0
            Guide: https://docs.paloaltonetworks.com/content/techdocs/en_US/prisma/prisma-cloud/prisma-cloud-code-security-policy-reference/aws-policies/s3-policies/bc-aws-s3-24.html
    Check: CKV_AWS_53: "Ensure S3 bucket has block public ACLS enabled"
            PASSED for resource: aws_s3_bucket_public_access_block.example_block
            File: /tfplan.json:0-0
            Guide: https://docs.paloaltonetworks.com/content/techdocs/en_US/prisma/prisma-cloud/prisma-cloud-code-security-policy-reference/aws-policies/s3-policies/bc-aws-s3-19.html
    Check: CKV_AWS_54: "Ensure S3 bucket has block public policy enabled"
            PASSED for resource: aws_s3_bucket_public_access_block.example_block
            File: /tfplan.json:0-0
            Guide: https://docs.paloaltonetworks.com/content/techdocs/en_US/prisma/prisma-cloud/prisma-cloud-code-security-policy-reference/aws-policies/s3-policies/bc-aws-s3-20.html
    Check: CKV_AWS_55: "Ensure S3 bucket has ignore public ACLs enabled"
            PASSED for resource: aws_s3_bucket_public_access_block.example_block
            File: /tfplan.json:0-0
            Guide: https://docs.paloaltonetworks.com/content/techdocs/en_US/prisma/prisma-cloud/prisma-cloud-code-security-policy-reference/aws-policies/s3-policies/bc-aws-s3-21.html
    Check: CKV_AWS_56: "Ensure S3 bucket has 'restrict_public_bucket' enabled"
            FAILED for resource: aws_s3_bucket_public_access_block.example_block
            File: /tfplan.json:0-0
            Guide: https://docs.paloaltonetworks.com/content/techdocs/en_US/prisma/prisma-cloud/prisma-cloud-code-security-policy-reference/aws-policies/s3-policies/bc-aws-s3-22.html


## Checkov scan a HELM chart


Example helm chart, created with '''helm create''' test apps command

    checkov --directory  ./helm-chart/test-app/ --compact


## Checkov create config file 


    checkov --directory  ./helm-chart/test-app/ --compact --skip-check CKV_K8S_20 --create-config ./helm-chart/test-app/checkov.dev.yml

## Checkov use config file create above
    checkov --config-file ./helm-chart/test-app/checkov.dev.yml


Link to a [Blog post on Checkov ]( http://localhost:8000/Terraform-security-scan-by-checkov/)  