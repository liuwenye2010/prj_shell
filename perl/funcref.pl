#!/usr/bin/perl
# funcref.pl example

use 5.18.0;
use warnings;

my $ref = \&func;
&{$ref}();

sub func {
    say "This is the excellent function.";
}
