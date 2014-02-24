#!/bin/bash

sudo apt-get update
sudo apt-get install -y wget gcc make

wget https://byte-unixbench.googlecode.com/files/UnixBench5.1.3.tgz
tar -xzf UnixBench5.1.3.tgz

cd UnixBench

./Run

./Run -c `grep -c processor /proc/cpuinfo`
