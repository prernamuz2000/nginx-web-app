pipeline {
    agent any

    environment {
        DOCKER_IMAGE = "my-nginx-image"
        DOCKER_REGISTRY = "701251269124.dkr.ecr.ap-northeast-1.amazonaws.com/nginx-repro2"
        DOCKER_CREDENTIALS_ID = "08b499ab-e92b-49f3-ac96-36dce6765382"
    }

    stages {
        stage('Clone Repository') {
            steps {
                git 'https://github.com/prernamuz2000/nginx-web-app.git'
            }
        }
        stage('Build Docker Image') {
            steps {
                script {
                    docker.build("${DOCKER_IMAGE}")
                }
            }
        }
        stage('Push Docker Image') {
            steps {
                script {
                    docker.withRegistry("${DOCKER_REGISTRY}", "${DOCKER_CREDENTIALS_ID}") {
                        docker.image("${DOCKER_IMAGE}").push("latest")
                    }
                }
            }
        }
        stage('Deploy') {
            steps {
                script {
                    sh '''
                    docker pull ${DOCKER_REGISTRY}/${DOCKER_IMAGE}:latest
                    docker run -d -p 80:80 ${DOCKER_REGISTRY}/${DOCKER_IMAGE}:latest
                    '''
                }
            }
        }
    }
}
