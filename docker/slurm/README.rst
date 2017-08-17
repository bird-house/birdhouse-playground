Slurm docker container
======================

This is a development install of the Slurm scheduler running as a controller and worker.
This image is used as a single node cluster for testing purposes in birdhouse.

The docker image contains a Slurm scheduler and a PyWPS demo installed via conda.

How to use this image
---------------------

Run the container::

  $ docker run -h slurm -p 6817:6817 -p 6818:6818 --rm birdhouse/slurm

Start with docker compose::

  $ docker-compose up

How to build the image
-----------------------

Build from this directory using the enclosed Dockerfile::

    $ docker build --rm -t birdhouse/slurm .
