######################################################
#
# Ansible SGE container
# Tag: birdhouse/sge
#
# This container provides a Sun Grid Engine (SGE) build
# with ansible
#
# Usage:
# docker run -it --rm birdhouse/sge
#
# https://github.com/bird-house/birdhouse-playground/tree/master/ansible/ansible-sge
#
######################################################
# vim:set ft=dockerfile:

FROM centos:7

MAINTAINER Birdhouse <wps@dkrz.de>
LABEL Description="SGE Demo" Vendor="Birdhouse" Version="0.1"

# install base packages
RUN yum update -y && \
  yum install -y vim git sudo

# copy ansible-sge
#COPY . /opt/ansbile-sge
ADD bootstrap.sh /opt/ansible-sge/bootstrap.sh
ADD sge.yml /opt/ansible-sge/sge.yml
WORKDIR /opt/ansible-sge
RUN bash bootstrap.sh

CMD [ "/bin/bash" ]
