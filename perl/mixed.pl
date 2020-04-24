#!/usr/bin/perl
# mixed.pl example

use 5.18.0;
use warnings;

my $musicians = [
    { name => 'Jimi Hendrix', instrument => 'Guitar', genre => 'Rock' },
    { name => 'Miles Davis', instrument => 'Trumpet', genre => 'Jazz' },
    { name => 'Yo-Yo Ma', instrument => 'Cello', genre => 'Classical' },
    { name => 'Frank Zappa', instrument => 'Guitar', genre => 'Fusion' }
];

foreach my $m ( @{$musicians} ) {
    say "$m->{name}: $m->{instrument}, $m->{genre}";
}
