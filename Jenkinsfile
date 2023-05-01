pipeline {
    agent any
    environment {
        DOCKER_IMAGE = 'node-todo-app'
        EC2_HOST = 'ec2-16-16-143-151.eu-north-1.compute.amazonaws.com'
        EC2_USER = 'ubuntu'
    }
    stages {
        stage('Build and Test') {
            steps {
                script {
                    sh "docker build -t node-todo-app ."
                    sh 'docker run --rm node-todo-app sh -c "npm test"'
                }
            }
        }
        stage('Deploy to EC2') {
            steps {
                sshagent(['dmpodporin-aws']) {
                    sh "ssh ${EC2_USER}@${EC2_HOST} 'docker-compose down && docker-compose pull && docker-compose up -d'"
                }
            }
        }    
    }
}