#!/usr/bin/perl -w

use strict;

# This file illustrates use of the split operator by calculating
# the average age of men and women that are input.

my ($sum_men, $num_men, $sum_women, $num_women, $line);
my @fields;

# Sums the ages of the men and women and count the number of men and women.
$num_men = 0;
$num_women = 0;
$sum_men = 0;
$sum_women = 0;
while ($line = <STDIN>) {
   @fields = split / /, $line;
   if ($fields[1] eq "M") {
      $num_men += 1;
      $sum_men += $fields[2];
   }
   elsif ($fields[1] eq "F") {
      $num_women += 1;
      $sum_women += $fields[2];
   }
   else {
      print "Illegal gender:", $fields[1], "\n";
      exit 1;
   }
}

# Print the averages.
print "The average age of the men is: ", $sum_men/$num_men, "\n";
print "The average age of the women is: ", $sum_women/$num_women, "\n";

exit 0;
