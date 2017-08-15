######################################################
#
# Birdhouse Slurm Server
# Tag: birdhouse/slurm
#
# This container provides a standard Slurm controller
# and worker created on top of the continuumio/miniconda
# image.
#
# Usage:
# docker run -h slurm -i -t  \
#            -p 6818:6818                 \ # Slurm
#            --rm birdhouse/slurm
#
# https://github.com/bird-house/birdhouse-playground/tree/master/docker/slurm
#
######################################################

FROM ubuntu:latest

MAINTAINER Birdhouse <wps@dkrz.de>
LABEL Description="Slurm Demo" Vendor="Birdhouse" Version="0.6.3"

# prepare system
RUN apt-get update -y && \
  apt-get install -y sudo git curl bzip2


# install miniconda
WORKDIR /opt
RUN curl -LO https://repo.continuum.io/miniconda/Miniconda2-latest-Linux-x86_64.sh
RUN bash Miniconda2-latest-Linux-x86_64.sh -b -p /opt/miniconda2
ENV PATH="/opt/miniconda2/bin:${PATH}"

# clone ansible slurm
RUN git clone https://github.com/bird-house/birdhouse-playground.git
WORKDIR /opt/birdhouse-playground/ansible/ansible-slurm
RUN git checkout develop

# prepare ansible
RUN bash bootstrap.sh

# run ansible to install slurm
RUN /usr/bin/ansible-playbook -c local -i hosts.example slurm.yml

# Install supervisor
RUN apt-get install -y supervisor

# update configs
ADD supervisord.conf /etc/supervisord.conf

# make supervisor folders
RUN mkdir -p /opt/birdhouse/var/log/supervisor

# install pywps via conda
ADD environment.yml /opt/environment.yml
RUN conda env create -f /opt/environment.yml

# install emu wps
WORKDIR /opt
RUN git clone https://github.com/bird-house/emu.git
WORKDIR /opt/emu
RUN /bin/bash -c "source activate wps && python setup.py install"

# create birdhouse install directory
RUN mkdir -p /opt/birdhouse && \
  chown -R www-data /opt/birdhouse
VOLUME /opt/birdhouse/var/lib
VOLUME /opt/birdhouse/var/log
VOLUME /opt/birdhouse/etc

EXPOSE 6817 6818
CMD [ "/usr/bin/supervisord",  "-c", "/etc/supervisord.conf" ]
