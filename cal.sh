#!/bin/sh

# Author: Brady Henderson
# Assignment 2: Create a Nicer Interface to the Cal Unix Utility
# Purpose: This script provides a nicer interface to the cal Unix utility by allowing the user to
#          to use zero, one, or two arguments. If no arguments are provided, the current month's
#          and year obtained from the date command are displayed. If only a year is provided, print the
#          entire year's calendar. If both a month and year are provided, print the calendar for that month.


# Check if the user has passed more than two arguments
if [ $# -gt 2 ]
then
    echo "Error: Inappropriate use of cal, too many arguments. Usage: cal [[month] year]"
    exit 1
fi

# If no arguments are provided, display the current month and year as obtained by the date command
if [ $# -eq 0 ]
then
    current_month=$`date +"%m"`
    current_year=$`date +"%Y"`
    cal $current_month $current_year
    exit 0
fi

