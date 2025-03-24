#!/usr/bin/perl -w

use strict;

# This file illustrates using shift and unshift.

my @a;
my @b;
my $v;

# Read in values and push them onto an array.
while ($v = <STDIN>) {
   chomp($v);
   push @a, $v;
}

# Print the array values.
print "a=(@a)\n";

# Remove the values from the array and shift them to another.
while ($v = shift @a) {
   unshift @b, $v;
}

# Print the array values.
print "b=(@b)\n";

exit 0;
