====================================
Deploying all Birdhouse Web Services
====================================

This ansible playbook will deploy the following WPS service of birdhouse:

* malleefowl
* hummingbird
* flyingpigeon
* emu

It also deploys the Phoenix web application which interacts with the WPS services.

Install Ansible
===============

Install it with conda:

.. code:: bash

    $ conda env create -f environment.yml
    $ source activate ansible


Run the playbooks
=================

Run the ansible playbook with a user who has sudo privileges:

.. code:: bash

   $ ansible-playbook -i hosts site.yml -u myuser --ask-pass --ask-become-pass

Further Infos
=============

* http://docs.ansible.com/




