pipeline {
  environment {
    imagename = "phoomrapee/jenkins-pipleine"
    // registryCredential = 'yenigul-dockerhub'
    registryCredential = 'phoomrapee-dockerhub'
    dockerImage = ''
  }
  agent any
  stages {
    stage('Cloning Git') {
      steps {
        git([url: 'https://github.com/phoomrapee-pee/test-jenkins-dockerhub.git', branch: 'main', credentialsId: '3453c3ef-eda2-49d5-843a-bbdb06bd8c1a'])
      }
    }
    stage('Building image') {
      steps{
        script {
          dockerImage = docker.build imagename
        }
      }
    }
    stage('Deploy Image') {
      steps{
        script {
          docker.withRegistry( '', registryCredential ) {
            dockerImage.push("$BUILD_NUMBER")
             dockerImage.push('latest')

          }
        }
      }
    }
    stage('Remove Unused docker image') {
      steps{
        sh "docker rmi $imagename:$BUILD_NUMBER"
         sh "docker rmi $imagename:latest"

      }
    }
  }
}


// # You Must install pulgin Dockerrrrrrrr