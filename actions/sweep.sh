#!/bin/zsh

# This script checks the exclusion list and wipes found matches
# from both local and remote directories. The idea is to avoid system
# files like ".DS_Store" in both directories and to retain only
# desired data.

# Sweeping from the local directory
for exclusion_local in "${EXCLUSIONS[@]}"; do

    mc find $LOCAL_DIR --name $exclusion_local # --exec "mc rm {}" # 1> /dev/null
        
done

echo "\n< local dir | remote dir >\n"

# Sweeping from the remote directory
for exclusion_remote in "${EXCLUSIONS[@]}"; do
    
    mc find $REMOTE_DIR --name $exclusion_remote # --exec "mc rm {}" # 1> /dev/null
        
done