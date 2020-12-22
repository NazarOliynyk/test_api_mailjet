pipeline {
    agent any
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
        stage('Publish') {
               steps{
                echo 'PUBLISHING Allure report'
                               publishHTML(
                                       target: [
                                               allowMissing         : false,
                                               alwaysLinkToLastBuild: false,
                                               keepAll              : true,
                                               reportDir            : 'report/allure-report',
                                               reportFiles          : 'index.html',
                                               reportName           : "Allure Report",
                                               results              : [[path: 'report/allure-results']]
                                       ]
                               )
                           }
               }

    }
}