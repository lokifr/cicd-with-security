# Automated CI/CD Pipeline with Security (Jenkins + Docker)

This repository contains a starter Python app and a Jenkins pipeline that implements:
- GitHub webhook-triggered build
- Unit tests with `pytest`
- SonarQube static analysis + Quality Gate enforcement
- Trivy filesystem and Docker image vulnerability scans
- Docker image build and push to Docker Hub
- Deployment to AWS EC2 over SSH

## Tech Stack
- Jenkins
- Docker
- Git + GitHub
- SonarQube
- Trivy
- Python (Flask)
- AWS EC2

## Repository Structure
- `app/main.py`: Python web app
- `tests/test_app.py`: Unit test
- `Dockerfile`: Container build file
- `Jenkinsfile`: CI/CD pipeline
- `scripts/deploy.sh`: Remote deployment script for EC2
- `sonar-project.properties`: SonarQube project settings

## Jenkins Prerequisites
Install plugins:
- Pipeline
- Git
- GitHub Integration
- Docker Pipeline
- SonarQube Scanner
- SSH Agent
- Workspace Cleanup
- ANSI Color

Configure global tools:
- JDK named `jdk17`
- Sonar Scanner named `sonar-scanner`
- SonarQube server named `sonarqube-server`

Add credentials:
- `dockerhub-creds` (username/password or token)
- `ec2-ssh-key` (SSH private key)

## Required Edits Before First Run
Update `Jenkinsfile`:
- `GITHUB_REPO_URL` -> your GitHub repository URL, e.g. `https://github.com/lokesh123/cicd-secured.git`
- `GITHUB_BRANCH` -> branch to build, usually `main`
- `GITHUB_CREDENTIALS_ID` -> Jenkins credential ID for private repos (leave empty for public repos)
- `DOCKERHUB_REPO` -> your Docker Hub image repo, e.g. `lokesh123/cicd-secured-app`
- `EC2_HOST` -> your EC2 SSH target, e.g. `ec2-user@ec2-11-22-33-44.compute-1.amazonaws.com`

Update `sonar-project.properties`:
- `sonar.projectKey`
- `sonar.projectName`

## AWS EC2 Setup
Run once on EC2:

```bash
sudo yum update -y || sudo apt update -y
sudo yum install -y docker || sudo apt install -y docker.io
sudo systemctl enable --now docker
sudo usermod -aG docker ec2-user || true
```

Then log out and log in again.

Allow inbound traffic in security group:
- `22/tcp` for SSH (restricted source)
- `80/tcp` for app access

## GitHub Webhook
Set webhook in your GitHub repository:
- Payload URL: `http://<jenkins-host>:8080/github-webhook/`
- Content type: `application/json`
- Events: `Just the push event`

## Pipeline Stages
1. Checkout
2. Unit Tests
3. SonarQube Analysis
4. Quality Gate
5. Trivy Filesystem Scan
6. Build Docker Image
7. Trivy Image Scan
8. Push Image
9. Deploy to EC2

## Local Quick Test
```bash
python -m venv .venv
source .venv/bin/activate
pip install -r requirements.txt
pytest -q
python app/main.py
```

## Security Upgrades You Can Add Next
- `pip-audit` stage for Python dependency CVEs
- Container image signing (cosign)
- Least-privilege IAM + restricted security groups
- Branch protection requiring CI checks before merge
