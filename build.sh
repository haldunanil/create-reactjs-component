#!/usr/bin/env bash

# check that there is a src directory i.e. we're in the parent dir
if [ -d "src" ]
then
	echo Found src directory.
else
	echo Directory must contain src directory.
	exit 1
fi

# check if components folder already exists, if not create
if [ -d "src/components" ]
then
	# components folder exists, so do nothing
	echo Found src/components subdirectory.
else
	# components folder doesn't exist, so create
	echo src/components doesn\'t exist, creating.
	mkdir src/components
fi

# loop through all of the arguments, which should correspond to component names and initialize files and folders
for COMPONENT in "$@"
do

	if [ -d src/components/$COMPONENT ]
	then
		# folder already exists
		echo $COMPONENT folder already exists, skipping.
	else
		# create the component directory
		mkdir src/components/$COMPONENT

		# get location of build.sh
		SOURCE="${BASH_SOURCE[0]}"
		while [ -h "$SOURCE" ]; do # resolve $SOURCE until the file is no longer a symlink
		  DIR="$( cd -P "$( dirname "$SOURCE" )" && pwd )"
		  SOURCE="$(readlink "$SOURCE")"
		  [[ $SOURCE != /* ]] && SOURCE="$DIR/$SOURCE" # if $SOURCE was a relative symlink, we need to resolve it relative to the path where the symlink file was located
		done
		DIR="$( cd -P "$( dirname "$SOURCE" )" && pwd )"

		# create index.js
		sh $DIR/create-index.js.sh $COMPONENT

		# create $COMPONENT.js
		sh $DIR/create-component.js.sh $COMPONENT

		# create $COMPONENT.css
		sh $DIR/create-component.css.sh $COMPONENT		

		# Inform user that everything was created
		echo $COMPONENT component was created. Looks like:
		echo "
src
├── components
	├── $COMPONENT
		├── index.js
		├── $COMPONENT.js
		├── $COMPONENT.css"

	fi

done