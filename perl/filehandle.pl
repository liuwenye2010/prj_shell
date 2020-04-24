#!/usr/bin/perl
# filehandle.pl example

use 5.18.0;
use warnings;

my $filename = 'lines.txt';

open(my $fh, '<', $filename) or die "Cannot open file: $!";
print while <$fh>;
close $fh;

