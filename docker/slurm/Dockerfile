FROM continuumio/miniconda

MAINTAINER Birdhouse <wps@dkrz.de>
LABEL Description="Slurm" Vendor="Birdhouse" Version="0.6.0"

# install debian packages with slurm
RUN apt-get update && \
  apt-get install -y munge slurm-llnl

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

# add slurm config
ADD slurm/slurm.conf /etc/slurm-llnl/slurm.conf

# Install conda packages with supervisor
RUN conda update -y conda && \
  conda install -y supervisor

# add supervisor config
ADD supervisord.conf /etc/supervisor/supervisord.conf

# make supervisor folders
RUN mkdir /var/log/supervisor

# copy start script
ADD start-services.sh /etc/start-services.sh
RUN chmod +x /etc/start-services.sh

# ports
EXPOSE 6817 6818

# Start service ...
ENTRYPOINT ["/etc/start-services.sh"]
