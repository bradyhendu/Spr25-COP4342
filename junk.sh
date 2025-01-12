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

#Check if the file exists in the current directory
if [ ! -e $FILE ]; then
    echo "Error: File does not exist in the current directory."
    exit 1
fi