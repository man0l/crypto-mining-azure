#!/bin/bash

# Ensure the hosts.ini file exists
if [ ! -f hosts.ini ]; then
    echo "hosts.ini file not found!"
    exit 1
fi

# Run the Ansible playbook
ansible-playbook -i hosts.ini -u azureuser --private-key=~/.ssh/id_rsa -vvv provisioning/playbook.yml
