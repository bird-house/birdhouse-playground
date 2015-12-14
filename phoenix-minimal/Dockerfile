# vim:set ft=dockerfile:
FROM birdhouse/bird-base:latest
MAINTAINER https://github.com/bird-house/birdhouse-playground/tree/master/phoenix-minimal

LABEL Description="Phoenix web-application to interact with WPS services." Vendor="Birdhouse" Version="0.4.5"

# Configure hostname and user for services 
ENV HOSTNAME localhost
ENV USER www-data


# Set current home
ENV HOME /root

# Load sources from github
RUN mkdir -p /opt/birdhouse && curl -ksL https://github.com/bird-house/pyramid-phoenix/archive/pingudev.tar.gz | tar -xzC /opt/birdhouse --strip-components=1

# cd into application
WORKDIR /opt/birdhouse

COPY buildout.cfg .

# Install system dependencies
RUN bash bootstrap.sh -i && bash requirements.sh

# Set conda enviroment
ENV ANACONDA_HOME /opt/conda
ENV CONDA_ENVS_DIR /opt/conda/envs

# Run install
RUN make clean install 

# Volume for data, cache, logfiles, ...
RUN chown -R $USER $CONDA_ENVS_DIR/birdhouse
RUN mv $CONDA_ENVS_DIR/birdhouse/var /data && ln -s /data $CONDA_ENVS_DIR/birdhouse/var
VOLUME /data/cache
VOLUME /data/lib

# Ports used in birdhouse
EXPOSE 8443

# Start supervisor in foreground
ENV DAEMON_OPTS --nodaemon --user $USER

# Update config and start supervisor ...
CMD ["make", "update-config", "start"]

