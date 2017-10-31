#!/bin/sh

echo "Post install"

# --------------------------------------------------------------------
# Scenario:
# In this example, a bad install will be setup such that the
# connectivity is lost.  The cloud-test.py application is designed to
# test connectivity.  If it returns non zero, it is an error.  The
# rollback trigger files will be written (snapshot_util.py -t) and an
# error with be returned.  This will call the err_install action,
# which will start the watchdog.  The watchdog will trigger a rollback
# in about 3 minutes.
#
# Note: under normal circumstances, the connectivity will be active
# and the trigger flags can be safely cleared (snapshot_util.py -c).
# --------------------------------------------------------------------
sudo rm -fr /etc/python-device-cloud/iot-connect.cfg

# write trigger files
snapshot_util.py -t

cloud-test.py
if [ "$?" = "0" ]; then
	echo "Connectivity test passed.  Post install succeeded"

	# clear the flags
	snapshot_util.py -c
	ret=0
else
	echo "Connectivity test failed.  Rolling back"
	ret=1
fi


#in this example, I don't want the err_install script to take over
exit $ret 
