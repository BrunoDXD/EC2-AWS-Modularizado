#!/bin/bash
              sudo apt update 
              sudo apt upgrade
              cd /tmp
              wget https://s3.amazonaws.com/ansible.wordpress/Ansible.zip
              sudo apt install unzip
              unzip Ansible.zip
              cd Ansible
              sudo apt install curl ansible -y
              sudo add-apt-repository ppa:ondrej/php -y
              sudo apt-get update
              sudo ansible-playbook wordpress.yml --extra-vars "wp_db_name=${wp_db_name} wp_db_username=${wp_username} wp_db_password=${wp_user_password} wp_db_host=${wp_db_host} session_save_path=''"