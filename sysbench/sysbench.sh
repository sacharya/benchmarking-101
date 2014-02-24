#!/bin/bash

sudo apt-get update
sudo apt-get install -y sysbench

sysbench --batch --batch-delay=5 --test=threads run
sysbench --test=cpu --cpu-max-prime=20000 run
sysbench --num-threads=64 --test=threads --thread-yields=100 --thread-locks=2 run

# fileop
sysbench --num-threads=16 --test=fileio --file-total-size=3G --file-test-mode=rndrw prepare
sysbench --num-threads=16 --test=fileio --file-total-size=3G --file-test-mode=rndrw run
sysbench --num-threads=16 --test=fileio --file-total-size=3G --file-test-mode=rndrw cleanup

# install mysql
# oltp
sysbench --test=oltp --mysql-table-type=myisam --oltp-table-size=1000000 --mysql-socket=/tmp/mysql.sock prepare
sysbench --num-threads=16 --max-requests=100000 --test=oltp --oltp-table-size=1000000 --mysql-socket=/tmp/mysql.sock --oltp-read-only run

# reddwarf tests
sysbench --test=oltp --oltp-table-size=2000000 --mysql-user=perf_user
--mysql-password=password --mysql-host=127.0.0.1 --mysql-db=perf_db
--mysql-table-engine=innodb prepare

sysbench --max-time=3600 --num-threads=124 --max-requests=2000000 --test=oltp
--mysql-user=perf_user --mysql-password=password --mysql-host=127.0.0.1
--mysql-db=perf_db run

sysbench --test=oltp --mysql-user=perf_user --mysql-host=127.0.0.1
--mysql-password=password --mysql-db=perf_db cleanup

