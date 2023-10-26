#!/bin/bash
set -e
set -x

# Update the package list on Ubuntu
sudo apt-get update

# Install Git and Git tools
sudo apt-get install git
sudo apt-get install gitk git-gui

# Clone the ArduPilot repository with submodules
git clone --recurse-submodules https://github.com/ArduPilot/ardupilot.git

# Install prerequisite software and dependencies
cd ardupilot
./Tools/environment_install/install-prereqs-ubuntu.sh

# Configure the build process for the "sitl" target
./waf configure --board sitl
