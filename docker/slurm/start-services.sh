#!/usr/bin/env bash
#=============================================================#
#
# This script is included by the Dockerfile.
#
# The script prepares and starts a Slurm service in the
# docker container.
#
#=============================================================#
# keep external environment
set -o allexport
echo -e "\nStarting supervisor..."
supervisord -c /etc/supervisor/supervisord.conf

echo -e "\nStarting slurm..."
supervisorctl -c /etc/supervisor/supervisord.conf start munge slurmctld slurmd

echo -e "\nStartup complete"
sleep infinity
