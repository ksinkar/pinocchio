#!/usr/bin/env bash

cfengine_pkg="cfengine-community-3.10.1-1.el6.x86_64.rpm"

rpm --import https://cfengine-package-repos.s3.amazonaws.com/pub/gpg.key
wget --continue --no-verbose https://cfengine-package-repos.s3.amazonaws.com/community_binaries/${cfengine_pkg}
