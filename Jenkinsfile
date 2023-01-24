pipeline {
    agent any
    environment{
        ID = credentials("AWS_ACCESS_KEY_ID")
        KEY = credentials("AWS_SECRET_ACCESS_KEY")
    }
    stages {
        stage('Start ansible-playbook') {
            steps {
                sh '''
                    cd "/home/ubuntu/ansible_deploy/"
                    ansible-playbook playbook.yml
                   
                '''
            }
        }
        stage('New files') {
            steps {
                sh '''
                    echo good
                '''
            }
        }
        
    }

}
