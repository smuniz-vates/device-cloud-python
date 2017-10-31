#!/bin/sh -x
echo "pre install"

# take a snapshot of the file system before doing anything
snapshot_util.py -s
exit 0
