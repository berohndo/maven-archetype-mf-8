#!/usr/bin/bash

if [ $# -ne 2 ] && [ $# -ne 3 ] 
then
	echo "$0 <groupid> <artefactid> [package]"
	exit 1
fi

GROUP_ID=$1
ARTEFACT_ID=$2

if [ $# -eq 3 ] 
then
	PACKAGE=$3
else
	PACKAGE=${GROUP_ID}.${ARTEFACT_ID}
fi

DIR=${GROUP_ID}-${ARTEFACT_ID}

mvn archetype:generate \
    -DgroupId=${GROUP_ID} \
    -DartifactId=${ARTEFACT_ID} \
    -DarchetypeGroupId=at.ijt \
    -DarchetypeArtifactId=archetype \
    -DarchetypeVersion=1.0-SNAPSHOT \
    -Dpackage=${PACKAGE} \
    -DinteractiveMode=false

mv $ARTEFACT_ID $DIR
