#!/usr/bin/perl -w

use strict;

# This file illustrates accessing the ARGV array.

# This line will echo the input with a blank space between each command
# line argument.
print "@ARGV\n";

my $arg;

# This foreach statement will also do the same.
foreach $arg (@ARGV) {
   print $arg, " ";
}
print "\n";

# This foreach statement will also do the same.
foreach (@ARGV) {
   print $_, " ";
}
print "\n";

exit 0;
