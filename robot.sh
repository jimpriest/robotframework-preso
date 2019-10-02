#!/bin/bash
IMAGE_NAME='robot-docker'

# Modify this to point to where your Robot tests live.  A /results directory will also be written to this directory with logs, results and screenshots.
# Note: You do *not* have to rebuild since this script is run from local machine!

# Example: TEST_PATH='/home/user/tests'
# This default will use the example /test directory in this repo
TEST_PATH=$(pwd)

# If you want time stamped output result files add:  --timestampoutputs 
# Default behavior is to overwrite the results each test

docker run -it --security-opt seccomp=$(pwd)/chrome.json --shm-size=1gb  -v $TEST_PATH:/robot $IMAGE_NAME:latest robot --outputdir results/ $@ .
RESULT=$?
exit $RESULT
