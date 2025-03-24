#!/usr/bin/perl -w

use strict;

# This file illustrates using push and pop.

my @a;
my $v;

# Read in values and push them onto an array.
while ($v = <STDIN>) {
   chomp($v);
   push @a, $v;
}

# Print the array values.
print "(@a)\n";

# Print the values in reverse order.
while ($v = pop @a) {
   print $v, "\n";
}

exit 0;
