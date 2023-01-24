pipeline {
    agent any
    environment{
        ID = credentials("AWS_ACCESS_KEY_ID")
        KEY = credentials("AWS_SECRET_ACCESS_KEY")
    }
    stages {
        stage('init') {
            steps {
                sh '''
                    cd terraform
                    sed -i.bak "s@Your access_key@${ID}@g" main.tf
                    sed -i.bak "s@Your secret_key@${KEY}@g" main.tf
                    terraform init -upgrade
                   
                '''
            }
        }
        stage('apply') {
            steps {
                sh '''
                    cd terraform
                    terraform -version
                    terraform plan
                '''
            }
        }
        stage('play') {
            steps {
                sh '''
                    echo 11
                '''
            }
        }
        
    }

}
