#!/bin/sh

# Author: Brady Henderson
# Assignment 1: Junk Shell Script
# Purpose: This script moves a specified file to a .junk directory within the user's $HOME directory
#          for potential later recovery. If the .junk directory does not exist, it will be created.

# Check if the user has passed exactly one argument
if [ $# -ne 1 ]; then
    echo "Error: Inappropriate use of junk, too many arguments. Usage: junk <filename>"
    exit 1
fi

# Get the filename argument
FILE=$1

# Check if the file exists in the current directory
if [ ! -e $FILE ]; then
    echo "Error: File does not exist in the current directory."
    exit 1
fi

# Check if the file is writeable
if [ ! -w $FILE ]; then
    echo "Error: File is not writeable."
    exit 1
fi

# Handle case where file is a directory
if [ -d $FILE ]; then
    echo "The specified file is a directory. Do you want to move the directory and all of its contents to the junk directory? (y/n)"
    read RESPONSE
    if [ $RESPONSE != "y" ]; then
        echo "File not moved to junk."
        exit 1
    fi
fi

# Define the junk directory
JUNKDIR=$HOME/.junk

# Check if the junk directory exists, if not create it. Ensure that the directory was created successfully.
if [ ! -d $JUNKDIR ]; then
    mkdir $JUNKDIR
    if [ $? -ne 0 ]; then
        echo "Error: Could not create the junk directory."
        exit 1
    fi
fi

# If the file already exists in the junk directory, prompt the user to overwrite it. For a directory, you can't overwrite it.
if [ -e $JUNKDIR/$FILE ]; then
    if [ -d $JUNKDIR/$FILE ]; then
        echo "Error: The file already exists in the junk directory."
        exit 1
    fi
    echo "The file already exists in the junk directory. Do you want to overwrite it? (y/n)"
    read RESPONSE
    if [ $RESPONSE != "y" ]; then
        echo "File not moved to junk."
        exit 1
    fi
fi

# Move the file to the junk directory
mv $FILE $JUNKDIR
if [ $? -ne 0 ]; then
    echo "Successfully moved $FILE to $JUNKDIR"
else
    echo "Error: Could not move $FILE to $JUNKDIR"
    exit 1
fi

