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

# Declaring all the regex to be required later
linux="[Ll]inux"
debian="[Dd]ebian"
ubuntu="[Uu]buntu"
fedora="[Ff]edora"
redhat="[Rr]edhat"
suse="[Ss][Uu][Ss][Ee]"
centos="[Cc]ent[Oo][sS]"
archlinux="[Aa]rchlinux"
darwin="[Dd]arwin"

os=$(uname -s)
arch=$(uname -m)

if [[ $os =~ $linux ]]; then
    type -t lsb_release
    does_lsb_release_exist=$?
    if [[ $does_lsb_release_exist -eq 0 ]]; then
        distribution=$(lsb_release --id)
    else
        distribution=$(cat "/etc/os-release" | head -n 1)
    fi
elif [[ $os =~ $darwin ]]; then
    distribution="osx"
else
    echo -e "UNKNOWN OPERATING SYSTEM\n Exiting NOW!"
    exit
fi

yum="yum install --assumeyes"
dnf="dnf install --assumeyes"
zypper="zypper -n install"
apt="apt-get install --assume=yes"
pac="pacman -S"

if [[ $distribution =~ $fedora ]]; then
    distroot="redhat"
    package_manager=$dnf
elif [[ $distribution =~ $redhat ]] || [[ $distribution =~ $centos ]]; then
    distroot="redhat"
    package_manager=$yum
elif [[ $distribution =~ $ubuntu ]] || [[ $distribution =~ $debian ]]; then
    distroot="debian"
    package_manager=$apt
elif [[ $distribution =~ $suse ]]; then
    distroot="suse"
    package_manager=$zypper
elif [[ $distribution =~ $archlinux ]]; then
    distroot="arch"
    package_manager=$pac
else
    echo -e "UNKNOWN DISTRIBUTION\n Exiting NOW!"    
    exit 1
fi
