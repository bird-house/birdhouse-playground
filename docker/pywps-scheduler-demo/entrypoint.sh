#!/usr/bin/env bash
#=============================================================#
#
# This script is included by the Dockerfile.
#
# The script prepares and starts a WPS service in the
# docker container.
#
#=============================================================#
# keep external environment
set -o allexport
# update the wps config (customized by environment variables)
make update-config
# update ssh known_hosts
echo "Updating ssh known_hosts. Please wait ..."
sleep 5  # sleep 5 secs
ssh-keyscan slurm > /home/demo/.ssh/known_hosts
chown www-data /home/demo/.ssh/known_hosts
# start supervisor service with wps and nginx
make start
