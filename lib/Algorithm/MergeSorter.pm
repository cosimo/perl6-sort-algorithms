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
        $.merge-sort($lo, $mid);
        $.merge-sort($mid + 1, $hi);
        $.merge($lo, $mid, $hi);
    }

    # Efficient variant
    method merge($lo is Int, $mid is Int, $hi is Int) {

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
