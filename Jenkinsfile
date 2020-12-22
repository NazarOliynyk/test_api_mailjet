pipeline {
    agent any
    stages {
        stage('build') {
            steps {
             echo 'UPDATING bundle'
              bat 'ruby --version'
              bat "bundle install"
              bat "rake"
            }
        }
    }
}