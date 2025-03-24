#!/usr/bin/perl -w 

use strict;

# This file illustrates accessing array elements.

my $a;
my $b;
my @c;
my @d;
my $i;

$a = 5;
$b = 6;
@c = ($a, $b, $a+$b);
print $c[2], "\n";
$a = 7;
$b = 8;
print $c[2], "\n";
@d = ($a, @c, $b);
for ($i=0; $i < 5; $i++) {
   print "d[$i]=", $d[$i], "\n";
}

exit 0;
