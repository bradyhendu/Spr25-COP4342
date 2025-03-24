#!/usr/bin/perl -w

use strict;

# This file illustrates the length operator.

my $s1="";
my $s2;
my $s3="abc";
my $s4="abc\n";

print "length of s1 is: ", length $s1, "\n";
print "length of s2 is: ", length $s2, "\n";
print "length of s3 is: ", length $s3, "\n";
print "length of s4 is: ", length $s4, "\n";

exit 0;
