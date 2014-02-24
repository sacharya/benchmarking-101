#!/bin/bash

sudo apt-get update
sudo apt-get install -y bonnie++

bonnie 

bonnie -d /tmp -s 4G -m suda-benchmarks -n 0 -f -b

bonnie -d /tmp -r 4096 -u root 
