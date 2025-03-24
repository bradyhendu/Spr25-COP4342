#!/usr/bin/perl -w

use strict;

# This file illustrates use of using substitution in Perl.

my $line;

# Make gender substitutions on each line.
while ($line = <>) {
   $line =~ s/\bhe\b/#1/g;
   $line =~ s/\bher\b/#2/g;
   $line =~ s/\bshe\b/#3/g;
   $line =~ s/\bhis\b/#4/g;
   $line =~ s/#1/she/g;
   $line =~ s/#2/his/g;
   $line =~ s/#3/he/g;
   $line =~ s/#4/her/g;
   print $line;
}

exit 0;
