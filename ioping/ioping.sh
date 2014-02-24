#!/bin/bash

sudo apt-get update
sudo apt-get install -y ioping

# measure disk IO latency
ioping . -c 10

# stop after 10 requests
ioping /tmp -c 10

echo "Running ipoing -RC iteration $i"
# measure seek rate test with cached IO
ioping /tmp -RC

echo "Running ioping -RD iteration $i"
# measure seek rate test with direct IO
ioping /tmp -RD

echo "Running ioping -RL iteration $i"
# measure seek rate test with sequential operations
ioping /tmp -RL

echo "Running ioping -RD iteration $i"
# mesaure disk seek rate test with direct IO
sudo ioping /dev/xvda1 -R
