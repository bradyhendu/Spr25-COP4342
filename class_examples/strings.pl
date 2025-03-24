#!/usr/bin/perl -w

use strict;

# This file illustrates printing strings in Perl.

print "hello\n";

# Need to have strings surrounded by " ".
my $v = hello;

print "1: ", $v, "\n";

print "2: ", 'hello\n';
print "\n";
print "3: ", "hello\n";
print "4: ", '$v\n';
print "\n";
print "5: ", "$v\n";

# Perl variable names are case sensitive.
print "$V\n";
print 'ab', '', "\n";

# Need to surround $v with { }.
print "$v_there\n";

print 9 x 5, "\n";
print "45" - 1 . 7, "\n";

exit 0;
