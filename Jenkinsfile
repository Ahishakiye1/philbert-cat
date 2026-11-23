pipeline {
    agent any

    environment {
        DOCKER_IMAGE = "<your-dockerhub-username>/philbert-cat"
        IMAGE_TAG = "V6"
    }

    stages {
        stage('Checkout') {
            steps {
                git branch: 'main', url: 'https://github.com/ahishakiye1/philbert-cat.git'
            }
        }

        stage('Build') {
            steps {
                echo 'Building Docker image with suffix V6...'
                sh 'docker build -t ${DOCKER_IMAGE}:${IMAGE_TAG} .'
            }
        }

        stage('Automated Testing') {
            steps {
                echo 'Running automated test suite...'
                sh './test.sh'
            }
        }

        stage('Push to Docker Hub') {
            steps {
                echo 'Pushing V6 image to Docker Hub...'
                withCredentials([usernamePassword(credentialsId: 'dockerhub-creds', usernameVariable: 'DOCKER_USER', passwordVariable: 'DOCKER_PASS')]) {
                    sh 'echo "$DOCKER_PASS" | docker login -u "$DOCKER_USER" --password-stdin'
                    sh 'docker push ${DOCKER_IMAGE}:${IMAGE_TAG}'
                }
            }
        }

        stage('Deploy to Kubernetes') {
            steps {
                echo 'Deploying to Kubernetes...'
                sh 'kubectl apply -f deployment.yaml'
                sh 'kubectl apply -f service.yaml'
            }
        }
    }
}
