#!/usr/bin/perl -w

use strict;

# This file illustrates using the delete operator to delete a key value
# pair from a hash.

my @elems;
my %fruit = ( "apple" => 5, "orange" => 3,  "grape" => 17, "pear" => 2 );

@elems = %fruit;
print "@elems\n";

delete $fruit{"orange"};
@elems = %fruit;
print "@elems\n";

delete $fruit{"plum"};
@elems = %fruit;
print "@elems\n";

exit 0
