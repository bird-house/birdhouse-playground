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
#            -p 9618:9618                 \ # Slurm
#            --rm birdhouse/slurm
#
# https://github.com/bird-house/birdhouse-playground/tree/master/docker/slurm
#
######################################################

FROM continuumio/miniconda

MAINTAINER Birdhouse <wps@dkrz.de>

# update debian
RUN apt-get update && \
  apt-get install -y build-essential wget vim

USER root

# update configs
ADD slurm/slurm.conf /etc/sysconfig/slurm/slurm.conf
ADD supervisord.conf /etc/supervisord.conf

# install pywps via conda
ADD environment.yml /root/environment.yml
RUN conda env create -f /root/environment.yml

# install emu wps
RUN git clone https://github.com/bird-house/emu.git && \
  cd emu && \
  source activate wps && \
  python setup.py install

# create birdhouse install directory
RUN mkdir -p /opt/birdhouse && chown -R wps /opt/birdhouse
VOLUME /opt/birdhouse/var/lib
VOLUME /opt/birdhouse/var/log
VOLUME /opt/birdhouse/etc

EXPOSE 6817 6818
CMD [ "/usr/bin/supervisord" ]
