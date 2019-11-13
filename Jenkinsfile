pipeline{
  agent {
    node {
      label "docker"
    }
  }

  environment {
    registry = "imthekrish/dragonfly"
    registryCredential = 'dockerhub'
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

    stage("build/deploy docker") {
      steps{
        script {
          docker.build registry + ":$BUILD_NUMBER"
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
