#!/usr/bin/perl

use strict;

# This file illustrates using hashes and the each operator.

my (%fruit, $name, $price);

# Read in the names and prices of fruits until EOF.
while (defined($name=<STDIN>)) {
   chomp($name);
   chomp($price=<STDIN>);
   $fruit{$name}=$price;
}

# Print out the name and price pairs in the hash.
while ( ($name, $price) = each %fruit) {
   print "$name = $price\n";
}

exit 0;
