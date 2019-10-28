ROS Network Autoconfiguration
=============================

The goal of this packge is to provide automatic configuration of ROS networking
for most use cases without impacting usage that require manual configuration.

.. note::
  While the current design does not consider IPv6 support, contributions
  are appreciated.

Usage
-----

Once installed, autoconfiguration is enabled by setting the ``ROS_INTERFACE``
environment variable in ``~/.bashrc`` or the local equivilent.

.. code-block:: bash

    ROS_INTERFACE=auto
    source /opt/ros/kinetic/setup.bash

``setup.bash`` will call the `environment hook
<http://docs.ros.org/kinetic/api/catkin/html/user_guide/environment.html>`_
installed as ``/opt/ros/kinetic/catkin/profile.d/20.network_autoconfig.sh``
and set the ``ROS_IP``, ``ROS_HOSTNAME``, and ``ROS_MASTER_URI`` as needed.

Use Cases
---------

Based on the most common use cases encountered in the field, the following
networks configuration modes can be configured by setting the ``ROS_INTERFACE``
environment variable before sourcing the ROS environment.


Fully Automatic Networking
``````````````````````````
.. code-block:: bash

    ROS_INTERFACE=auto

In this mode the env-hook will attempt the determine the ``ROS_IP`` by
querying the routing tables for the default route.

If a VPN provides the default route, the ``ROS_IP`` will be set to the local side 
of the tunnel. This may prevent it from being able to connect to other hosts
on the local network. If this is not the desired operation, consider `Semi-automatic
Networking`_.

This mode will also set the ``ROS_MASTER_URI`` by IP address and will update the
``ROS_INTERFACE`` variable to the detected default gateway interface.

Automatic Local Networking
``````````````````````````
.. code-block:: bash

    ROS_INTERFACE=local

In this mode the ``ROS_MASTER_URI`` and the ``ROS_HOSTNAME`` will be set to
``$HOSTNAME.local`` for Avahi zeroconf networking.

Semi-automatic Networking
`````````````````````````
.. code-block:: bash

    ROS_INTERFACE=wlp3s0

This mode uses the ``ROS_INTERFACE`` to specify a network device, and will
automatically set the ``ROS_IP`` and ``ROS_MASTER_URI`` based on the primary
IPv4 address assigned to the specified interface. This mode is also good for
cases where the robot has a telemetry link to the internet but connects to
other robots over an ethernet connection that is configured via DHCP.

Manual Networking
`````````````````
If the IP address is static the ``ROS_IP``, ``ROS_HOSTNAME``, and
``ROS_MASTER_URI`` can be configured manually and the env-hook is a no-op.

Index
-----

* :ref:`genindex`
* :ref:`search`
