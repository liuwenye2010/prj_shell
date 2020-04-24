#!/usr/bin/perl
# iofile.pl example

use 5.18.0;
use warnings;
use IO::File;

my $filename = 'lines.txt';

my $file = IO::File->new("< $filename") or die "Cannot open file: $!";
print while <$file>;
$file->close();
