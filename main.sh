#!/bin/zsh

# This is the main script to define the input data and actions applied to it.

# Defining local and remote directories to work with
LOCAL_DIR=
REMOTE_DIR=

# Defining the exclusion list to sweep out both directories
EXCLUSIONS=(".DS_Store" "*.ini" "*.INI")

# Defining the MySQL DB to work with
DATABASE=mcsyncdb

# DB-related section goes here
# Currently working directly with the ./actions_sql/database.sh file



# Invoking the sweep
# source ./actions/sweep.sh

# Comparing both directories
# source ./actions/compare.sh

