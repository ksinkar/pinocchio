#!/usr/bin/env bash

cfengine_pkg="cfengine-community_3.10.1-1_amd64-debian7.deb"

apt-get install -y wget perl net-tools
wget -qO- https://cfengine-package-repos.s3.amazonaws.com/pub/gpg.key | apt-key add -
wget --continue --no-verbose https://cfengine-package-repos.s3.amazonaws.com/community_binaries/${cfengine_pkg}
dpkg -i ${cfengine_pkg}
apt-get install -y cfengine-community
cp --recursive /var/cfengine/masterfiles/* /var/cfengine/inputs/
service cfengine3 start

