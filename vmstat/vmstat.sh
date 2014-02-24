#!/bin/bash

vmstat

# Gather load information every 1 second for 5 times
vmstat 1 5

# Gather load information every 5 seconds
vmstat 5
