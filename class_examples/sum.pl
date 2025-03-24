#!/usr/bin/perl -w

use strict;

# This file illustrates use of the last operator.

my ($i, $num, $sum);

# Sums the first 5 numbers read or entire input if less.
$i = 1;
$sum = 0;
while ($num = <STDIN>) {
   chomp($num);
   $sum += $num;
   if ($i++ == 5) {
      last;
   }
}

# Print the sum.
print "The sum of the numbers is: ", $sum, "\n";

exit 0;
