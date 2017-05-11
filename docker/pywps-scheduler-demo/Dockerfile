# vim:set ft=dockerfile:
FROM birdhouse/emu:latest
MAINTAINER https://github.com/bird-house/birdhouse-playground/tree/master/docker/pywps-scheduler-demo

LABEL Description="pywps scheduler demo" Vendor="Birdhouse" Version="0.1"

# change user home and add ssh key to access slurm
RUN usermod -m -d /home/wps www-data && \
  mkdir /home/wps
RUN mkdir -p /home/wps/.ssh
ADD ssh /home/wps/.ssh
RUN chmod 600 /home/wps/.ssh/id_rsa && \
  chmod 640 /home/wps/.ssh/id_rsa.pub
RUN chown -R www-data /home/wps

# update emu wps config
ADD custom.cfg /opt/birdhouse/src/emu/custom.cfg

# Start service ...
CMD ["make", "update-config", "start"]
