#!/bin/bash

sudo apt-get update
sudo apt-get install -y iperf

rm -rf iperf_results
mkdir iperf_results

# run on server
iperf -s
# run on client
# basic 10 seconds bw test
iperf -c 10.208.98.115

iperf -s
# bi-directional bw measurement 
iperf -c 10.208.98.115 -r

iperf -s
# Simultaneous bi-directional bandwidth measurement 
iperf -c 10.208.98.115 -d

iperf -s
# Set a time t and internal i for periodic display.
iperf -c 10.208.98.115 -t 20 -i 2

iperf -us
# use udp rather than tcp.
iperf -c 10.208.98.115 -u

iperf -s
# over public interface
iperf -c 23.23.23.23

iperf -s
# no of parallels client threads to run 
iperf -c 23.23.23.23 -P 4

