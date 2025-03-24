#!/usr/bin/perl -w

use strict;

# This program mimics the cp Unix command.

my $line;

# Open up the first file for input.
if (!open IN, "<$ARGV[0]") {
   die "Could not open ", $ARGV[0], " for input.";
}

# Open up the second file for output.
if (!open OUT, ">$ARGV[1]") {
   die "Could not open ", $ARGV[1], " for output.";
}

# Copies the lines from the input file to the output file.
while ($line = <IN>) {
   print OUT $line;
}

# Close the files.
close IN;
close OUT;

exit 0;
