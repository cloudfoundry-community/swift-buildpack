#!/bin/bash

set -ev

APPLICATION_DIR=$1
APPLICATION_TIMEOUT=$2
TRAVIS_BRANCH=$3
TIMES_TO_REPEAT=$4
APPLICATION_REPUSH_TIMEOUT=$5

push_application () {
	DELETE_FLAG=$1
	TIMEOUT=$2

	local RETVAL=1

	if [ "$DELETE_FLAG" = true ]; then
		echo "Clearing out any previous instances of $APPLICATION_DIR"
		cf delete $APPLICATION_DIR -f
	fi

	echo "$APPLICATION_DIR threshold value is $TIMEOUT"
	echo
	for num in `seq 1 $TIMES_TO_REPEAT`; do
		START_TIME=$SECONDS
		cf push -b https://github.com/IBM-Swift/swift-buildpack.git#$TRAVIS_BRANCH
		ELAPSED_TIME=$(($SECONDS - $START_TIME))
		
		if [ "$DELETE_FLAG" = true ]; then
			cf delete $APPLICATION_DIR -f
		fi
		
		echo "$APPLICATION_DIR took $ELAPSED_TIME seconds."
		
		if [ "$ELAPSED_TIME" -lt "$TIMEOUT" ]; then
			echo "Application was under threshold value."
			RETVAL=0
			break
		fi

		echo "$APPLICATION_DIR took longer than the threshold value."
	done

	echo "$RETVAL"	
}

cd $APPLICATION_DIR

passed=$(push_application true $APPLICATION_TIMEOUT)

passed_repush=$(push_application false $APPLICATION_REPUSH_TIMEOUT)

cd ..

! (( $passed | $passed_repush ));

exit $?
