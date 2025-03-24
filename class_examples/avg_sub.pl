#!/usr/bin/perl -w

use strict;

# This file illustrates using a subroutine to calculate
# the average in a list of values.

sub avg {

   my $sum;
   my $val;

   $sum = 0;
   foreach $val (@_) {
      $sum += $val;
   }
   return $sum / ($#_+1);
}

my $line;
my @a;

# print the avg of the numbers on each line read
while ($line = <>) {
   chomp($line);
   @a = split / /, $line;
   print "The average of (@a) is ", &avg(@a), "\n";
}

exit 0;
