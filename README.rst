OpenSeesTools
+++++++++++++

Tcl packages for OpenSeesTcl analyses.


Packages
========

``Logger``
----------

A basic logger based on the Python logging system.

.. code:: Tcl

    % package require Logger
    % set logger [Logger::Logger new "default"]
    % $logger warning "this is a warning!"
    [default] WARNING: this is a warning!
