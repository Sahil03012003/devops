pipeline {
    agent any

    environment {
        IMAGE_NAME = 'class-registration-site'
        CONTAINER_NAME = 'class-registration-container'
        HOST_PORT = '8080'
        CONTAINER_PORT = '80'
    }

    options {
        timestamps()
    }

    stages {
        stage('Clean Workspace') {
            steps {
                echo '🧹 Cleaning workspace...'
                deleteDir()
            }
        }

        stage('Clone Repo') {
            steps {
                echo '🔄 Cloning repository...'
                checkout scm
            }
        }

        stage('Build Docker Image') {
            steps {
                echo "🐳 Building Docker image: ${IMAGE_NAME}"
                sh "docker build -t ${IMAGE_NAME} ."
            }
        }

        stage('Run Docker Container') {
            steps {
                echo "🚀 Running Docker container: ${CONTAINER_NAME}"
                sh "docker rm -f ${CONTAINER_NAME} || echo 'No existing container to remove.'"
                sh "docker run -d -p ${HOST_PORT}:${CONTAINER_PORT} --name ${CONTAINER_NAME} ${IMAGE_NAME}"
            }
        }

        stage('Verify Deployment') {
            steps {
                echo "🔍 Verifying deployment on http://localhost:${HOST_PORT}..."
                sh """
                    sleep 5
                    if curl -s --head http://localhost:${HOST_PORT} | grep '200 OK' > /dev/null; then
                        echo '✅ App is running successfully.'
                    else
                        echo '⚠️ App may not be responding as expected.'
                        exit 1
                    fi
                """
            }
        }
    }

    post {
        success {
            echo '✅ Deployment successful! Access the site at: http://localhost:8080'
        }
        failure {
            echo '❌ Deployment failed. Check the logs above.'
        }
        always {
            echo '📦 Pipeline completed.'
        }
    }
}
