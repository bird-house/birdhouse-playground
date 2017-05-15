# vim:set ft=dockerfile:
FROM birdhouse/emu:latest
MAINTAINER https://github.com/bird-house/birdhouse-playground/tree/master/docker/pywps-scheduler-demo

LABEL Description="pywps scheduler demo" Vendor="Birdhouse" Version="0.3"

# change user home
RUN usermod -m -d /home/demo www-data && \
  mkdir /home/demo
#add ssh key to access slurm
ADD ssh /home/demo/.ssh
RUN chmod 600 /home/demo/.ssh/id_rsa && \
  chmod 640 /home/demo/.ssh/id_rsa.pub
RUN chown -R www-data /home/demo

# update emu wps config
ADD custom.cfg /opt/birdhouse/src/emu/custom.cfg

# copy start script
COPY entrypoint.sh /entrypoint.sh

# Start service ...
CMD ["/entrypoint.sh"]
