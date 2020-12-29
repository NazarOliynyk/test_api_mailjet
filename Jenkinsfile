
pipeline {
    agent any
//      agent { dockerfile true }
    stages {
        stage('build') {
            steps {
             echo 'UPDATING bundle'
              bat 'ruby --version'
              bat "bundle install"
//               bat "rake"
            }
        }
        stage('test') {
             steps {
              echo 'RUNNING tests'
                bat "rake"
             }
        }

    }

    post {
           always {
               allure([
                        includeProperties: false,
                        jdk: 'JDK 8.144',
                        properties: [],
                        reportBuildPolicy: 'ALWAYS',
                        results: [[path: 'report/allure-results']]
                    ])
           }
       }
}