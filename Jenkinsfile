pipeline {
    agent any
    stages {
        stage('build') {
            steps {
             echo 'UPDATING bundle'
                sh "bundle install"
//                 sh "rake cucumber:mailjet_api"
            }
        }
    }
}