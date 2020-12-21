// node {
//
//     stage ('Clone') {
//       checkout scm
//     }
//     stage ('Build') {
//         sh 'gem install bundler'
//         sh 'bundle install'
//
//         sh 'rake cucumber:mailjet_api'
//     }
//
//     stage ('Tests') {
//
//     }
//
// }

// pipeline {
//
//   agent { docker { image 'ruby:2.6.1' } }
//
//   stages {
//     stage('requirements') {
//       steps {
//         echo 'Installing Bundler ....'
//         sh 'gem install bundler'
//       }
//     }
//
//     stage('build') {
//       steps {
//         echo 'Building project ....'
//         sh 'bundle install'
//       }
//     }
//
//     stage('test') {
//       steps {
//         echo 'Testing project ....'
//         sh 'rake cucumber:mailjet_api'
//       }
//     }
//
//     stage('Publish') {
//             echo 'Publish Allure report ....'
//             publishHTML(
//                     target: [
//                             allowMissing         : false,
//                             alwaysLinkToLastBuild: false,
//                             keepAll              : true,
//                             reportDir            : 'report/allure-results',
//                             reportFiles          : 'index.html',
//                             reportName           : "Allure Report"
//                     ]
//             )
//         }
//
//  }

pipeline {
    agent any
    stages {
           stage('requirements') {
             steps {
               echo 'Installing Bundler ....'
               sh 'gem install bundler'
             }
           }

           stage('build') {
             steps {
               echo 'Building project ....'
               sh 'bundle install'
             }
           }

           stage('test') {
             steps {
               echo 'Testing project ....'
               sh 'rake cucumber:mailjet_api'
             }
           }
    }
}