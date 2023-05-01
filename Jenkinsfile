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
                    docker.withRegistry('https://registry.hub.docker.com', 'docker-creds') {
                        dockerImage.push()
                    }
                }
            }
        }
        // stage('Deploy to EC2') {
        //     steps {
        //         sshagent(['ssh-key']) {
        //             sh '''
        //                 ssh -o StrictHostKeyChecking=no ${SSH_USER}@${SSH_HOST} << EOF
        //                     cd /home/ec2-user/node-todo-app
        //                     docker-compose stop
        //                     docker-compose rm -f
        //                     docker-compose pull
        //                     docker-compose up -d
        //                 EOF
        //             '''
        //         }
        //     }
        // }
        // stage('Check') {
        //     steps {
        //         sh "curl -f ${HEALTH_CHECK_URL}"
        //     }
        // }
        // stage('Notifications') {
        //     steps {
        //         catchError(buildResult: 'FAILURE', stageResult: 'FAILURE') {
        //             emailext(
        //                 subject: 'Node.js app is not healthy',
        //                 body: 'Please check the application logs for errors.',
        //                 to: 'user@example.com',
        //                 attachLog: true,
        //             )
        //         }
        //     }
        // }
    }
}
