#!/usr/bin/perl -w

use strict;

# Author: Brady Henderson
# Assignment 8: Frequency index
# Purpose: Reads in lines using the diamond operator and prints out a frequency index of the words in the input.
#          The frequency index is a list of words and the number of times they appear in the input, sorted by frequency in descending order.
#          The words are case-insensitive and punctuation is removed. The words should be printed in alphabetical order.

# Read all input into an array
my @input = <>;
chomp @input;

# Create a hash to store the frequency of each word
my %word_freq;

# Iterate through the input array and store the frequency of each word in the hash
foreach my $line (@input) {
    # Remove punctuation and convert to lowercase
    $line =~ s/[[:punct:]]//g;
    $line = lc $line;

    # Split the line into words
    my @words = split /\s+/, $line;

    # Count the frequency of each word
    foreach my $word (@words) {
        $word_freq{$word}++;
    }
}

# Group the words by frequency
my %freq_words;
foreach my $word (keys %word_freq) {
    my $freq = $word_freq{$word};
    push @{$freq_words{$freq}}, $word;
}

print "frequency index:\n";
print "----------------\n";

# Print the frequency index in descending order
foreach my $freq (sort {$b <=> $a} keys %freq_words) {
    my @words = sort @{$freq_words{$freq}};
    my $line = sprintf("%2d: ", $freq) . join(", ", @words);

    while(length($line) > 80){
        my $break_pos = rindex($line, ", ", 80);
        $break_pos = 80 if $break_pos == -1;
        print substr($line, 0, $break_pos + 2) . "\n";
        $line = "    ". substr($line, $break_pos + 2);
    }
    print "$line\n";
}