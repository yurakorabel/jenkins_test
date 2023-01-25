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
                    sudo terraform init
                   
                '''
            }
        }
        stage('apply') {
            steps {
                sh '''
                    cd terraform
                    sudo terraform apply --auto-approve
                '''
            }
        }
        stage('ssh permission') {
            steps {
                sh '''
                    sudo chmod 700 "/var/lib/jenkins/.ssh/"
                    sudo chmod 600  "/var/lib/jenkins/.ssh/id_rsa"
                    sudo chmod 644  "/var/lib/jenkins/.ssh/id_rsa.pub"
                '''
            }
        }
        stage('play') {
            steps {
               sh '''
                   cd ansible_deploy
                   sudo ansible-playbook playbook.yml
               '''
            }
        }
        
    }

}
