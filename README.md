# CI/CD Pipeline with Integrated Security Scanning
![Jenkins](https://img.shields.io/badge/jenkins-%232C5263.svg?style=for-the-badge&logo=jenkins&logoColor=white)
![Docker](https://img.shields.io/badge/docker-%230db7ed.svg?style=for-the-badge&logo=docker&logoColor=white)
![SonarQube](https://img.shields.io/badge/SonarQube-black?style=for-the-badge&logo=sonarqube&logoColor=4E9BCD)
![Trivy](https://img.shields.io/badge/Trivy-%231904DA.svg?style=for-the-badge&logo=aquasecurity&logoColor=white)
![AWS](https://img.shields.io/badge/AWS-%23FF9900.svg?style=for-the-badge&logo=amazon-aws&logoColor=white)
![Python](https://img.shields.io/badge/python-3670A0?style=for-the-badge&logo=python&logoColor=ffdd54)
![Flask](https://img.shields.io/badge/flask-%23000.svg?style=for-the-badge&logo=flask&logoColor=white)
![GitHub](https://img.shields.io/badge/github-%23121011.svg?style=for-the-badge&logo=github&logoColor=white)

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

## Workflow Diagram

 <img width="457" height="1252" alt="Untitled Diagram drawio (7)" src="https://github.com/user-attachments/assets/7aa1ff67-45de-4e54-9bc8-3efa9a0a054c" />



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

## Documentation formatting and structure assisted by AI tools

