# Ansible Demo

This repository contains an example how to use Ansible for a PyWPS service.

## Deployment Scenarios

A PyWPS service may be used in the following deployment scenarios:

* testing and demo
  - might not have admin rights
  - nginx, supervisor and even gunicorn not necessary ... werkzeug/pywps has its own wsgi service which can be used for development.
  - support by ansible and buildout not necessary
  - just clone repo and setup conda environment
  - should just run with defaults ... no further configuration necessary.
* development on local laptop
  - no full installation necessary (skip nginx, supervisor, ...)
  - might not have admin rights
  - enabled debug mode
  - could be the same as the testing/demo variant.
* production ready installation on a single host
  - currently the default
  - can also be used as development environment.
* production installation on a cluster system
  - needs installation of slurm/grid-engine
  - see ansible slurm/grid-engine examples:
    https://github.com/bird-house/birdhouse-ansible
* docker container for testing and demo
  - We currently have a single container with PyWPS, Nginx, Supervisor
  - Container orchestration people don't like this :)
  - Wanted: micro-service + docker-compose
  - Quick-fix: just update the Dockerfile template and extend docker-compose configuration.
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

## Questions?

* Ansible and Buildout are not used for the same purpose ... there is a philosophy conflict. Ansible is on the system level (but it could just be localhost), Buildout is on the application level (localhost only). In Ansible examples packages (like nginx, supervisor, ...) are installed on the system (debian, centos). In the current Birdhouse deployment solution with Buildout all packages and configs (besides Makefile, gcc, ...) are installed in the user space ... no admin rights are necessary and full installation can be wiped out easily. Probably need to combine best of both sides depending on the deployment scenario.
* Just a single Ansible deployment with configs for all birds? Or a minimal Ansible config in each bird repo fetching roles from ansible-galaxy?

## Links

* https://tdhopper.com/blog/automating-python-with-ansible/
* https://plone-ansible-playbook.readthedocs.io/en/latest/index.html
* http://docs.ansible.com/ansible/latest/intro_installation.html
* https://galaxy.ansible.com/andrewrothstein/miniconda/
