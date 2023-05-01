pipeline {
    agent any
    environment {
        DOCKER_IMAGE = 'node-todo-app'
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