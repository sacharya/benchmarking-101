#!/bin/bash

sudo apt-get update
sudo apt-get install -y netperf

# server
netserver

#clients
netperf -H 10.208.98.115

netperf -H 10.208.98.115 -l 15

netperf -H 10.208.98.115 -l 15 -f M

# default is TCP_STREAM
netperf -t UDP_RR -H 10.208.98.115 -l 15

# fetch CPU utilization info while doing the test using c(local) amd C(remote)
# parameters
netperf -H 10.208.98.115 -l 15 -c -C


