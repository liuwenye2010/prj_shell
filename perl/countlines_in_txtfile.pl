#!/usr/bin/perl
# hello.pl example

use 5.18.0;
use warnings;

#!/usr/bin/perl


use 5.18.0;
use warnings;
use IO::File;


# use a scalar variable for the name of the file
my $filename = "input.txt";  

open(FH, $filename);    # open the file
my @lines = <FH>;       # read the file
say @lines;             # print out the content to terminal 
close(FH);              # close the file

my $count = scalar @lines;  # the number of lines in the file
say "There are $count lines in $filename";

main(@ARGV);

# entry point
sub main
{
    my $filename = shift || "input.txt";
    my $count = countlines( $filename );
    say "There are $count lines in $filename";
}

# countlines ( filename ) - count the lines in a file
# returns the number of lines
sub countlines
{
    my $filename = shift;
    error("countlines: missing filename") unless $filename;

    # open the file
    my $fh = IO::File->new( $filename, "r" ) or
        error("Cannot open $filename ($!)\n");
    
    # count the lines
    my $count = 0;
    $count++ while( $fh->getline );
    
    $fh->close;
    
    # return the result
    return $count;    
}

# error ( string ) - display an error message and exit
sub error
{
    my $e = shift || 'unkown error';
    say "$0: $e";
    exit 0;
}
