pipeline {
    agent any

    environment {
        IMAGE_NAME = 'class-registration-site'
        CONTAINER_NAME = 'class-registration-container'
    }

    stages {
        stage('Clone Repo') {
            steps {
                echo 'Cloning repository...'
                checkout scm
            }
        }

        stage('Build Docker Image') {
            steps {
                echo "Building Docker image..."
                sh "docker build -t ${IMAGE_NAME} ."
            }
        }

        stage('Run Docker Container') {
            steps {
                echo "Running Docker container..."
                sh "docker rm -f ${CONTAINER_NAME} || true"
                sh "docker run -d -p 8080:80 --name ${CONTAINER_NAME} ${IMAGE_NAME}"
            }
        }
    }

    post {
        success {
            echo '✅ Site deployed successfully on http://localhost:8080'
        }
        failure {
            echo '❌ Deployment failed!'
        }
    }
}
