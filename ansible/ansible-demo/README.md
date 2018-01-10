# Ansible Demo

This repository contains an example how to use ansible for birdhouse components.

## Bootstrap

Install miniconda:

    $ wget https://repo.continuum.io/miniconda/Miniconda3-latest-Linux-x86_64.sh
    $ bash Miniconda3-latest-Linux-x86_64.sh

Create conda environment with Ansible:

    $ conda env create -f environment.yml

OR install Ansible on system.

Ubuntu:

http://docs.ansible.com/ansible/latest/intro_installation.html#latest-releases-via-apt-ubuntu

    $ sudo apt-get update
    $ sudo apt-get install software-properties-common
    $ sudo apt-add-repository ppa:ansible/ansible
    $ sudo apt-get update
    $ sudo apt-get install ansible

## Run Ansible

Activate ansible environment:

    $ source activate ansible-demo

Run ansible script:

    $ bash play.sh

## Links

* https://tdhopper.com/blog/automating-python-with-ansible/
* https://plone-ansible-playbook.readthedocs.io/en/latest/index.html
* http://docs.ansible.com/ansible/latest/intro_installation.html
