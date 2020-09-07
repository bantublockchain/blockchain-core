pipeline {
  agent any

   environment {
    registry = 'interstellartech/blockchain-core'
    registryCredential = 'dockerhub-interstellartech'
  }


  stages {
    stage('init-submodules') {
      steps {
        sh '''git submodule init
git submodule update
'''
      }
    }

//     stage('configure') {
//       steps {
//         sh '''./autogen.sh --skip-submodules
// ./configure'''
//       }
//     }

    stage('build') {
      steps {
        sh 'make'
      }
    }

    stage('Building image') {
      steps{
        script {
          dockerImage = docker.build("$registry:$BUILD_NUMBER", " .")
        }
      }
    }

    stage('Deploy Image') {
      steps{
        script {
          docker.withRegistry( '', registryCredential ) {
            dockerImage.push()
            dockerImage.push('latest')
          }
        }
      }
    }

    stage('Remove Unused docker image') {
      steps{
        sh "docker rmi $registry:$BUILD_NUMBER"
      }
    }

  }
}