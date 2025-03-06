#!/usr/bin/perl -w

use strict;

# Author: Brady Henderson
#Assignment 5: Printing the Head of the Input with Line Numbers
# Purpose: This program reads in a file and prints the first 10 lines of the file with line numbers.

my $line_number = 1;
my $max_lines = 10;

# Read in the file
while (my $line = <STDIN>) {
    #remove newline character
    chomp $line;
    # Print the line number and the line
    print "$line_number: $line \n";
    $line_number++;
    # If we have printed the max number of lines, exit the loop
    if ($line_number > $max_lines) {
        last;
    }
}

exit 0;
