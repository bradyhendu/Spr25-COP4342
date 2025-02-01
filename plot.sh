#!/bin/sh

# Author: Brady Henderson
# Assignment 4: Create a Plot Utility
# Purpose: This script allows a user to plot integer values in a bar chart as a histogram.
#          The way to run the script is as follows `plot.sh <filename> <fieldname>`. The filename
#          is the name of a file that contains the data to be plotted, with the first line being the name for 
#          the field. The fieldname is the name of the field in the file that contains the data to be plotted.
#          This script will help me learn the use of head, tail, wc, cut, sed, gnuplot, ps2pdf, and evince unix utilities.


# Check if the user has passed more than two arguments
if [ $# -ne 2 ]
then
    echo "Error: Inappropriate use of plot.sh. Usage: plot.sh <filename> <fieldname>"
    exit 1
fi

# Check if the file exists
if [ ! -f $1 ]
then
    echo "Error: File $1 does not exist."
    exit 1
fi

# Check if the fieldname exists in the file
if ! head -n 1 $1 | grep -q $2
then
    echo "Error: Fieldname $2 does not exist in file $1."
    exit 1
fi

# Extract all the integer values in the specified column into a seperate file
cut -d ' ' -f $2 $1 | tail -n +2 | sed 's/[^0-9]*//g' > temp1.dat

# Sort the integer values in ascending order
sort -n temp1.dat > temp2.dat



