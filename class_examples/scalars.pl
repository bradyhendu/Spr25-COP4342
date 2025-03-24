#!/usr/bin/perl -w

use strict;

# This file illustrates using Perl patterns to detect
# lines that contain scalar variables.

# while reading input into $_.
while (<>) {

   # if a scalar reference in the line, then print it.   
   if (/\$[A-Za-z_]/) {
      print;
   }
}

exit 0;
