pipeline {
    agent any
    environment {
        DOCKER_IMAGE = 'node-todo-app'
        SSH_KEY = credentials('ssh-key')
        SSH_USER = 'ubuntu'
        SSH_HOST = 'ec2-16-16-143-151.eu-north-1.compute.amazonaws.com'
        // HEALTH_CHECK_URL = 'http://ec2-instance:3000/health'
    }
    stages {
        stage('Build and Test') {
            steps {
                script {
                    docker.build(DOCKER_IMAGE, '.')
                    }
            }
        }
    }
}
