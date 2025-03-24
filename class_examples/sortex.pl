#!/usr/bin/perl

use strict;

# This file illustrates the sort operator.

my @fruit = qw( apple orange grape pear lemon );
print "fruit: @fruit\n\n";
my @sortedfruit = sort @fruit;
print "sortedfruit: @sortedfruit\n\n";
print "sortedfruit one per line:\n";
foreach my $f (sort @fruit) {
   print $f, "\n";
}

exit 0
