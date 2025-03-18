#!/usr/bin/perl -w

use strict;

# Author: Brady Henderson
# Assignment 8: Justify Text
# Purpose: This program reads from standard input the name of the input file,
#          the name of the output file, and the maximum number of columns for each line.
#          The program then opens the files and processes the input file one paragraph at a time.
#          Based on the word ruling, the text is justified to the max columns.

# Read input from standard input
chomp(my $input_file = <STDIN>);
chomp(my $output_file = <STDIN>);
chomp(my $max_width = <STDIN>);

# Open input and output files
open my $in, '<', $input_file or die "Cannot open $input_file: $!";
open my $out, '>', $output_file or die "Cannot open $output_file: $!";

my @paragraph;
while (<$in>) {
    chomp;
    if ($_ eq '') {
        justify_paragraph(\@paragraph, $out, $max_width) if @paragraph;
        @paragraph = (); # Start a new paragraph
    } else {
        push @paragraph, split(/\s+/, $_);
    }
}
justify_paragraph(\@paragraph, $out, $max_width) if @paragraph; # Last paragraph

close $in;
close $out;

sub justify_paragraph {
    my ($words, $out, $max_width) = @_;
    my @line;
    my $line_length = 0;

    foreach my $word (@$words) {
        if ($line_length + length($word) + @line > $max_width) {
            print_justified_line(\@line, $out, $max_width);
            @line = ();
            $line_length = 0;
        }
        push @line, $word;
        $line_length += length($word);
    }

    # Print the last line as-is without adding extra spaces for justification
    print $out join(' ', @line) . "\n" if @line;

    # Print empty line to separate paragraphs in the output
    print $out "\n";
}

sub print_justified_line {
    my ($line, $out, $max_width) = @_;
    # Calculate the total length of words in the line
    my $line_length = length(join('', @$line)); 
    
    # Determine the spaces required to justify the line
    my $spaces_needed = $max_width - $line_length; 
    
    # Calculate the number of gaps between words
    my $gaps = @$line - 1; 

    if ($gaps > 0) {
        # Calculate base spaces per gap
        my $extra_space = int($spaces_needed / $gaps); 
        
        # Determine extra spaces to distribute
        my $remaining_space = $spaces_needed % $gaps; 
        
        for my $i (0 .. $gaps - 1) {
            # Print word
            print $out $line->[$i]; 
            
            # Add spaces, distributing extra spaces as needed
            print $out ' ' x ($extra_space + ($i < $remaining_space ? 1 : 0)); 
        }
        
        # Print the last word
        print $out $line->[-1]; 
    } else {
        # Handle single word case, no extra spaces
        print $out $line->[0] if @$line; 
    }
    
    # End the line
    print $out "\n"; 
}

# Exit the program
exit 0;