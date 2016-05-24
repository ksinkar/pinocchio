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
    source check_root.sh
    source preload.sh
    source set_package_manager.sh
    source install_packages.sh
    source personal.sh
    source set_users_groups.sh
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
