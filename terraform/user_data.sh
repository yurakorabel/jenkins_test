#!/bin/bash

sudo apt update -y                                      # update the package sources in our operating system
sudo apt install apache2 -y                             # install the Apache2 web server

sudo chmod -R 777 /var/www/html                         # changes the permissions

sudo systemctl start apache2                            # start the Apache server

sudo ufw allow 80/tcp                                   # allow http port
sudo ufw allow 443/tcp                                  # allow https port

cd /var/www/html

sudo rm index.html

git clone https://github.com/yurakorabel/jenkins_test.git

cp -fr jenkins_test/* ./

sudo rm -rf jenkins_test/
