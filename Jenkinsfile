pipeline {
    agent any
    stages {
        stage('build') {
            steps {
                sh "bundle install"
                sh "rake cucumber:mailjet_api"
            }
        }
    }
}