#!/bin/bash

#####################################################################
#####################################################################
## Copyright(C) 2012 Koustubh Sinkar 
## 
## This program is free software: you can redistribute it and/or modify
## it under the terms of the GNU General Public License as published by
## the Free Software Foundation, either version 3 of the License, or
## (at your option) any later version.
## 
## This program is distributed in the hope that it will be useful,
## but WITHOUT ANY WARRANTY; without even the implied warranty of
## MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
## GNU General Public License for more details.
## 
## You should have received a copy of the GNU General Public License
## along with this program.  If not, see <http://www.gnu.org/licenses/
#####################################################################
#####################################################################

function install_packages() {
    packages_file=$1
    if [[ -f $packages_file ]]; then
        nbsp=" "
        packages_list=""
        while read -r line; do
            packages_list=$packages_list$nbsp$line
        done < $packages_file
        command $package_manager $packages_list
    else
        echo -e "No such file ${packages_file} exists.\n EXITING"
        exit
    fi
}
