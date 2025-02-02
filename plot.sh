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

# Determine the field number of the specified field name
field_num=$(head -n 1 $1 | tr ' ' '\n' | nl -v 0 | grep -w $2 | awk '{print $1}')

# Extract all the integer values in the specified column into a separate file
cut -d ' ' -f $((field_num + 1)) $1 | tail -n +2 | sed 's/[^0-9]*//g' > temp1.dat
# Sort the integer values in ascending order
sort -n temp1.dat > temp2.dat

# Extract the first and last integer values
min=$(head -n 1 temp2.dat)
max=$(tail -n 1 temp2.dat)

# Transform the file so each row has two fields, first the unique integer value and second the frequency of the value
uniq -c temp2.dat | awk '{print $2, $1}' > temp3.dat

# Find the maximum frequency among the different values in the file
max_freq=$(awk '{print $2}' temp3.dat | sort -n | tail -n 1)

# Copy the /home/faculty/whalley/cop4342exec/plot.p file to your current directory
cp /home/faculty/whalley/cop4342exec/plot.p .

# Modify the plot file by substituting all occurances of LOWX with the smallest value
sed -i "s/LOWX/$min/g" plot.p

# Modify the plot file by substituting all occurances of HIGHX with the largest value
sed -i "s/HIGHX/$max/g" plot.p

# Modify the plot file by substituting all occurances of HIGHY with the maximum frequency
sed -i "s/HIGHY/$max_freq/g" plot.p

# Modify the plot file by substituting all occurances of FILE with the name of the file containing the distinct vlaues
sed -i "s/FILE/temp3.dat/g" plot.p

# Run gnuplot to create a histogram
gnuplot plot.p

# Convert the histogram to a pdf file
ps2pdf graph.ps graph.pdf

# Remove all the temporary files
rm temp1.dat temp2.dat temp3.dat plot.p graph.ps

# Print a message to indicate successful plotting
echo $2 "values in file" $1 "have been plotted successfully."

# Check if the DISPLAY environment variable is set
if [ -n "$DISPLAY" ]; then
    # Open the pdf file if a display is available
    evince graph.pdf &
else
    echo "No display available. Please open graph.pdf manually."
fi

exit 0



