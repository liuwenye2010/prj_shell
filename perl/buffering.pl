#!/usr/bin/perl

use 5.18.0;
use warnings;

main();

sub main {
    print "What is your guess number? ";
    my $num = <STDIN>;
    my $mine = new_number($num);
    print "\n number is $mine, which is a new number.\n";
}

sub new_number {
    my $num = shift || 6;
    $num = 6 unless $num =~ /^[0-9]+$/;
    return $num + int(rand(10)) + 1;
}


func1('one', 'two', 'three');

sub func1 {
    say 'this is func1';
    say foreach @_;
}


my $filename = 'input.txt';

if (-e $filename ) {
    say 'found input.txt!';
} else {
    say "error: $!"; 
}