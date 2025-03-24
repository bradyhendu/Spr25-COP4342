#!/usr/bin/perl -w

use strict;

# This file illustrates use of the tr operator.

my $line;

# Convert (...) to [...] and vice versa.
while ($line = <STDIN>) {
   $line =~ tr/()[]/[]()/;
   print $line;
}

exit 0;
