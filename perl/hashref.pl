#!/usr/bin/perl
# hashref.pl example

use 5.18.0;
use warnings;

my %hash = (
    one => 'uno',
    two => 'dos',
    three => 'tres',
    four => 'quatro',
    five => 'cinco'
);

my $ref = \%hash;
foreach my $k ( sort keys %{$ref}) {
    say "$k : ${$ref}{$k}";
}
