#!/bin/sh

# Author: Brady Henderson
# Assignment 3: Create a Phonebook Utility
# Purpose: This script allows insertion, deletion, or modification of a record in phonebook.dat, as well as printing records
#          to the screen. =The first argument will be -i, -d, -m, or -p, followed by the appropriate arguments for that option.
#          This assignment is meant to teach me more aboutthe shift command, appending output to a file, the sort, grep, awk, and cut 
#          commands, and the use of temporary files.


# Check if phonebook.dat exists, if not create it
if [ ! -f phonebook.dat ]
then
    touch phonebook.dat
fi
# Check if the user has passed more than two arguments
if [ $# -lt 2 ]
then
    echo "Error: Inappropriate use of phonebook.sh, not enough arguments. Usage: phonebook.sh [-i last first number address] [-d last first] [-m last first address] [-p pattern]"
    exit 1
fi

# Check if the user has properly used -i, -d, -m, or -p as the first argument
if [ "$1" != "-i" ] && [ "$1" != "-d" ] && [ "$1" != "-m" ] && [ "$1" != "-p" ]
then
    echo "Error: Inappropriate use of phonebook.sh, first argument must be -i, -d, -m, or -p."
    exit 1
fi

# If the user has chosen to insert a record, ensure that there is enough information to do so
if [ "$1" = "-i" ] && [ $# -lt 5 ]
then
    echo "Error: Inappropriate use of phonebook.sh, not enough arguments for -i. Usage: phonebook.sh -i <last> <first> <number> <address>"
    exit 1
else
    # If the user has chosen to insert a record, append the record to phonebook.dat
    if [ "$1" = "-i" ]
    then
        shift 1
        last=$1
        shift 1
        first=$1
        shift 1
        number=$1
        shift 1
        address="$*"
        #if the exact last and first name already exists in the phonebook, print error and exit
        if grep -q "$last $first" phonebook.dat
        then
            echo "Error: Record already exists in phonebook.dat"
            exit 1
        fi
        echo "$last $first $number $address " >> phonebook.dat
        # Sort the phonebook.dat file, first priority is last name, second priority is first name
        sort +0 -1 +1 -2 phonebook.dat -o phonebook.dat
        exit 0
    fi
fi





