#!/bin/bash
sudo apt-get update
sudo apt-get install -y python3

sudo apt-add-repository ppa:ansible/ansible
sudo apt update
sudo apt install -y ansible

sudo apt install -y apache2

sudo apt install -y php libapache2-mod-php php-mysql