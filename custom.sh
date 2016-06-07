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

# running custom preinstall scripts
preinstall="custom/scripts/pre_install/${distro}/"

if [[ -d $preinstall ]]; then
    for script in $(ls ${preinstall}/*.sh); do
        source $script
    done
fi

# installing custom packages
packages_dir="custom/package_lists/${distro}/" 

if [[ -d $packages_dir ]]; then
    for packages_file in $(ls ${packages_dir}/*.txt); do
        install_packages $packages_file
    done
fi

# running custom postinstall scripts
postinstall="custom/scripts/post_install/${distro}/"

if [[ -d $postinstall ]]; then
    for script in $(ls ${postinstall}/*.sh); do
        source $script
    done
fi
