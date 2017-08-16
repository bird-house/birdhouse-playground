# vim:set ft=dockerfile:
FROM phusion/baseimage:latest
MAINTAINER Birdhouse <wps@dkrz.de>

LABEL Description="pywps scheduler demo" Vendor="Birdhouse" Version="0.6.1"

# install debian packages with slurm drmaa
RUN apt-get update && \
  apt-get install -y build-essential slurm-drmaa1 slurm-drmaa-dev slurm-llnl

# add slurm config
ADD slurm.conf /etc/slurm-llnl/slurm.conf

# change demo user home
RUN usermod -m -d /home/demo www-data && \
  mkdir /home/demo && \
  chown -R www-data /home/demo

# work in demo as user www-demo
WORKDIR /home/demo
USER www-data

# install conda
RUN curl -LO https://repo.continuum.io/miniconda/Miniconda2-latest-Linux-x86_64.sh
RUN bash Miniconda2-latest-Linux-x86_64.sh -b -p /home/demo/miniconda2
ENV PATH="/home/demo/miniconda2/bin:${PATH}"

# install emu wps with scheduler extension and postgres
RUN conda install --yes --channel-priority \
  -c birdhouse -c conda-forge \
  emu pywps=4 drmaa dill psycopg2

# add wps config
ADD pywps.cfg /home/demo/pywps.cfg

EXPOSE 5000

# Start service ...
CMD ["/home/demo/miniconda2/bin/emu", "-a", "-c", "/home/demo/pywps.cfg"]
