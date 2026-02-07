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
        
        stage('Quality Gate') {
            steps {
                timeout(time: 12, unit: 'MINUTES') {
                    waitForQualityGate abortPipeline: false
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
                        trivy image --exit-code 1 --severity HIGH,CRITICAL ${DOCKER_IMAGE}:${BUILD_NUMBER}
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
