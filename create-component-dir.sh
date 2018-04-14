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

		# create index.js
		sh create-index.js.sh $COMPONENT

		# create $COMPONENT.js
		sh create-component.js.sh $COMPONENT

		# create $COMPONENT.css
		sh create-component.css.sh $COMPONENT		

	fi

done