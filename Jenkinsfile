pipeline {
    agent any
    parameters {
//         string(name: 'FORK',        defaultValue: 'fidor',             description: "Fork of the git repository")
        string(name: 'BRANCH',      defaultValue: 'master',            description: "Branch to build")
//         string(name: 'REGISTRY',    defaultValue: 'hub.fidor.intern',  description: "Docker Registry URL ")
//         string(name: 'NAMESPACE',   defaultValue: 'fidor',             description: "Namespace for the Docker Image")
    }

    stages {
        /* Checkout the desired git branch*/
        stage('Checkout SCM') {
            steps {
                checkout scm: [
                    $class: 'GitSCM',
                    branches: [[name: '${BRANCH}']],
                    userRemoteConfigs: [[url: 'https://github.com/NazarOliynyk/test_api_mailjet.git']]
                ]
            }
        }
        /* Package the gems*/
        stage('Package the gems') {
            steps {
                sh '''#!/bin/bash -le
                  BRANCH=$BRANCH make config
                '''
            }
        }

        /* Build the Docker container image */
        stage('Build the container image') {
            steps {
                sh '''#!/bin/bash -le
                  REGISTRY=$REGISTRY NAMESPACE=$NAMESPACE BRANCH=$BRANCH make build
                '''
            }
        }

        /* Push the build container image to the Docker registry */
        stage('Push the container image to the Docker registry') {
            steps {
                script {
                    sh '''#!/bin/bash -le
                      REGISTRY=$REGISTRY NAMESPACE=$NAMESPACE BRANCH=$BRANCH make push
                      make get_commit_hash > .git/commit-id
                    '''
                    env.GIT_COMMIT = readFile('.git/commit-id').trim()
                }
            }
        }
    }
    post {
        always {
            // clean up our workspace
            sh '''#!/bin/bash -le
              NAMESPACE=$NAMESPACE BRANCH=$BRANCH make clean
            '''
            deleteDir()
        }
    }
}
