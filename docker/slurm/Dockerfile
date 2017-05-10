######################################################
#
# Birdhouse Slurm Server
# Tag: birdhouse/slurm
#
# This container provides a standard Slurm controller
# and worker created on top of the agaveapi/slurm
# image.
#
# Usage:
# docker run -h slurm -i -t  \
#            -p 10022:22                  \ # SSHD, SFTP
#            -p 9618:9618                 \ # Slurm
#            --rm birdhouse/slurm
#
# https://github.com/bird-house/birdhouse-playground/tree/master/docker/slurm
#
######################################################

FROM agaveapi/slurm

MAINTAINER Birdhouse <wps@dkrz.de>

RUN yum -y install wget vim

ADD slurm/slurm.conf /etc/sysconfig/slurm/slurm.conf
ADD supervisord.conf /etc/supervisord.conf

RUN echo 'export PATH=/opt/conda/bin:$PATH' > /etc/profile.d/conda.sh && \
  wget --quiet https://repo.continuum.io/miniconda/Miniconda2-4.3.11-Linux-x86_64.sh -O ~/miniconda.sh && \
  /bin/bash ~/miniconda.sh -b -p /opt/conda && \
  rm ~/miniconda.sh

ENV PATH /opt/conda/bin:$PATH

EXPOSE 10389 22 6817 6818
CMD [ "/usr/bin/supervisord" ]
