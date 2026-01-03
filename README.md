# DevOps Automation Lab – RHEL on AWS

> **Infrastructure as Code + Configuration as Code**  
> Built by Vamsi Konidala — On-Prem Infrastructure Engineer transitioning to DevOps

## 🎯 Goal
Automate the deployment and hardening of a **secure, compliant RHEL 10 web server** in AWS — using only **open-source, enterprise-grade tools**.

## 🔧 Tools Used
- **Terraform**: Provision EC2 instances and security groups
- **Ansible + RHEL System Roles**: Enforce time sync (NTP) and SELinux
- **Git/GitHub**: Version-controlled, clean repository (no binaries!)
- **AWS**: Free Tier + $100 credits (cost-optimized)

## 📦 What’s Automated
1. **Infra Provisioning**  
   - RHEL 10 EC2 instance (`ami-097685573ca52aa94`)
   - Security group (SSH + HTTP)
   - SSH key pair management

2. **OS Hardening**  
   - SELinux: **Enforcing mode** (compliance-ready)
   - Time Sync: **Chrony + NTP** (log/cert integrity)

3. **Web Server** (optional)  
   - Apache (`httpd`) installed and running
   - Custom HTML page deployed

## 💡 Why This Matters
- **No manual clicks** — everything is code
- **Repeatable** across dev, staging, prod
- **Secure by default** — meets enterprise standards
- **Cost-aware** — instances destroyed after use

## ▶️ How to Reproduce
```bash
# 1. Configure AWS CLI
aws configure

# 2. Deploy infra
cd terraform/web-server
terraform apply

# 3. Harden OS
cd ../../ansible/system-roles
ansible-playbook -i remote-inventory.ini remote-baseline.yml

# 4. Clean up
terraform destroy

