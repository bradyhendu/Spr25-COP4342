#!/usr/bin/perl -w

use strict;

# This file illustrates using Perl patterns to detect
# lines that contain scalar variables.  We will print
# the scalars in ascending order with no repetitions.
# Automatic match variables are utilized.

my @scalars;
my $last;

# while reading input into $_.
while (<>) {

   # while there are scalar references in the line
   while ( /\$[A-Za-z_][\w_]*/ && $' !~ /^[\[{]/ ) {

      # store the scalar variable name
      push @scalars, $&;

      # proceed to the rest of the line
      $_ = $'; 
   }
}

# sort the array
@scalars = sort @scalars;

# print the names one per line without repeating a name
$last = "";
foreach (@scalars) {
   if ($_ ne $last) {
      print $_, "\n";
   }
   $last = $_;
}

exit 0;
