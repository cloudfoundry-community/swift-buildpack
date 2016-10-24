#!/bin/bash

set -e

APPLICATION_DIR=$1
APPLICATION_TIMEOUT=$2
TRAVIS_BRANCH=$3
TIMES_TO_REPEAT=$4

cd $APPLICATION_DIR

passed=1

echo "Clearing out any previous instances of $APPLICATION_DIR"
cf delete $APPLICATION_DIR -f

echo "$APPLICATION_DIR threshold value is $APPLICATION_TIMEOUT"
echo

for num in `seq 1 $TIMES_TO_REPEAT`; do
	START_TIME=$SECONDS
	cf push -b https://github.com/IBM-Swift/swift-buildpack.git#$TRAVIS_BRANCH
	ELAPSED_TIME=$(($SECONDS - $START_TIME))
	cf delete $APPLICATION_DIR -f
	echo "$APPLICATION_DIR took $ELAPSED_TIME seconds."
	if [ "$ELAPSED_TIME" -lt "$APPLICATION_TIMEOUT" ]; then
		echo "Application was under threshold value."
		passed=0
		break
	fi
	echo "$APPLICATION_DIR took longer than the threshold value."
done

cd ..

exit $passed
