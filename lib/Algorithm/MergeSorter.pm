#
# Code ported from the Java equivalent here:
# http://www.inf.fh-flensburg.de/lang/algorithmen/sortieren/merge/mergen.htm
#

use v6;
use Algorithm::InstrumentedSorter;

class Algorithm::MergeSorter is Algorithm::InstrumentedSorter {

    has @!a;
    has @!b;
    has $!n;

    method sort(@list) {
        @!a = @list;
        $!n = @!a.elems;
        @!b = ();
        $.merge-sort(0, $!n - 1);
        return @!a;
    }

    method merge-sort ($lo is Int, $hi is Int) {
        return if $lo >= $hi;
        my $mid = $lo / 2 + $hi / 2;
        $mid = $mid.Int;
        say "Start merge-sort (lo=$lo, hi=$hi, mid=$mid)";

        $.merge-sort($lo, $mid);
        say "After merge-sort left ($lo, $mid):  ", @!a.perl;
        $.merge-sort($mid + 1, $hi);
        say "After merge-sort right ($mid+1, $hi): ", @!a.perl;
        $.merge-straightforward($lo, $mid, $hi);
        say "After merge:            ", @!a.perl;
    }

    # Straightforward variant
    method merge-straightforward ($lo is Int, $mid is Int, $hi is Int) {

        # Copy both halves of a to auxiliary array b
        for $lo .. $hi -> $i {
            @!b[$i] = @!a[$i];
            $.copies++;
        }

        # # Or...
        # @!b[$lo .. $hi] = @!a[$lo .. $hi];
        # $.copies += $hi - $lo + 1;

        my $i = my $k = $lo;
        my $j = $mid + 1;

        # Copy back next-greatest element at each time
        while $i <= $mid && $j <= $hi {
            if @!b[$i] <= @!b[$j] {
                @!a[$k++] = @!b[$i++];
            }
            else {
                @!a[$k++] = @!b[$j++];
            }
            $.compares++;
            $.copies++;
        }

        # Copy back remaining elements of first half (if any)
        while $i <= $mid {
            @!a[$k++] = @!b[$i++];
            $.copies++;
        }

    }

    # Efficient variant
    method merge-efficient($lo is Int, $mid is Int, $hi is Int) {

        my Int $i = 0;
        my Int $j = $lo;
        my Int $k = 0;

        # Copy first half of array a to auxiliary array b
        while $j <= $mid {
            @!b[$i++] = @!a[$j++];
            $.copies++;
        }

        $i = 0;
        $k = $lo;

        # Copy back next-greatest element at each time
        while $k < $j && $j <= $hi {
            $.compares++;
            if @!b[$i] <= @!a[$j] {
                $.copies++;
                @!a[$k++] = @!b[$i++];
            }
            else {
                $.copies++;
                @!a[$k++] = @!a[$j++];
            }
        }

        # Copy back remaining elements of first half (if any)
        while $k < $j {
            $.copies++;
            @!a[$k++] = @!b[$i++];
        }

    }

}

# vim: syn=perl6
