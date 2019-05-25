#!/usr/bin/env bash

validateCWD() {
	# check that there is a src directory i.e. we're in the parent dir
	dir="src"
	if [ -d "${dir}" ]
	then
		printf "Found ${dir} directory.\n"
	else
		printf "You are in the wrong directory.  You should be in the root of the React project, and ${dir}/ should be a subdirectory.\n"
		exit 1
	fi
}

validateTemplateDir() {
	# check that there is a src directory i.e. we're in the parent dir
	repo_path="$1"
	template="$2"
	dir="${repo_path}/templates/${template}"
	pwd
	printf "$repo_path"
	pwd
	if [ -d "${dir}" ]
	then
		printf "Found '${template}' template.\n"
	else
		printf "There is no template called '${template}'.\n"
		exit 1
	fi
}

makeComponentsDir() {
	# check if components folder already exists, if not create
	if [ -d "src/components" ]; then
		# components folder exists, so do nothing
		printf 'Found src/components subdirectory.\n'
	else
		# components folder doesn't exist, so create
		printf "src/components doesn\'t exist, creating.\n"
		mkdir src/components
	fi
}

makeComponent() {
	# args
	REPO_DIR="$1"
	TEMPLATE="$2"
	COMPONENT="$3"
	# initialize files and folders for the component
	if [ -d src/components/$COMPONENT ]; then
		# folder already exists
		printf "$COMPONENT folder already exists, skipping.\n"
	else
		# create the component directory
		mkdir src/components/$COMPONENT

		# create README.md
		sh $REPO_DIR/templates/$TEMPLATE/create-readme.md.sh $COMPONENT

		# create index.js
		sh $REPO_DIR/templates/$TEMPLATE/create-index.js.sh $COMPONENT

		# create $COMPONENT.js
		sh $REPO_DIR/templates/$TEMPLATE/create-component.js.sh $COMPONENT

		# create $COMPONENT.scss
		sh $REPO_DIR/templates/$TEMPLATE/create-component.scss.sh $COMPONENT

		# create $COMPONENT.test.js
		sh $REPO_DIR/templates/$TEMPLATE/create-component.test.js.sh $COMPONENT

		# Inform user that everything was created
		printf "$COMPONENT component was created. Looks like:\n"
		printf "
src
├── components
	├── $COMPONENT
		├── index.js
		├── $COMPONENT.js
		├── $COMPONENT.test.js
		├── $COMPONENT.scss
		├── README.md
		"
	fi
}

printUsage() {
	printf "Usage: create-react-component [-t template-name] NewComponentName\n"
}

run() {
	# args
	repo_path="$1"
	template="$2"
	component="$3"
	# check that there is a src directory i.e. we're in the parent dir
	validateCWD
	# checks that the template you requested exists
	validateTemplateDir "${repo_path}" "${template}"
	# check if components folder already exists, if not create
	makeComponentsDir
	# initialize files and folders for the component
	makeComponent "${repo_path}" "${template}" "${component}"
}

# MAIN script starts here

# default args
template='default-template'
component='DefaultComponentName'

while test $# -gt 0; do
  case "$1" in
	  -t|--template)
			shift
			if test $# -gt 0; then
				template="$1"
			fi
			shift
      ;;
	  *)
			if test $# -gt 0; then
				component="$1"
			fi
			shift
			break
      ;;
  esac
done

# get location of build.sh
SOURCE="${BASH_SOURCE[0]}"
while [ -h "$SOURCE" ]; do # resolve $SOURCE until the file is no longer a symlink
  DIR="$( cd -P "$( dirname "$SOURCE" )" && pwd )"
  SOURCE="$(readlink "$SOURCE")"
  [[ $SOURCE != /* ]] && SOURCE="$DIR/$SOURCE" # if $SOURCE was a relative symlink, we need to resolve it relative to the path where the symlink file was located
done
repo_path="$( cd -P "$( dirname "$SOURCE" )" && pwd )"

run "${repo_path}" "${template}" "${component}"
