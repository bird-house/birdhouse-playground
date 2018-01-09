# Ansible Demo

This repository contains an example how to use ansible for birdhouse components.

## Bootstrap

Install miniconda:

    $ wget https://repo.continuum.io/miniconda/Miniconda3-latest-Linux-x86_64.sh
    $ bash Miniconda3-latest-Linux-x86_64.sh

Create conda environment with Ansible:

    $ conda env create -f environment.yml

## Run Ansible

Run ansible script:

    $ bash play.sh
