pipeline {
    agent any
    environment{
        ID = credentials("AWS_ACCESS_KEY_ID")
        KEY = credentials("AWS_SECRET_ACCESS_KEY")
    }
    stages {
        stage('Connect to Server') {
            steps {
                sh '''
                    ssh -i ~/.ssh/id_rsa ubuntu@3.68.217.151
                '''
            }
        }
        stage('New files') {
            steps {
                sh '''
                    cd /var/www/html

                    sudo rm - rf *

                    git clone https://github.com/yurakorabel/jenkins_test.git

                    cp -fr jenkins_test/* ./

                    sudo rm -rf jenkins_test/
                '''
            }
        }
    }

}