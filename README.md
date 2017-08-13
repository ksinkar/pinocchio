PINOCCHIO
=========

Pinocchio is a masterless automated configuration management system
that aims to setup UNIX based computing systems, preferentially Linux
distributions for development as well as production purposes. The aim
of this system is not reportage, except maybe sending emails.

Currently Pinocchio should be run be as root after the distribution
has been installed. It cannot, yet, create or manage partitions that
are created while the OS/Distribution is being installed.

Mainly, Pinocchio is a bootstrap shell script to install cfengine
community edition on your workstation irrespective of your Linux
distribution. Currently Ubuntu, Debain, CentOS, RedHat, Fedora are
supported. Pull Requests to bootstrap cfengine to Mac OSX and other
Linux distributions is welcome.

Requirements
------------
1. bash
2. curl
3. connection to the internet

Usage
-----
* For setting up the system
  ``` shell
  # ./pinocchio.sh setup
  ```
* For custom install of package lists
  ``` shell
  # ./pinocchio.sh install <package_list>
  ```
* For runing custom shell scripts after pinocchio bootstrap
  ``` shell
  # ./pinocchio.sh run <custom_script>
  ```
* For getting online help
  ``` shell
  $ ./pinocchio.sh -h 
  ```
* For getting the version number
  ``` shell
  $ ./pinocchio.sh -v
  ```

CFEngine Promises
-----------------
Pinocchio assumes you are using
the [MPF (Masterfiles Policy Framework)](https://docs.cfengine.com/docs/master/reference-masterfiles-policy-framework.html) distributed along with the
community edition. The default promises provided here are the ones
that are going to be most widely used. All of the promises listed in
the [promises](./promises) directory are generic promises which take their
instructions for JSON configuration files placed in the [config](./config)
folder. All `*.json.example` files are samples provided which can be
copied to their `*.json` filename and modified according to your
specific requirements.

All these default promises will be copied into the
`/var/cfengine/inputs/services`.


Custom Directory Structure
--------------------------
You have to create a directory called /custom in the main directory
which should have the following directory structure

/custom
├── package_lists
├── post_install
├── pre_install
└── promises

### Package Lists Files

A package list file is simply a newline separated list of package
names with the suffix .txt in its filename. The name of the file
should be the name of the distroot (distribution root) whose packages
you are going to install. Currently defined distroots are:
1. redhat
2. debian
3. suse
4. arch

This is a redundant functionality and should only be used if you want
any packages to be installed before CFEngine installs packages.

### Post Install and Pre Install scripts

Pre-Install scripts are run before Pinocchio installs CFEngine and its
dependencies. Post-Install scripts are run after Pinocchio has
finished installing CFEngine and its dependencies.

Custom scripts have to be bash scripts. Pinocchio does not install any
other programming language during setup, unless you have injected
custom scripts to do that. Having said that, Pinocchio does provide a
bash function that installs package-lists called
install_packages(). The way to call this function in your custom bash
script is as follows:

``` shell
    install_packages <packages_list_filename>
```
Pinocchio also checks for root privileges and sets the package_manager
based on your distribution.

### Promises
All  custom promises will be copied into the
`services` directory of the cfengine `inputs` directory from the
`custom/promises` directory of this repository.
