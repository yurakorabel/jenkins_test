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
                    export AWS_ACCESS_KEY_ID=${ID}
                    export AWS_SECRET_ACCESS_KEY=${KEY}
                    cd terraform
                    terraform init
                   
                '''
            }
        }
        stage('apply') {
            steps {
                sh '''
                    cd terraform
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
