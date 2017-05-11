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

# update centos
RUN yum install -y yum-plugin-ovl
RUN yum -y install wget vim

# Add wps user
RUN groupadd -g 1000 wps && \
  adduser wps --uid 1000 --gid 1000 && \
  echo "wps:wps" | chpasswd
USER wps
RUN mkdir /home/wps/.ssh
ADD ssh/id_rsa.pub /home/wps/.ssh/authorized_keys
USER root

# update configs
ADD slurm/slurm.conf /etc/sysconfig/slurm/slurm.conf
ADD supervisord.conf /etc/supervisord.conf

# install miniconda
RUN echo 'export PATH=/opt/conda/bin:$PATH' > /etc/profile.d/conda.sh && \
  wget --quiet https://repo.continuum.io/miniconda/Miniconda2-4.3.11-Linux-x86_64.sh -O ~/miniconda.sh && \
  /bin/bash ~/miniconda.sh -b -p /opt/conda && \
  rm ~/miniconda.sh

ENV PATH /opt/conda/bin:$PATH

# install pywps via conda
ADD environment.yml /root/environment.yml
RUN conda env create -f /root/environment.yml

# install emu wps
RUN git clone https://github.com/bird-house/emu.git && \
  cd emu && \
  git checkout develop && \
  source activate wps && \
  python setup.py install

# create birdhouse install directory
RUN mkdir /opt/birdhouse && chown -R wps:wps /opt/birdhouse
VOLUME [ "/opt/birdhouse" ]

EXPOSE 10389 22 6817 6818
CMD [ "/usr/bin/supervisord" ]
