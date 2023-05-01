pipeline {
    agent any
    environment {
        DOCKER_IMAGE = 'node-todo-app'
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
    }
}