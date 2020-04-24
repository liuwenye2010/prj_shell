#!/usr/bin/perl
# fileop.pl example

use 5.18.0;
use warnings;

my $filename = 'testfile.txt';

if(-e $filename) {
    say 'file test returned true';    
} elsif($!) {
    say $!; 
} else {
    say 'file test returned false';
}
