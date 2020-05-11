#!/bin/bash

## Update and upgrade the repo
sudo yum update -y
sudo yum upgrade -y

## Install salt repo and package
sudo yum install https://repo.saltstack.com/yum/redhat/salt-repo-latest.el7.noarch.rpm
sudo yum update -y
sudo yum upgrade -y
sudo yum install salt-minion -y

## Add salt minion to master and name minion id
echo "master: 10.0.3.9" >> /etc/salt/minion
echo "id: min02" >> /etc/salt/minion
echo "hash_type: sha256" >> /etc/salt/minion
echo "min02" >> /etc/salt/minion_id

## Start salt minion service
systemctl start salt-minion.service
systemctl enable salt-minion.service

######--------------#######
