pipeline {
    agent any

    stages {
        stage('Clone Repo') {
            steps {
                echo 'Cloning repository...'
                checkout scm
            }
        }

        stage('Build Docker Image') {
            steps {
                script {
                    dockerImage = docker.build("class-registration-site", ".")
                }
            }
        }

        stage('Run Docker Container') {
            steps {
                sh 'docker rm -f class-registration-container || true'
                sh 'docker run -d -p 8080:80 --name class-registration-container class-registration-site'
            }
        }
    }

    post {
        success {
            echo 'Site deployed successfully on http://localhost:8080'
        }
        failure {
            echo 'Deployment failed!'
        }
    }
}
