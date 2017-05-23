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

# install debian packages with slurm
RUN apt-get update && \
  apt-get install -y build-essential wget vim git munge slurm-llnl

# create munge key
RUN /usr/sbin/create-munge-key

# fix munge folders
RUN mkdir /var/run/munge && \
  chown -R munge:munge /var/run/munge && \
  chmod 755 /var/run/munge

# fix munge permissions
RUN chmod g-w /var/log && \
  chmod g-w /var/log/munge

# fix slurm folders
RUN mkdir /var/log/slurm && \
  touch /var/log/slurm/job_completions && \
  touch /var/log/slurm/accounting && \
  chown -R slurm:slurm /var/log/slurm

RUN touch /var/spool/last_config_lite && \
  touch /var/spool/last_config_lite.new && \
  chown slurm:slurm /var/spool/last_config_lite*

RUN chown root:slurm /var/spool && \
  chmod g+w /var/spool

# Install conda packages with supervisor
RUN conda update -y conda && \
  conda install -y supervisor

# update configs
ADD slurm/slurm.conf /etc/slurm-llnl/slurm.conf
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
