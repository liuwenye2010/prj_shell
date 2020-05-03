#!/bin/bash
# Processing options & parameters with getopts
#
echo
while getopts :ab:cd opt
do
case "$opt" in
	a) echo "Found the -a option" ;;
	b) echo "Found the -b option, with value $OPTARG" ;;
	c) echo "Found the -c option" ;;
	d) echo "Found the -d option" ;;
	*) echo "Unknown option: $opt" ;;
esac
done
#
shift $[ $OPTIND - 1 ]
#
echo
count=1
for param in "$@"
do
	echo "Parameter $count: $param"
	count=$[ $count + 1 ]
done
#
# Standardizing Options
# When you create your shell script, obviously you’re in control of what happens. It’s
# completely up to you as to which letter options you select to use and how you select to
# use them.
# However, a few letter options have achieved a somewhat standard meaning in the
# Linux world. If you leverage these options in your shell script, your scripts will be more
# user-friendly.
# Table 14-1 shows some of the common meanings for command line options used in Linux.
# TABLE 14-1 Common Linux Command Line Options
# Option Description
# -a Shows all objects
# -c Produces a count
# -d Specifi es a directory
# -e Expands an object
# -f Specifi es a fi le to read data from
# -h Displays a help message for the command
# -i Ignores text case
# -l Produces a long format version of the output
# -n Uses a non-interactive (batch) mode
# -o Specifi es an output fi le to redirect all output to
# -q Runs in quiet mode
# -r Processes directories and fi les recursively
# -s Runs in silent mode
# -v Produces verbose output
# -x Excludes an object
# -y Answers yes to all questions
# You’ll probably recognize most of these option meanings just from working with the various
# bash commands throughout the book. Using the same meaning for your options helps users
# interact with your script without having to worry about manuals.