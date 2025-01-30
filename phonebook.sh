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
        #Assure that number fits the form ###-###-####
        if ! echo $number | grep -Eq '^[0-9]{3}-[0-9]{3}-[0-9]{4}$'
        then
            echo "Error: Phone number must be in the form ###-###-####"
            exit 1
        fi
        echo "$last $first $number $address " >> phonebook.dat
        # Sort the phonebook.dat file, first priority is last name, second priority is first name
        sort +0 -1 +1 -2 phonebook.dat -o phonebook.dat
        exit 0
    fi
fi

# If the user has chosen to delete a record, ensure that there is enough information to do so <last> <first>
if [ "$1" = "-d" ] && [ $# -lt 3 ]
then
    echo "Error: Inappropriate use of phonebook.sh, not enough arguments for -d. Usage: phonebook.sh -d <last> <first>"
    exit 1
else
    # If the user has chosen to delete a record, delete the record from phonebook.dat
    if [ "$1" = "-d" ]
    then
        shift 1
        last=$1
        shift 1
        first=$1
        # If the record does not exist in phonebook.dat, print an error and exit
        if ! grep -q "$last $first" phonebook.dat
        then
            echo "Error: Record '$last $first' does not exist in phonebook.dat"
            exit 1
        fi
        # Create a temporary file to store the records that are not to be deleted
        touch phonebook.dat.tmp
        # Copy all records that are not to be deleted to the temporary file
        grep -v "$last $first" phonebook.dat > phonebook.dat.tmp
        # Copy the temporary file back to phonebook.dat
        cp phonebook.dat.tmp phonebook.dat
        # Remove the temporary file
        rm phonebook.dat.tmp
        exit 0
    fi
fi

#If a user wants to modify a record, ensure that there is enough information to do so <last> <first> <address>
if [ "$1" = "-m" ] && [ $# -lt 4 ]
then
    echo "Error: Inappropriate use of phonebook.sh, not enough arguments for -m. Usage: phonebook.sh -m <last> <first> <address>"
    exit 1
else
    # If the user has chosen to modify a record, modify the record in phonebook.dat
    if [ "$1" = "-m" ]
    then
        shift 1
        last=$1
        shift 1
        first=$1
        shift 1
        address="$*"
        # If the record does not exist in phonebook.dat, print an error and exit
        if ! grep -q "$last $first" phonebook.dat
        then
            echo "Error: Record '$last $first' does not exist in phonebook.dat"
            exit 1
        fi
        # Create a temporary file to store the records that are not to be modified
        touch phonebook.dat.tmp
        # Copy all records that are not to be modified to the temporary file
        grep -v "$last $first" phonebook.dat > phonebook.dat.tmp
        # Append the modified record to the temporary file
        echo "$last $first `grep "$last $first" phonebook.dat | awk '{print $3}'` $address" >> phonebook.dat.tmp
        # Copy the temporary file back to phonebook.dat
        cp phonebook.dat.tmp phonebook.dat
        # Remove the temporary file
        rm phonebook.dat.tmp
        # Sort the phonebook.dat file, first priority is last name, second priority is first name
        sort +0 -1 +1 -2 phonebook.dat -o phonebook.dat
        exit 0
    fi
fi

# If the user has chosen to print records, ensure that there is enough information to do so <pattern>
if [ "$1" = "-p" ] && [ $# -lt 2 ]
then
    echo "Error: Inappropriate use of phonebook.sh, not enough arguments for -p. Usage: phonebook.sh -p <pattern>"
    exit 1
else
    # If the user has chosen to print records, print the records that match the pattern
    if [ "$1" = "-p" ]
    then
        shift 1
        pattern=$1
        # If no records match the pattern, print an error and exit
        if ! grep -q "$pattern" phonebook.dat
        then
            echo "Error: No records match the pattern '$pattern'"
            exit 1
        fi
        # Print the records that match the pattern
        grep "$pattern" phonebook.dat
        exit 0
    fi
fi







