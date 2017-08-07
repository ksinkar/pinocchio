#!/bin/bash

#####################################################################
#####################################################################
## Copyright(C) 2017 Koustubh Sinkar 
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

usage="usage: ./pinocchio [-v] [-h] [-c] [-l]\n
To do system operations run the following pinocchio commands as root/sudo.\n
\t setup \t\t setup a complete system from scratch"

pinocchio_root=$PWD
check_root="src/check_root.sh"
set_package_manager="src/set_package_manager.sh"
install_packages="src/install_packages.sh"
install_prerequisites="src/install_prerequisites.sh"
install_cfengine="src/install_cfengine.sh"
custom="src/custom.sh"

echo $PWD

if [[ $1 == "setup" ]]; then
    echo "checking if the user is root"
    source $check_root
    if [[ -f preload.sh ]]; then
        echo "loading the definitions in the preload"
        source preload.sh
    fi
    echo "setting up the package manager"
    source $set_package_manager
    echo "setting up the install packages function"
    source $install_packages
    echo "installing the prerequisites"
    source $install_prerequisites
    echo "installing CFEngine"
    source $install_cfengine
    echo "installing the custom dependencies"
    source $custom
elif [[ $1 == "install" ]]; then
    package_list_file=$2
    if [[ -f $package_list_file ]]; then
        source $check_root
        if [[ -f preload.sh ]]; then
            source $preload
        fi
        source $set_package_manager
        source $install_packages
        install_packages $package_list_file
    else
        echo "File not found"
        exit 1
    fi
elif [[ $1 == "run" ]]; then
    script_to_be_run=$2
    if [[ -f $script_to_be_run ]]; then
        source $check_root
        if [[ -f preload.sh ]]; then
            source $preload
        fi
        source $set_package_manager
        source $install_packages
        source $script_to_be_run
    else
        echo "File not found"
        exit 1
    fi
else
    while getopts "hvcl" opt; do
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
