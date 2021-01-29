pipeline {
  environment {
    registryCredential = 'DockerHub'
  }
  agent any
  stages {
    stages('Build') {
      steps {
        sh "docker-compose up -d"
      }
    }
    stages('Test') {
      steps {
        sh "docker-compose run --service-ports vidly-frontend npm test -- --forceExit"
      }
    }
    stages('Publish') {
      steps {
        script {
          docker.withRegistry( '', registryCredential ) {
            sh "docker tag ${DOCKERHUB_USERNAME}/vidly-frontend:${BUILD_NUMBER} ${DOCKERHUB_USERNAME}/vidly-frontend:latest"
            sh "docker push ${DOCKERHUB_USERNAME}/vidly-frontend:latest"
            sh "docker push ${DOCKERHUB_USERNAME}/vidly-frontend:${BUILD_NUMBER}"
          }
        }
      }
    }
  }
  post {
    cleanup {
      sh "docker-compose down --rmi all"
    }
  }
}
