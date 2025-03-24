#!/usr/bin/perl -w

use strict;

# This file illustrates the use of the map operator.

my @vals;
my $line;

# Read in a line of numbers and put them into the vals array.
$line = <STDIN>;
@vals = split /\s+/, $line;

# Print the squares of each value in the vals array.
@vals = map { $_**2 } @vals;
print "@vals\n";

exit 0;
