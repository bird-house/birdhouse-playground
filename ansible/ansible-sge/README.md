# ansible sge (sun grid engine)

An ansible playbook to install sge.

## User docker

Build docker image:

    $ docker build --rm -t birdhouse/sge .


Run docker image:

    $ docker run --rm -it birdhouse/sge /opt/ansible-sge/play.sh

## Links

* https://galaxy.ansible.com/grycap/sge/
* https://github.com/grycap/ansible-role-sge
* https://github.com/aabdulwahed/Sun-Grid-Engine-Ansible
