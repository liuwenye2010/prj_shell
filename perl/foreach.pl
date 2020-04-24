#!/usr/bin/perl
# foreach.pl example

use 5.18.0;
use warnings;

my @array = qw( one two three four five );

foreach my $s ( @array ) {
    say $s;
}
