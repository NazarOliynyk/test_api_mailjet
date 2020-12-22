pipeline {
    agent any
    stages {
        stage('build') {
            steps {
             echo 'UPDATING bundle'
             sh "bundle exec cucumber features/"

            }
        }
    }
}