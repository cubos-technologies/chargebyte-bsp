#!/bin/bash

sudo chown yocto build
sudo chgrp yocto build

sudo chown yocto:yocto -R .

repo init -u . -b $(git branch --show-current) -m default.xml
repo sync

source ./source/oe-init-build-env
