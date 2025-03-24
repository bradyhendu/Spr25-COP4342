#!/usr/bin/perl -w

use strict;

# This file illustrates using the chomp operator.

my ($s1, $s2);

print "Enter two lines of text:\n";
$s1 = <STDIN>;
$s2 = <STDIN>;
print "Below are the two lines of text:\n";
print $s1, $s2;
print "Below are the same two lines of text after calling chomping them:\n";
chomp $s1;
chomp $s2;
print $s1, $s2;
print "exiting now\n";

exit 0;
