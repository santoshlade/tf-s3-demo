pipeline {
    agent any

    environment {
        AWS_ACCESS_KEY_ID     = credentials('aws-access-key-id')   // Replace with your Jenkins credential ID
        AWS_SECRET_ACCESS_KEY = credentials('aws-secret-access-key')
        AWS_DEFAULT_REGION    = 'ap-southeast-2'
    }

    stages {
        //stage('Checkout') {
          //  steps {
            //    git branch: 'master', url: 'https://github.com/santoshlade/tf-s3-demo.git'
            //}
        //}

        stage('Terraform Init') {
            steps {
                bat 'terraform init'
            }
        }

        stage('Terraform Plan') {
            steps {
                bat 'terraform plan -out=tfplan -no-color'
            }
        }

        stage('Terraform Apply') {
            steps {
                bat 'terraform apply -auto-approve -no-color tfplan'
            }
        }

        //stage('Terraform Destroy') {
          //  steps {
            //    bat 'terraform destroy -auto-approve -no-color'
            //}
        //}
    }
}
