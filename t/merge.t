#!/usr/bin/env perl6

use v6;
use Test;
use Algorithm::MergeSorter;

my $sorter = Algorithm::MergeSorter.new();

my @list = $sorter.generate-list();
diag("Before: " ~ @list.perl);

my @builtin-sorted = sort @list;
isnt(@list, @builtin-sorted, "Generated list is not already sorted");

my @sorted = $sorter.sort(@list);
diag("After: " ~ @sorted.perl);

@builtin-sorted = sort @list;
is(@sorted, @builtin-sorted, "Merge sort works correctly");

$sorter.print-stats();

done;

# vim: syn=perl6
