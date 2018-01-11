# Ansible Demo

This repository contains an example how to use Ansible for a PyWPS service.

## Use Cases

A PyWPS service can be  used in the following deployment scenarios:

* testing and demo
  - might not have admin rights
* development on local laptop
  - no full installation necessary (skip nginx, supervisor, ...)
  - might not have admin rights
  - enabled debug mode
* production ready installation on a single host
  - currently the default
* production installation on a cluster system
  - needs installation of slurm/grid-engine
  - see ansible slurm/grid-engine examples:
    https://github.com/bird-house/birdhouse-ansible
* docker container for testing and demo
  - We currently have a single container with PyWPS, Nginx, Supervisor
  - Container orchestration people don't like this :)
  - Wanted: micro-service + docker-compose
* docker container for orchestration
  - Kubernetes seems to be the favorite orchestration tool by admins.
  - Docker Swarm looks easier ... might be used for testing.
  - Wanted: micro-service, a single PyWPS service without Nginx and Supervisor.

## Bootstrap

Run bootstrap script to prepare your system and install Ansible:

    $ bash bootstrap.sh

## Install external roles

We need miniconda:

    $ ansible-galaxy -p roles -r requirements.yml install

## Run Ansible

Run ansible script:

    $ bash play.sh

## Links

* https://tdhopper.com/blog/automating-python-with-ansible/
* https://plone-ansible-playbook.readthedocs.io/en/latest/index.html
* http://docs.ansible.com/ansible/latest/intro_installation.html
* https://galaxy.ansible.com/andrewrothstein/miniconda/
