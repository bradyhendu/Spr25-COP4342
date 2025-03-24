#!/usr/bin/perl -w

use strict;

my ($i, $word, @words, @counts);

# This file illustrates using the foreach statement.

# Initialize the counts array.
for ($i=0; $i < 11; $i++) {
   $counts[$i] = 0;
}

# Read in words, one per line.
while ($word=<STDIN>) {
   chomp($word);
   push @words, $word;
}

# Increment counts of the lengths, where >= 10 is only in the 10th element.
foreach $word (@words) {
   if (length $word < 10) {
      $counts[length $word]++;
   }
   else {
      $counts[10]++;
   }
}

# Print the counts.
for ($i=0; $i < 11; $i++) {
   print "counts[$i]=", $counts[$i], "\n";
}

exit 0;
