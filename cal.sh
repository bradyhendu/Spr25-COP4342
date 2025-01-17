#!/bin/sh

# Author: Brady Henderson
# Assignment 2: Create a Nicer Interface to the Cal Unix Utility
# Purpose: This script provides a nicer interface to the cal Unix utility by allowing the user to
#          to use zero, one, or two arguments. If no arguments are provided, the current month's
#          and year obtained from the date command are displayed. If only a year is provided, print the
#          entire year's calendar. If both a month and year are provided, print the calendar for that month.


# Get the current month and year
current_month=`date +%m`
current_year=`date +%Y`

# Check if the user has passed more than two arguments
if [ $# -gt 2 ]
then
    echo "Error: Inappropriate use of cal, too many arguments. Usage: cal [[month] year]"
    exit 1
fi

# If no arguments are provided, display the current month and year as obtained by the date command
if [ $# -eq 0 ]
then
    cal $current_month $current_year
    exit 0
fi

# If there is only one argument we have three cases, if it is a valid month between 1 and 12, 
# a nonumeric argument can specify a mont, like `Jan`, or a year
if [ $# -ge 1 ]
then
    if echo $1 | grep -Eiq '^(jan|feb|mar|apr|may|jun|jul|aug|sep|oct|nov|dec)$'
    then
        #make the argument lowercase
        arg=`echo $1 | tr '[:upper:]' '[:lower:]'`
        case $arg in
            jan) month=1;;
            feb) month=2;;
            mar) month=3;;
            apr) month=4;;
            may) month=5;;
            jun) month=6;;
            jul) month=7;;
            aug) month=8;;
            sep) month=9;;
            oct) month=10;;
            nov) month=11;;
            dec) month=12;;
        esac
        year=$current_year
    elif echo $1 | grep -Eq '^[0-9]+$'
    then
        if [ $1 -ge 1 ] && [ $1 -le 12 ]
        then
            month=$1
            year=$current_year
        else
            year=$1
            cal $year
            exit 0
        fi
    else
        echo "Error: $1 is not a valid month"
        exit 1
    fi

    if [ $# -eq 2 ]
    then
        #check if it is a valid year (negative for BC)
        if echo $2 | grep -Eq '^[0-9]+$'
        then
            if [ $2 -ge 1 ] && [ $2 -le 9999 ]
            then
                year=$2
            else
                echo "Error: $2 is not a valid year"
                exit 1
            fi
        else
            echo "Error: Invalid year '$2'. Please provide a numeric year between 1 and 9999."
            exit 1
        fi
    fi

    cal $month $year
    exit 0
fi

