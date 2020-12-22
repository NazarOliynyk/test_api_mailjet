pipeline {
    agent any
    stages {
        stage('build') {
            steps {
             echo 'UPDATING bundle'
             sh "rake"
//              sh "gem install bundler"
//              sh "bundle install"
//                 sh "rake cucumber:mailjet_api"
            }
        }
    }
}