#!/usr/bin/perl -w

use strict;

# This file illustrates the use of control structures, arrays,
# and simple I/O.

my ($i, $j, $num, $sum, $median, @a);

# Read in a list of numbers, store them, and calculate the sum.
$i = 0;
$sum = 0;
while ($num = <STDIN>) {
   chomp($num);
   $sum += $num;
   $a[$i++] = $num;
}
$num = $i;

# Print the sum.
print "The sum of the numbers is: ", $sum, "\n";

# Sort the array.
for ($i = 0; $i < $#a; $i++) {
   for ($j = $i+1; $j <= $#a; $j++) {
      if ($a[$i] > $a[$j]) {
         ($a[$i], $a[$j]) = ($a[$j], $a[$i]);
      }
   }
}

# Print the median.
if ($num > 0) {
   print "The median of the numbers is: ";
   if ($num & 1) {
      print $a[$#a/2];
   }
   else {
      $median = $a[$num/2-1]+$a[$num/2];
      $median = $median / 2;
      print $median;
   }
   print "\n";
}

exit 0;
