# Ansible Demo

This repository contains an example how to use Ansible for a PyWPS service.

## Bootstrap

Install Ansible on your system.

http://docs.ansible.com/ansible/latest/intro_installation.html

Ubuntu:

    $ sudo apt-get update
    $ sudo apt-get install software-properties-common
    $ sudo apt-add-repository ppa:ansible/ansible
    $ sudo apt-get update
    $ sudo apt-get install ansible

## Install external roles

miniconda:

    $ ansible-galaxy install -f andrewrothstein.miniconda

## Run Ansible

Run ansible script:

    $ bash play.sh

## Links

* https://tdhopper.com/blog/automating-python-with-ansible/
* https://plone-ansible-playbook.readthedocs.io/en/latest/index.html
* http://docs.ansible.com/ansible/latest/intro_installation.html
* https://galaxy.ansible.com/andrewrothstein/miniconda/
