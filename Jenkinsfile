pipeline {
    agent any
    
    environment {
        DOCKER_IMAGE = "python-cicd-app"
        CONTAINER_NAME = "python-app"
        APP_PORT = "5000"
    }
    
    stages {
        stage('Checkout Code') {
            steps {
                checkout scm
            }
        }
        
        stage('SonarQube Analysis') {
            steps {
                script {
                    def scannerHome = tool 'SonarScanner'
                    withSonarQubeEnv('SonarQube') {
                        sh "${scannerHome}/bin/sonar-scanner"
                    }
                }
            }
        }
        
        stage('Build Docker Image') {
            steps {
                script {
                    sh """
                        docker build -t ${DOCKER_IMAGE}:${BUILD_NUMBER} .
                        docker tag ${DOCKER_IMAGE}:${BUILD_NUMBER} ${DOCKER_IMAGE}:latest
                    """
                }
            }
        }
        
        stage('Trivy Security Scan') {
            steps {
                script {
                    sh """
                        mkdir -p .trivycache
                        docker run --rm \
                          -v /var/run/docker.sock:/var/run/docker.sock \
                          -v ${WORKSPACE}/.trivycache:/root/.cache/ \
                          aquasec/trivy:0.57.1 image \
                          --exit-code 1 --severity CRITICAL --ignore-unfixed \
                          ${DOCKER_IMAGE}:${BUILD_NUMBER}
                    """
                }
            }
        }
        
        stage('Deploy Application') {
            steps {
                script {
                    sh """
                        docker stop ${CONTAINER_NAME} || true
                        docker rm ${CONTAINER_NAME} || true
                        docker run -d --name ${CONTAINER_NAME} -p ${APP_PORT}:5000 ${DOCKER_IMAGE}:${BUILD_NUMBER}
                    """
                }
            }
        }
    }
    
    post {
        success {
            echo 'Pipeline executed successfully!'
        }
        failure {
            echo 'Pipeline failed!'
        }
    }
}
