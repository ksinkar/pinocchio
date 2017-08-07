#!/bin/bash

#####################################################################
#####################################################################
## Copyright(C) 2017 Koustubh Sinkar 
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


cfengine_repos_file="${pinocchio_root}/src/package_lists/${distro}/cfengine.txt"
cfengine_masterfiles="/var/cfengine/masterfiles/*"
cfengine_inputfiles="/var/cfengine/inputs/"

install_packages $cfengine_repos_file

cp --recursive $cfengine_masterfiles $cfengine_inputfiles
