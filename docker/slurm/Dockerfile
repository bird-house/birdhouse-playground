FROM continuumio/miniconda

MAINTAINER Birdhouse <wps@dkrz.de>
LABEL Description="Slurm" Vendor="Birdhouse" Version="0.7.1"

# install sudo
RUN apt-get update && \
  apt-get install -y sudo

# get ansible
WORKDIR /opt
RUN git clone https://github.com/bird-house/birdhouse-ansible.git
WORKDIR /opt/birdhouse-ansible/slurm

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
