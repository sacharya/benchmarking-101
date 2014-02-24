#!/bin/bash

sudo apt-get update
sudo apt-get install -y dbench

iostat -x 1

iostat -tx 1

# x - extended info
# m - MBPS
# t - time
# run 10 reports at every 2 seconds
# for all devices
iostat -x -m -t 2 10

