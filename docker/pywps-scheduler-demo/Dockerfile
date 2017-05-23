# vim:set ft=dockerfile:
FROM birdhouse/emu:latest
MAINTAINER https://github.com/bird-house/birdhouse-playground/tree/master/docker/pywps-scheduler-demo

LABEL Description="pywps scheduler demo" Vendor="Birdhouse" Version="0.5"

# install debian packages with slurm drmaa
RUN apt-get update && \
  apt-get install -y build-essential slurm-drmaa1 slurm-drmaa-dev

# Install conda packages with drmaa
RUN conda update -y conda && \
  conda install -y -n emu drmaa

# change demo user home
RUN usermod -m -d /home/demo www-data && \
  mkdir /home/demo && \
  chown -R www-data /home/demo

# update emu wps config
ADD custom.cfg /opt/birdhouse/src/emu/custom.cfg

# copy start script
COPY entrypoint.sh /entrypoint.sh

# Start service ...
CMD ["/entrypoint.sh"]
