#!/usr/bin/perl

use strict;

# This file illustrates directly using an array name.

my @fruit = qw( apple orange grape pear lemon );
my @fruit2 = @fruit;
my $m = @fruit;
my $n = $m + @fruit;
print "@fruit2\n";
print $m, "\n";
print $n, "\n";

exit 0;
