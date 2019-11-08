pipeline{
  agent {
    node {
      label "any"
    }
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
    stage("build docker image"){
      steps{
        sh "docker build . -t dragon-app"
      }
    }
  }
}
