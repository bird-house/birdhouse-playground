Slurm docker container
======================

This is a development install of the Slurm scheduler running as a controller and worker.
This image is used as a single node cluster for testing purposes in birdhouse.

The docker image is based on `agaveapi/slurm`_ with modifications for birdhouse.


.. _agaveapi/slurm: https://hub.docker.com/r/agaveapi/slurm/

How to use this image
---------------------

Run the container::

  $ docker run -h slurm -it -p 10022:22 --rm birdhouse/slurm

Start with docker compose::

  $ docker-compose up

How to build the image
-----------------------

Build from this directory using the enclosed Dockerfile::

    $ docker build --rm -t birdhouse/slurm .
