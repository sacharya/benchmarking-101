#!/bin/bash

sudo apt-get update
sudo apt-get install -y siege

siege -c 10-v http://www.google.com/

siege -c10 -d10 -r1 -v http://www.google.com/

siege -c10 -d10 -i -f urls.txt
