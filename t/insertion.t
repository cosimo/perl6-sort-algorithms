#!/usr/bin/env perl6

use v6;
use Test;
use Algorithm::InsertionSorter;

my $sorter = Algorithm::InsertionSorter.new();

my @list = $sorter.generate-list(max => 100, length => 20);
is(@list.elems, 20, "Generated a list for sorting");
diag("Before: " ~ @list.perl);

my @sorted = sort @list;
isnt(@list, @sorted, "List is not generated already sorted");

@list = $sorter.sort(@list);
diag("After:  " ~ @list.perl);

@sorted = sort @list;
is(@list, @sorted, "List was sorted correctly by insertion sort");

$sorter.print-stats();

done;

# vim: syn=perl6
