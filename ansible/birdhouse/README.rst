====================================
Deploying all Birdhouse Web Services
====================================

This ansible playbook will deploy the following WPS service of birdhouse:

* malleefowl
* hummingbird
* emu

It also deploys the Phoenix web application which interacts with the WPS services.

Run the ansible playbook:

.. code:: bash

   $ ansible-playbook -i hosts site.yml --ask-become-pass




