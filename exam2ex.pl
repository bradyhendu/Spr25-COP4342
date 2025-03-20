#!/usr/bin/perl -w

use strict;

#Class examples from the lecture, may be important for the exam

my @vals;
my $line;
#Read in a list of values from a single line
$line = <STDIN>;
@vals = split /\s+/, $line;

#Extract the values that are positive
@vals = grep {$_ > 0} @vals;

#Print the values on a single line
print "@vals\n";

#End Grep example

#Begin Map Example
my @vals;
my $line;

#Read in a list of values from a single line
$line = <STDIN>;
@vals = split /\s+/, $line;

# Print the squares of each value in the array, also can use $_**2
@vals = map {$_ * $_} @vals;

#Print the values on a single line
print "@vals\n";

#End Map Example

# Exam Details: 10 Questions, 82% (How is that possible) is problem solving, 40% of problem solving is writing perl code (What) 
# Recommendations: Review the assignments, look in cop4342examples folder in /home/faculty/whalley/cop4342examples
# Office Hours: 5PM - 6PM on Monday



