#!/bin/bash
ansible-playbook -c local  --become --ask-become-pass site.yml
