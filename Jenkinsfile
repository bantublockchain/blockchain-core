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

    stage('configure') {
      steps {
        sh '''./autogen.sh
./configure'''
      }
    }

    stage('build') {
      steps {
        sh 'make'
      }
    }

    stage('dockerize') {
      steps {
        sh 'docker build -t interstellartech/blockchain-core .'
      }
    }

  }
}