*******************************
PyWPS Demo with Slurm scheduler
*******************************

How to run the demo
*******************

Use docker-compose::

  $ docker-compose up
  $ export WPS_SERVICE=http://localhost:8080/wps
  $ birdy -h
  $ birdy sleep --delay 2
  $ less /opt/birdhouse/var/log/pywps/emu.log


How to build the demo image
***************************

Build from this directory using the enclosed Dockerfile::

  $ docker build --rm -t birdhouse/pywps-scheduler-demo .
