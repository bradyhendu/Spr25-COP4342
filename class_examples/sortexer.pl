#!/usr/bin/perl

use strict;

# This file illustrates using the <> and sort operators.

my $word;
my @words;

# Read in a set of words, one per line.
while ($word=<>) {
   chomp($word);
   push @words, $word;
}

# Sort the words.
@words = sort @words;

# Print the sorted words.
print "@words\n";

exit 0;
