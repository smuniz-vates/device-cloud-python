#!/bin/sh
# --------------------------------------------------------------------
# Restore phase:
# This phase is a window to recover from install errors.
# 
# Scenario 1:
# install succeeded, but post install discovered an issue.  Start the
# watchdog here.  The watchdog will trigger a reboot in about 3
# minutes.
#
# Note: back up any state files or other data that will not survive the
# rollback, i.e. anything after the pre_install snapshot
# --------------------------------------------------------------------

snapshot_util.py -w

# --------------------------------------------------------------------
# Scenario 2:
# this scenario will rollback on ANY install error.  Note, pre_install
# must have done a snapshot to restore to.
# --------------------------------------------------------------------

# snapshot_util.py -t
# sudo shutdown -r +1
