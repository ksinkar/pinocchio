PINOCCHIO
=========

Pinocchio a is masterless automated configuration management system that aims to setup UNIX based computing systems, preferentially Linux distributions for development as well as production purposes. The aim of this system is not reportage, except maybe sending emails.

Currently Pinocchio should be run be as root after the distribution has been installed. It cannot, yet, create or manage partitions that are created while the OS/Distribution is being installed.

Requirements
------------
1. bash
2. curl
3. connection to the internet

Usage
-----
* For setting up the system
  ``` bash
  # ./pinocchio.sh setup
  ```
* For getting online help
  ``` bash
  # ./pinocchio.sh -h 
  ```
* For getting the version number
  ``` bash
  # ./pinocchio.sh -v
  ```
