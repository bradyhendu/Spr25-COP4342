#!/usr/bin/perl

use strict;

# This file illustrates using print versus printf.

# Print some expressions.
print 1/2, " ", 1/3, " ", 71/7, " ", 701/7, "\n";

# Print the same expressions using the formatted print.
printf "%6.3f %6.3f %6.3f %6.3f\n", 1/2, 1/3, 71/7, 701/7;

# Print the same expressions using the formatted print.
printf "%06.3f %06.3f %06.3f %06.3f\n", 1/2, 1/3, 71/7, 701/7;

exit 0
