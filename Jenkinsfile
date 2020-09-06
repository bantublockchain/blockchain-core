pipeline {
  agent any
  stages {
    stage('init-submodules') {
      steps {
        sh '''git submodule init
git submodule update
'''
      }
    }

  }
}