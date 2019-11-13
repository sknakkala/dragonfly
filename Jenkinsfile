pipeline{
  agent {
    node {
      label "docker"
    }
  }

  environment {
    registry = "imthekrish/dragonfly"
    registryCredential = 'dockerhub'
    dockerImage = ''
  }

  stages {
    stage("checkout") {
      steps {
        git (
          branch: 'master',
          credentialsId: 'b6a3921a-e436-4dca-a528-1504cadf12b0',
          url: 'git@github.com:sknakkala/dragonfly.git'
        )
      }
    }

    stage("build docker image") {
      steps{
        script {
          dockerImage = docker.build registry + ":$BUILD_NUMBER"
        }
      }
    }

    stage("deploy docker image") {
      steps {
        script {
          docker.withRegistry( '', registryCredential ) {
            dockerImage.push()
          }
        }
      }
    }
  }
  post{
    always{
      deleteDir()
    }
  }
}
