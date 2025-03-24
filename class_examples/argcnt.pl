#!/usr/bin/perl -w

use strict;

# This file illustrates use of the last operator.

my $i;

# This foreach statement will count the number of command line args.
$i = 0;
foreach (@ARGV) {
   $i++;
}
print "The number of arguments is $i.\n";

# This print statement will also do the same.
$i = $#ARGV + 1;
print "The number of arguments is $i.\n";

exit 0;
