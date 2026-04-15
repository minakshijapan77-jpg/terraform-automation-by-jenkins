pipeline {
    agent any

    parameters {
        choice(
            name: 'ACTION',
            choices: ['plan', 'apply'],
            description: 'Select the action to perform'
        )
        string(
            name: 'BRANCH',
            defaultValue: 'master',
            description: 'Enter the branch name to checkout'
        )
    }

    stages {
        stage('Checkout') {
            steps {
                checkout scmGit(
                    branches: [[name: "*/${params.BRANCH}"]],
                    userRemoteConfigs: [[
                        url: 'https://github.com/minakshijapan77-jpg/terraform-automation-by-jenkins.git'
                    ]]
                )
            }
        }

        stage('Clean') {
            steps {
                sh 'rm -rf .terraform .terraform.lock.hcl'
            }
        }

        stage("terraform init") {
            steps {
                sh "terraform init -reconfigure"
            }
        }

        stage("Action") {
            steps {
                script {
                    if (params.ACTION == 'plan') {
                        sh "terraform plan"
                    } else {
                        sh "terraform apply --auto-approve"
                    }
                }
            }
        }
    }
}