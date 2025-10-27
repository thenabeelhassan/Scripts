#!/bin/bash

set -euxo pipefail

apt update
apt -y install git binutils rustc cargo pkg-config libssl-dev gettext
cd /tmp
git clone https://github.com/aws/efs-utils
cd /tmp/efs-utils
sh ./build-deb.sh
apt -y install ./build/amazon-efs-utils*deb
