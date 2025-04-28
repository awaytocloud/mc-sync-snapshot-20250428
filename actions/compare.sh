#!/bin/zsh

# This script compares contents of the $LOCAL_DIR (source) and $REMOTE_DIR (destination) directories on the object level.
# Based on `mc diff -h` it "only calculates differences in object name, size and time. It *DOES NOT* compare objects' contents".








# ----------DEPRECATED---------- >

# Writing to the text file to be replaced with the SQL queries

# mc diff $LOCAL_DIR $REMOTE_DIR > ./comparison/comparison.txt
# # NEED to split `comparison.txt` into 3 additional files with corresponding object lists

# UNIQUE_SRC=$(awk '/^</' ./comparison/comparison.txt | awk 'END { print NR }')
# UNIQUE_DST=$(awk '/^>/' ./comparison/comparison.txt | awk 'END { print NR }')
# NEWER_SRC=$(awk '/^!/' ./comparison/comparison.txt | awk 'END { print NR }')

# ----------DEPRECATED---------- <





#  < - object is only in source.
# echo -e "\e[92mGREEN\e[0m"
if [ $UNIQUE_SRC -ne 0 ]; then
    echo -e "\e[92m>> There are $UNIQUE_SRC new local objects to be uploaded to\e[0m \e[3m$REMOTE_DIR\e[0m"
    echo -e "   - Consider the \e[4mupload\e[0m key to upload those objects"
    echo -e "   - See \e[3m'upload.txt'\e[0m for the list of all involved objects"
    echo -e "   - Provide the \e[4mcancel\e[0m key to abort the program execution"
fi

#  > - object is only in destination.
# echo -e "\e[91mRED\e[0m"
if [ $UNIQUE_DST -ne 0 ]; then
    echo -e "\e[91m<< There are $UNIQUE_DST remote objects currently absent in\e[0m \e[3m$LOCAL_DIR\e[0m"
    echo -e "   - Consider either the \e[4mdownload\e[0m key to download those objects locally or the \e[4mmirror\e[0m key to wipe them remotely"
    echo -e "   - See \e[3m'download.txt'\e[0m for the list of all involved objects"
    echo -e "   - Provide the \e[4mcancel\e[0m key to abort the program execution"
fi

#  ! - newer object is in source.
# echo -e "\e[93mYELLOW\e[0m"
if [ $NEWER_SRC -ne 0 ]; then
    echo -e "\e[93m!! There are $NEWER_SRC local objects that have changed since the previous upload\e[0m"
    echo -e "   - Consider either the \e[4mrename\e[0m key to rename those objects locally & upload or the \e[4mignore\e[0m key to replace the remote originals"
    echo -e "   - See \e[3m'rename.txt'\e[0m for the list of all involved objects"
    echo -e "   - Provide the \e[4mcancel\e[0m key to abort the program execution"
fi

# ELSE in case all 3 values are ZEROES
if [ $UNIQUE_SRC -eq 0 ] && [ $UNIQUE_DST -eq 0 ] && [ $NEWER_SRC -eq 0 ]; then
    echo -e "\e[96m** Local and remote directories are in sync\e[0m"
    echo -e "   - Provide the \e[4mcancel\e[0m key to abort the program execution"
fi


