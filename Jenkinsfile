pipeline {
    agent any

    stages {
        stage('Build Docker Image') {
            steps {
                echo '📳 Building Docker image: class-registration-site'
                bat 'docker build -t class-registration-site .'
            }
        }

        stage('Run Docker Container') {
            steps {
                echo '🚀 Running Docker container...'
                bat 'docker run -d -p 8081:80 --name class-registration-container class-registration-site'
            }
        }

        stage('Verify Deployment') {
            steps {
                echo '🔍 Verifying deployment...'
                bat 'curl http://localhost:8081'
            }
        }
    }

    post {
        success {
            echo '✅ Deployment succeeded.'
        }
        failure {
            echo '❌ Deployment failed. Check the logs above.'
        }
    }
}
