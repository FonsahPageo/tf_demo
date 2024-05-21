pipeline {
    parameters {
        booleanParam(name: 'autoApprove', defaultValue: false, description: 'Automatically run apply after generating plan')
    }
    agent any
    stages {
        stage('Checkout') {
            steps {
                checkout([$class: 'GitSCM', branches: [[name: '*/main']], extensions: [], userRemoteConfigs: [[url: 'https://github.com/FonsahPageo/tf_demo.git']]])
            }
        }
        stage('Terraform Init') {
            steps {
                sh 'terraform init'
            }
        }
        // stage('Terraform Plan') {
        //     steps {
        //         sh 'terraform plan'
        //     }
        // }
        stage('Terraform Apply') {
            steps {
                sh 'terraform apply -auto-approve'
            }
        }
        // stage('Terraform Destroy') {
        //     steps {
        //         script {
        //             dir('path/to/terraform/config') {
        //                 // Execute 'terraform destroy' to destroy the infrastructure
        //                 sh 'terraform destroy -auto-approve'
        //             }
        //         }
        //     }
        // }
    }
}