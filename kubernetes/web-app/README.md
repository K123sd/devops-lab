# Kubernetes Deployment

This app is designed to run on Kubernetes (e.g., AWS EKS).

## Build & Push Image (in real workflow)
```bash
# On build machine
podman build -t web-app .
podman tag web-app 123456789.dkr.ecr.us-east-1.amazonaws.com/web-app:latest
podman push 123456789.dkr.ecr.us-east-1.amazonaws.com/web-app:latest

