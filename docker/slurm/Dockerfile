FROM continuumio/miniconda

MAINTAINER Birdhouse <wps@dkrz.de>
LABEL Description="Slurm" Vendor="Birdhouse" Version="0.6.7"

# install sudo
RUN apt-get update && \
  apt-get install -y git sudo

# get ansible
RUN git clone https://github.com/bird-house/birdhouse-playground.git /opt/birdhouse-playground
WORKDIR /opt/birdhouse-playground/ansible/ansible-slurm
RUN git checkout develop

# bootstrap ansible
RUN bash bootstrap.sh

# run ansible
RUN ansible-playbook -c local -i hosts.example -e slurm_server_name=slurm site.yml

# copy start script
ADD start-services.sh /etc/start-services.sh
RUN chmod +x /etc/start-services.sh

# ports
EXPOSE 6817 6818

# Start service ...
ENTRYPOINT ["/etc/start-services.sh"]
CMD ["slurmctld", "slurmd"]
