#!/bin/bash 

CONF_DIRECTORY=$HOME/.temply
CONF_FILE=${CONF_DIRECTORY}/temply.cnf

## 
# Methods

template_contains () {
    local seeking=$1; shift
    local in=1
    for element; do
        temp_name=`basename ${element} .md`
        if [[ ${temp_name} == ${seeking} ]]; then
            in=0
            break
        fi
    done
    return ${in}
}

##
# Main 

# check that the conf file exists. 
if [ ! -d "$CONF_DIRECTORY" ]; then
  echo "$CONF_DIRECTORY directory does not exist. Please create it, add templates and configuration file" 
  exit 1
fi

if [ ! -f "$CONF_FILE" ]; then 
  echo "Configuration file $CONF_FILE does not exist."
  exit 1
fi 

# read the conf. 
. ${CONF_FILE}

# get the EDITOR
if [[ -z "${TEMPLY_EDITOR}" ]]; then
  echo "Not editor set, will use ${EDITOR}"
  TEMPLY_EDITOR=${EDITOR}
fi 

# get the OUTPUT_DIRECTORY
if [[ -z "${OUTPUT_DIRECTORY}" ]]; then
  echo "You did not set the output directory, documents will be saved in your home"
  OUTPUT_DIRECTORY="${HOME}"
fi 

SELECTED_TEMPLATE=$1

NOW=`date +%Y-%m-%d-%H-%M-%S`
if [ -z "$2" ]; then 
  TITLE=${NOW}
else 
  TITLE="${NOW}-${2}"
fi 
TITLE="${TITLE}.md"

TEMPLATES=`ls ${CONF_DIRECTORY}/templates/`
if ! template_contains ${SELECTED_TEMPLATE} ${TEMPLATES[@]}; then
  echo "No template found"
fi

OUTPUT_FILE="${OUTPUT_DIRECTORY}/${TITLE}"

eval cp "${CONF_DIRECTORY}/templates/${SELECTED_TEMPLATE}.md ${OUTPUT_FILE}"

${TEMPLY_EDITOR} ${OUTPUT_FILE}
