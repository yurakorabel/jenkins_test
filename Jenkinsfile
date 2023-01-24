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
                    terraform init
                   
                '''
            }
        }
        stage('apply') {
            steps {
                sh '''
                    sudo sed -i.bak "s@Your access_key@${ID}@g" main.tf
                    sudo sed -i.bak "s@Your secret_key@${KEY}@g" main.tf
                    terraform apply --auto-approve
                   
                '''
            }
        }
        stage('play') {
            steps {
                sh '''
                    cd ../ansible_deploy
                    ansible-playbook playbook.yml
                '''
            }
        }
        
    }

}
