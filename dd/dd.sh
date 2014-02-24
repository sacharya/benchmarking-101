#!/bin/bash

# storage benchmark - writing cpeed
dd bs=1M count=1024 if=/dev/zero of=tempfile
dd bs=1M count=1024 if=/dev/zero of=tempfile; sync
dd bs=1M count=1024 if=/dev/zero of=tempfile conv=fdatasync
dd bs=1M count=1024 if=/dev/zero of=tempfile oflag=dsync

# cpu benchmark
dd if=/dev/zero bs=1M count=1024 | md5sum



# write to file instead of std out
dd if=/dev/zero of=tempfile bs=1M count=1024 conv=fdatasync

# unbuffered reading speed
echo 3 > /proc/sys/vm/drop_caches
dd if=tempfile of=/dev/null bs=1M count=1024
