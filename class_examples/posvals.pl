#!/usr/bin/perl -w

use strict;

# This file illustrates the use of the grep operator.

my @vals;
my $line;

# Read in a list of values from a single line into the array @vals.
$line = <STDIN>;
@vals = split /\s+/, $line;

# Extract the values that are positive.
@vals = grep { $_ > 0 } @vals;

# Print these values on a single line.
print "@vals\n";

exit 0;
