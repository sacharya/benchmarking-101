#!/bin/bash

sudo apt-get update
sudo apt-get install -y hdparm

sudo hdparm -tT /dev/xvda1

sudo hdparm -tT --direct /dev/xvda1
