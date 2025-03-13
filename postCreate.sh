#!/bin/bash

sudo chown yocto build
sudo chgrp yocto build

repo init -u . -b ${git branch --show-current} -m default.xml
repo sync

source ./yocto/source/oe-init-build-env
