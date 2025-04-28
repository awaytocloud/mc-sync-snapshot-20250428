#!/bin/zsh

# This script uploads objects from $LOCAL_DIR to $REMOTE_DIR directory.
# Behavior:



mc mirror --overwrite --disable-multipart --limit-upload 5Mi --quiet $LOCAL_DIR $REMOTE_DIR
