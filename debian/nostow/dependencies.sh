#!/usr/bin/env bash

# Debian packages:
sudo apt install reportbug apt-listbugs apt-listchanges apt-mark how-can-i-help gdebi autoconf automake autotools-dev debhelper dh-make dh-autoreconf debian-goodies debian-archive-keyring debianutils debootstrap deborphan devscripts fakeroot patch patchutils pbuilder quilt xutils-dev debbindiff lintian dupload mc git-buildpackage dput git-dpm

# python packages:
sudo apt install python-all-dev python-stdeb python3-all-dev python3-stdeb

# Checkout the patched branch for reproducible-misc git submodule
cd reproducible-misc && git checkout -b viccuad-dotfiles && git pull origin master
