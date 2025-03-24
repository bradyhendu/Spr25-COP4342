#!/usr/bin/perl -w

use strict;

# This file illustrates the use of the reverse operator.

my @args;

@args = reverse @ARGV;
print "@args\n";

exit 0;
