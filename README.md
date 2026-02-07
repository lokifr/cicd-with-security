# CI/CD Pipeline with Integrated Security Scanning

A fully automated CI/CD pipeline for a Python Flask application with security scanning, code quality analysis, and containerized deployment on AWS.

## Overview

This project demonstrates a production-ready CI/CD workflow that automatically builds, tests, scans, and deploys a containerized web application. Every code push triggers an automated pipeline that ensures code quality and security before deployment.

## What I Built

**Infrastructure & Pipeline**
- Set up Jenkins on AWS EC2 as the CI/CD orchestrator
- Configured automated GitHub webhooks to trigger builds on every push
- Deployed SonarQube for continuous code quality monitoring
- Integrated Trivy for container vulnerability scanning

**Automation & Deployment**
- Containerized the Flask application with Docker
- Implemented automatic versioning and tagging of Docker images
- Automated deployment workflow: stops old container, pulls new image, and deploys updated version
- Configured all services (Jenkins, SonarQube, App Server) to work together seamlessly

**Security & Quality**
- Static code analysis with SonarQube to catch code smells and maintainability issues
- Container image scanning with Trivy to identify vulnerabilities before deployment
- Pipeline fails if critical security issues are detected

## Pipeline Workflow

1. **Source Code Checkout** - Jenkins pulls latest code from GitHub
2. **Code Quality Analysis** - SonarQube scans for code quality and technical debt
3. **Build & Tag** - Docker image is built with automated version tagging
4. **Security Scan** - Trivy scans the Docker image for vulnerabilities
5. **Deploy** - If all checks pass, old container is stopped and new version is deployed

## Technologies Used

- **Jenkins** - CI/CD automation server
- **Docker** - Containerization platform
- **SonarQube** - Code quality and security analysis
- **Trivy** - Container vulnerability scanner
- **Git & GitHub** - Version control and webhooks
- **Python (Flask)** - Application framework
- **AWS EC2** - Cloud infrastructure (Ubuntu)

## Repository Structure

```
cicd-secured/
├── Jenkinsfile                 # Pipeline definition
├── Dockerfile                  # Container image specification
├── sonar-project.properties    # SonarQube configuration
├── app/
│   └── main.py                # Flask application
├── requirements.txt            # Python dependencies
└── tests/                     # Test files
```

## Key Achievements

✅ Fully automated pipeline from code push to production deployment  
✅ Zero-downtime deployments with container orchestration  
✅ Integrated security scanning at the container level  
✅ Code quality gates to maintain high standards  
✅ Multi-server architecture (Jenkins, SonarQube, App Server)
