#!/bin/bash

sudo apt-get update
sudo apt-get install -y iozone3

# this needs sudo?
drop_cache() {
    echo 3 > /proc/sys/vm/drop_caches
}

# a - auto mode
drop_cache
iozone -a

# f - filename under test
drop_cache
iozone -a -f /tmp/iozone.tmp

# b - excel filename
drop_cache
iozone -Ra -b iozone_results/iozone-ra.xls

# g - maximum file size in k m or g
drop_cache
iozone –Ra –g 2G -b iozone_results/iozone-ra-2g.csv

# i - tyoe of tests to run (0=write/rewrite, 1=read/re-read, 2=random-read/write
#    3=Read-backwards, 4=Re-write-record, 5=stride-read,
#    6=fwrite/re-fwrite, 7=fread/Re-fread, 8=random_mix, 9=pwrite/Re-pwrite,
#    10=pread/Re-pread, 11=pwritev/Re-pwritev, 12=preadv/Re-preadv)
drop_cache
iozone –Ra –g 2G –i 0 –i 1 -b iozone_results/iozone-ra-2g-i.csv 

# r - record size
# s - size of file
# t - number of thread
drop_cache
# read-write/random-read-write a 2g file in 4m chunks from current directory with 15 threads.
iozone -i 0 -i 1 -i 2 -r 4m -s 2g -t 15



