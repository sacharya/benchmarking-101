#!/bin/bash

sudo apt-get update
sudo apt-get install -y apache2-utils

ab -n 10000 -c 100 http://www.google.com/
