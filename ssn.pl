#!/usr/bin/perl -w

use strict;

# Author: Brady Henderson
# Assignment 7: Social Security Numbers List
# Purpose: Reads in a list of social security numbers and names from the diamond operator. where each social security number
#          is followed by a name on the consecutive line. The program then prints out the social security numbers and names in a formatted list.
#          EX: 123-45-6789: John Doe. If the same social security number is found, an error message is printed and the program exits.
#          If a social security number does not have a name, an error message is printed and the program exits.


# Read all input into an array
my @input = <>;
chomp @input;

# Create a hash to store the social security numbers and names
my %ssn_hash;

# Iterate through the input array and store the social security numbers and names in the hash
for (my $i = 0; $i < scalar @input; $i += 2) {
    my $ssn = $input[$i];
    my $name = $input[$i + 1];

    # Check if the social security number already exists in the hash
    if (exists $ssn_hash{$ssn}) {
        print "Error: Duplicate social security number found: $ssn\n";
        exit 1;
    }

    # Check if the name is empty
    if (!defined $name) {
        print "Error: Name is missing for social security number: $ssn\n";
        exit 1;
    }

    chomp $name;

    # Store the social security number and name in the hash
    $ssn_hash{$ssn} = $name;
}

# Print the social security numbers and names in a formatted list
foreach my $ssn (sort keys %ssn_hash) {
    print "$ssn: $ssn_hash{$ssn}\n";
}

exit 0;
