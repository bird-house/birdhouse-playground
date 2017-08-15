#!/bin/bash
ansible-playbook -c local -i hosts.examples --become --ask-become-pass slurm.yml
