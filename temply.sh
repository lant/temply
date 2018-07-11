#!/bin/bash 

CONF_DIRECTORY=$HOME/.temply
CONF_FILE=$CONF_DIRECTORY/temply.cnf

## 
# Methods

array_contains () {
    local seeking=$1; shift
    local in=1
    for element; do
        if [[ $element == $seeking ]]; then
            in=0
            break
        fi
    done
    return $in
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
echo ${CONF_FILE}
. ${CONF_FILE}

echo ${TEMPLY_EDITOR}
# get the EDITOR
if [[ -z "${TEMPLY_EDITOR}" ]]; then
  echo "Not editor set, will use $EDITOR"
fi 

TEMPLATE=$1

TEMPLATES=`ls $CONF_DIRECTORY/templates/`
if [ ! array_contains $TEMPLATE ${TEMPLATES[@]}]; then 
  echo "Unknown template: $TEMPLATE. It is not present in the templates list: ${TEMPLATES[@]}" 
fi 




# get the template from the parameter
# copy it to the work directory
# open up terminal with it
# format to web or something and start it to show the formatted output

