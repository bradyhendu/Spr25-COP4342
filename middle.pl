#!/usr/bin/perl -w

use strict;

# Author: Brady Henderson
# Assignment 6: Printing the Middle Lines of the Input
# Purpose: Reads input lines and prints the middle set based on user-defined or default count (10 lines). 
#          The form of the optional argument is -n where n is the number of lines to print.

# Read command line arguments
my $num_lines = 10;
if (@ARGV && $ARGV[0] =~ /^-(\d+)$/) {
    $num_lines = $1;
    shift @ARGV;
}

# Read all input into an array
my @lines = <STDIN>;
my $total_lines = scalar @lines;

# Calculate the start and end of the middle set
my $start = int(($total_lines - $num_lines) / 2);
$start = 0 if $start < 0;

my $end = $start + $num_lines - 1;
$end = $total_lines - 1 if $end >= $total_lines;

# Print the middle set
for (my $i = $start; $i <= $end; $i++) {
    print $lines[$i];
}

exit 0;
