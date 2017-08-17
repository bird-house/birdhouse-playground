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
/opt/conda/bin/supervisord -c /etc/supervisor/supervisord.conf
