pipeline {
    agent any

    environment {
        IMAGE_NAME = 'class-registration-site'
        CONTAINER_NAME = 'register-site-v2'
        PORT_MAPPING = '8081:80'
    }

    stages {
        stage('Build Docker Image') {
            steps {
                echo '🔧 Building Docker image...'
                bat "docker build -t ${env.IMAGE_NAME} ."
            }
        }

        stage('Test') {
            steps {
                echo '🧪 Running basic tests...'
                echo '✅ HTML/CSS validation or syntax checks could be added here'
                // Placeholder for actual test scripts or linters
            }
        }

        stage('Remove Existing Container') {
            steps {
                echo '🗑️ Removing existing Docker container if exists...'
                bat "docker rm -f ${env.CONTAINER_NAME} || exit 0"
            }
        }

        stage('Run Docker Container') {
            steps {
                echo '🚀 Running new Docker container...'
                bat "docker run -d -p ${env.PORT_MAPPING} --name ${env.CONTAINER_NAME} ${env.IMAGE_NAME}"
            }
        }
    }

    post {
        success {
            echo "✅ Deployment successful. Application running at http://localhost:8081"
        }
        failure {
            echo "❌ Pipeline failed. Please check the error logs."
        }
    }
}
