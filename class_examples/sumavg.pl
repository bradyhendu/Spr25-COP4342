#!/usr/bin/perl -w

use strict;

# This file illustrates use of the <> operator.

my ($i, $num, $sum);

# mimics the cat Unix utility
$i = 0;
$sum = 0;
while ($num=<>) {
   chomp($num);
   $sum += $num;
   $i++;
}

# Print the sum and the average.
print "The sum of the numbers is: ", $sum, "\n";
print "The average of the numbers is: ", $sum/$i, "\n";

exit 0;
