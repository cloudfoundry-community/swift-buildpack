#!/bin/sh

GSA_USER=$1
GSA_PASS=$2
VERSION=$3
DATE=$4
FILE=$5

ftp ftp://$GSA_USER:$GSA_PASS@rtpmsa.raleigh.ibm.com <<END_SCRIPT
cd /projects/w/wascloudgsa/OERuntimeMileStone/SwiftBuildpack
mkdir v$VERSION
cd v$VERSION
mkdir $DATE
cd $DATE
mkdir bluemix_files
cd bluemix_files
bin
put $FILE
quit
END_SCRIPT

