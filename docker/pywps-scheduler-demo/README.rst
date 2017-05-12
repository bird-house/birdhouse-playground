*******************************
PyWPS Demo with Slurm scheduler
*******************************

How to run the demo
*******************

First get this demo from github::

  $ git clone https://github.com/bird-house/birdhouse-playground.git

Change in to the docker pywps-scheduler-demo directory::

  $ cd birdhouse-playground/docker/pywps-scheduler-demo

Get docker images using docker-compose::

  $ docker-compose pull

Start the demo with docker-compose::

  $ docker-compose up -d # runs with -d in the background

By default the WPS service should be available on port 8080::

  $ firefox "http://localhost:8080/wps?service=wps&request=GetCapabilities"

Run a "hello" to see if the service is responding::

  $ firefox "http://localhost:8080/wps?service=wps&request=Execute&version=1.0.0&identifier=hello&datainputs=name=Friday"

This process was run synchronously and was executed on the WPS server.

Now, we run a "sleep" process in async mode which will be delegated to the Slurm server::

  $ firefox "http://localhost:8080/wps?service=wps&request=Execute&version=1.0.0&identifier=sleep&datainputs=delay=10&storeExecuteResponse=true&status=true"

Hopefully you will get a status response looking like this:

.. code-block:: xml

  <!-- PyWPS 4.0.0 -->
  <wps:ExecuteResponse xmlns:gml="http://www.opengis.net/gml"
    xmlns:ows="http://www.opengis.net/ows/1.1"
    xmlns:wps="http://www.opengis.net/wps/1.0.0"
    xmlns:xlink="http://www.w3.org/1999/xlink"
    xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance"
    xsi:schemaLocation="http://www.opengis.net/wps/1.0.0 http://schemas.opengis.net/wps/1.0.0/wpsExecute_response.xsd"
    service="WPS" version="1.0.0" xml:lang="en-US"
    serviceInstance="http://localhost:8080/wps?service=WPS&amp;request=GetCapabilities"
    statusLocation="http://localhost:8000/wpsoutputs/emu/ae284b7e-3708-11e7-8c84-0242ac110003.xml">
  <wps:Process wps:processVersion="1.0">
    <ows:Identifier>sleep</ows:Identifier>
    <ows:Title>Sleep Process</ows:Title>
    <ows:Abstract>Testing a long running process, in the sleep.This process will sleep for a given delay or 10 seconds if not a valid value.</ows:Abstract>
  </wps:Process>
  <wps:Status creationTime="2017-05-12T11:46:48Z">
    <wps:ProcessAccepted>PyWPS Process sleep accepted</wps:ProcessAccepted>
  </wps:Status>
  </wps:ExecuteResponse>

Poll the status location link given in this document::

  $ firefox "http://localhost:8000/wpsoutputs/emu/ae284b7e-3708-11e7-8c84-0242ac110003.xml"

You might get the following response:

.. code-block:: xml

  <wps:ExecuteResponse xmlns:gml="http://www.opengis.net/gml" xmlns:ows="http://www.opengis.net/ows/1.1" xmlns:wps="http://www.opengis.net/wps/1.0.0" xmlns:xlink="http://www.w3.org/1999/xlink" xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xsi:schemaLocation="http://www.opengis.net/wps/1.0.0 http://schemas.opengis.net/wps/1.0.0/wpsExecute_response.xsd" service="WPS" version="1.0.0" xml:lang="en-US" serviceInstance="http://localhost:8080/wps?service=WPS&amp;request=GetCapabilities" statusLocation="http://localhost:8000/wpsoutputs/emu/cc6410fe-3709-11e7-8c84-0242ac110003.xml">
    <wps:Process wps:processVersion="1.0">
      <ows:Identifier>sleep</ows:Identifier>
      <ows:Title>Sleep Process</ows:Title>
      <ows:Abstract>Testing a long running process, in the sleep.This process will sleep for a given delay or 10 seconds if not a valid value.</ows:Abstract>
    </wps:Process>
    <wps:Status creationTime="2017-05-12T12:54:58Z">
      <wps:ProcessStarted percentCompleted="20">PyWPS Process started. Waiting...</wps:ProcessStarted>
    </wps:Status>
  </wps:ExecuteResponse>


Using birdy::

  $ export WPS_SERVICE=http://localhost:8080/wps
  $ birdy -h
  $ birdy sleep --delay 2
  $ less /opt/birdhouse/var/log/pywps/emu.log


How to build the demo image
***************************

Build from this directory using the enclosed Dockerfile::

  $ docker build --rm -t birdhouse/pywps-scheduler-demo .
