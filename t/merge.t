#!/usr/bin/env perl6

use v6;
use Test;
use Algorithm::MergeSorter;

my $sorter = Algorithm::MergeSorter.new();

my $fname = $sorter.generate-file();
say $fname;

done;

# vim: syn=perl6
