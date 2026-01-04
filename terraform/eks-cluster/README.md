# EKS Cluster (ap-south-2)

Provisioned via Terraform. Confirmed ACTIVE in AWS.

Due to limited RAM on lab instance (907 MB), kubectl commands fail locally.
In production, deployment would be done via CI/CD pipeline.

To verify:
```bash
aws eks describe-cluster --name devops-lab-eks --region ap-south-2 --query 'cluster.status'
