# vim:set ft=dockerfile:
FROM birdhouse/emu:latest
MAINTAINER Birdhouse <wps@dkrz.de>

LABEL Description="pywps scheduler demo" Vendor="Birdhouse" Version="0.4"

# install debian packages with slurm drmaa
RUN apt-get update && \
  apt-get install -y build-essential slurm-drmaa1 slurm-drmaa-dev slurm-llnl

# Install conda packages for scheduler extension
RUN conda update -y conda && \
  conda install -y -n emu -c birdhouse -c conda-forge pywps drmaa dill

# change demo user home
RUN usermod -m -d /home/demo www-data && \
  mkdir /home/demo && \
  chown -R www-data /home/demo

# add slurm config
ADD slurm/slurm.conf /etc/slurm-llnl/slurm.conf

# update emu wps config
ADD custom.cfg /opt/birdhouse/src/emu/custom.cfg

# copy start script
COPY entrypoint.sh /entrypoint.sh

# Start service ...
CMD ["/entrypoint.sh"]
