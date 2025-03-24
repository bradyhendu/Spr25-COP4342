#!/usr/bin/perl -w

use strict;

# This file illustrates use of the <> operator.

my $line;

# mimics the cat Unix utility
while ($line=<>) {
   print $line;
}

exit 0;
