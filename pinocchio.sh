#!/bin/bash

#####################################################################
#####################################################################
## Copyright(C) 2016 Koustubh Sinkar 
##
## This file is part of Pinocchio
##
## Pinocchio free software: you can redistribute it and/or modify
## it under the terms of the GNU General Public License as published by
## the Free Software Foundation, either version 3 of the License, or
## (at your option) any later version.
## 
## Pinocchio is distributed in the hope that it will be useful,
## but WITHOUT ANY WARRANTY; without even the implied warranty of
## MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
## GNU General Public License for more details.
## 
## You should have received a copy of the GNU General Public License
## along with Pinocchio.  If not, see <http://www.gnu.org/licenses/
#####################################################################
#####################################################################

usage="usage: ./pinocchio [-v] [-h]\n
To do system operations run the following pinocchio commands as root/sudo.\n
\t setup \t\t setup a complete system from scratch"


if [[ $1 == "setup" ]]; then
    echo "checking if the user is root"
    source check_root.sh
    if [[ -f preload.sh ]]; then
        echo "loading the definitions in the preload"
        source preload.sh
    fi
    echo "setting up the package manager"
    source set_package_manager.sh
    echo "setting up the install packages function"
    source install_packages.sh
    echo "installing the prerequisites"
    source install_prerequisites.sh
    echo "installing the custom dependencies"
    source custom.sh
    echo "setting up users and groups"
    source set_users_groups.sh
    echo "running puppet"
    source run_puppet.sh
else
    while getopts "hv" opt; do
        case $opt in
            h)
	        echo -e $usage
	        exit
	        ;;
            v)
                cat VERSION
                exit
                ;;
            c)
                cat COPYRIGHT
                exit
                ;;
            l)
                cat COPYING
                exit
                ;;
	    *)
	        echo -e $usage
	        exit
	        ;;
        esac
    done
    echo -e $usage
fi
