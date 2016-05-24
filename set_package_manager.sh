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

# Declaring all the regex to be required later
linux="[Ll]inux"
debian="[Dd]ebian"
ubuntu="[Uu]buntu"
fedora="[Ff]edora"
redhat="[Rr]edhat"
centos="[Cc]entos"
archlinux="[Aa]rchlinux"
darwin="[Dd]arwin"

os=$(uname)

if [[ $os =~ $linux ]]; then
    distribution=(cat /etc/*release)
elif [[ $os =~ $darwin ]]; then
    distribution="osx"
else
    echo -e "UNKNOWN OPERATING SYSTEM\n Exiting NOW!"
    exit
fi

yum="yum install -y"
dnf="dnf install --assumeyes"
apt="apt-get install --assume=yes"
pac="pacman -S"

if [[ $distribution =~ $redhat ]] || [[ $distribution =~ $centos ]] || [[ $distribution =~ $fedora ]]; then
    distro="redhat"
    package_manager=$dnf
elif [[ $distribution =~ $ubuntu ]] || [[ $distribution =~ $debian ]]; then
    distro="debian"
    package_manager=$apt
elif [[ $distribution =~ $archlinux ]]; then
    distro="arch"
    package_manager=$pac
else
    echo -e "UNKNOWN DISTRIBUTION\n Exiting NOW!"    
    exit
fi
