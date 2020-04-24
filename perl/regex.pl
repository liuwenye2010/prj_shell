#!/usr/bin/perl

use 5.18.0;
use warnings;

say "Hello, World!";
my $s = "This is a line of text";

if ( $s =~ /line/ ) {
    say 'True';
} else {
    say 'False';
}


my $s = "This is a line of text";

$s =~ s/line/string/;
say $s;


my $s = "value: another,yet another: one more here";

say foreach split(/[:,]\s*/, $s);


my $s = "This is a line of text";

my @a = split(/\s+/, $s);
say foreach @a;


my $s = "This is a line of text";

if ( $s =~ /(text)/ ) {
    say "Match is: $1";
} else {
    say 'False';
}
