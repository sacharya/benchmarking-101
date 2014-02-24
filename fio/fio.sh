#!/bin/bash

sudo apt-get update
sudo apt-get install -y fio

#fio --cmdhelp=rw

FIO_CMD_READ="fio --name=fio_randread --rw=randread --bs=16k \
          --direct=1 --size=2G --filename=fio.tmp --numjobs=4 \
          --time_based --runtime=60 --group_reporting"

#Do a dry run to warm things up and make the data files.
$FIO_CMD_READ

$FIO_CMD_READ --output fio_results/fio-read-run   

FIO_CMD_WRITE="fio --name=fio_randwrite --rw=randwrite --bs=16k \
          --direct=1 --size=2G --filename=fio.tmp --numjobs=4 \
          --time_based --runtime=60 --group_reporting"

echo "Running FIO test iteration"
$FIO_CMD_WRITE --output fio_results/fio-write-run

