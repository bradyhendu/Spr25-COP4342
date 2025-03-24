#!/usr/bin/perl -w

use strict;

# This file illustrates some relational operators and printing their values.
# Note that true prints as "1" and false prints as "".

my $a;

print "1 < 2: ", 1 < 2, "\n";
$a = 1 == 2;
print "1 == 2: ", $a, "\n";
$a = "a" eq "b";
print "\"a\" eq \"b\": ", $a, "\n";
print "\"a\" lt \"b\": ", "a" lt "b", "\n";

exit 0;
