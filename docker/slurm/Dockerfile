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

FROM continuumio/miniconda

MAINTAINER Birdhouse <wps@dkrz.de>
LABEL Description="Slurm Demo" Vendor="Birdhouse" Version="0.6"

# clone ansible slurm
WORKDIR /root
RUN git clone https://github.com/bird-house/birdhouse-playground.git
WORKDIR /root/birdhouse-playground/ansible/ansible-slurm
RUN git checkout develop

# prepare system
RUN apt-get update -y && \
  apt-get install sudo

# prepare ansible
RUN bash bootstrap.sh

# run ansible to install slurm
RUN /usr/bin/ansible-playbook -c local slurm.yml

# Install conda packages with supervisor
RUN conda update -y conda && \
  conda install -y supervisor

# update configs
ADD supervisord.conf /etc/supervisord.conf

# make supervisor folders
RUN mkdir /var/log/supervisor

# install pywps via conda
ADD environment.yml /root/environment.yml
RUN conda env create -f /root/environment.yml

# install emu wps
WORKDIR /root
RUN git clone https://github.com/bird-house/emu.git
WORKDIR /root/emu
RUN /bin/bash -c "source activate wps && python setup.py install"

# create birdhouse install directory
RUN mkdir -p /opt/birdhouse && \
  chown -R www-data /opt/birdhouse
VOLUME /opt/birdhouse/var/lib
VOLUME /opt/birdhouse/var/log
VOLUME /opt/birdhouse/etc

EXPOSE 6817 6818
CMD [ "/opt/conda/bin/supervisord",  "-c", "/etc/supervisord.conf" ]
