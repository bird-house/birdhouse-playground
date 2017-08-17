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
echo -e "\nStartup Slurm..."
supervisord -c /etc/supervisor/supervisord.conf

if [ $1 == "slurmctld" ]; then
  supervisorctl -c /etc/supervisor/supervisord.conf start $1
elif [ $1 == "slurmd" ]; then
  supervisorctl -c /etc/supervisor/supervisord.conf start $1
else
  supervisorctl -c /etc/supervisor/supervisord.conf start slurmctld slurmd
fi

echo -e "\nStartup complete"
sleep infinity
