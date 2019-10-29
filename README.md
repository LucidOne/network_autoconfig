# ROS Network Autoconfiguration
[![Build Status](https://www.travis-ci.org/LucidOne/network_autoconfig.svg?branch=master)](https://www.travis-ci.org/LucidOne/network_autoconfig)
[![Build Status](http://build.ros.org/buildStatus/icon?subject=Kinetic&job=Kbin_uX64__network_autoconfig__ubuntu_xenial_amd64__binary)](http://build.ros.org/view/Kbin_uX64/job/Kbin_uX64__network_autoconfig__ubuntu_xenial_amd64__binary/)

[network_autoconfig](https://github.com/lucidone/network_autoconfig) automatically configures the
`ROS_IP`, `ROS_HOSTNAME`, and `ROS_MASTER_URI` as needed.

## Installation
Assuming ROS is [installed](http://wiki.ros.org/kinetic/Installation/Ubuntu)
```bash
sudo apt install ros-kinetic-network-autoconfig
```

## TL;DR
```bash
ROS_INTERFACE=auto
source /opt/ros/kinetic/setup.bash
```
