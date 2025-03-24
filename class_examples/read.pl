#!/usr/bin/perl

use strict;

# This file illustrates reading a line into a string.

my $line;

print "Enter text:\n";
$line = <STDIN>;
print "The text you entered was: ", $line;

exit 0;
