#!/usr/bin/env bash

cfengine_pkg="cfengine-community-3.10.1-1.x86_64.rpm"

rpm --import https://cfengine-package-repos.s3.amazonaws.com/pub/gpg.key

if [[ "${arch}" == "x86_64" ]]; then    
    zypper addrepo -t YUM https://cfengine-package-repos.s3.amazonaws.com/pub/yum/x86_64 cfengine-repository
else
    zypper addrepo -t YUM https://cfengine-package-repos.s3.amazonaws.com/pub/yum/i386 cfengine-repository
fi
