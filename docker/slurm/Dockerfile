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

ADD slurm/slurm.conf /etc/sysconfig/slurm/slurm.conf
ADD supervisord.conf /etc/supervisord.conf

EXPOSE 10389 22 6817 6818
CMD /usr/bin/supervisord
