use v6;
use Algorithm::InstrumentedSorter;

# Bad design I know, but ...
class Algorithm::InsertionSorter is Algorithm::InstrumentedSorter {

    has @!list = ();
    has $!n = 0;

    method sort (@list) {
        @!list = @list;
        $!n = @!list.elems;
        $.insertion-sort();
        return @!list;
    }

    method insertion-sort () {
        my $j;
        my $t;

        for 1 .. $!n - 1 -> $i {
            $j = $i;
            $t = @!list[$j];

            while $j > 0 && (++$.compares) && @!list[$j - 1] > $t {
                @!list[$j] = @!list[$j - 1];
                $.swaps++;
                $j--;
            }

            @!list[$j] = $t;
            $.copies++;

            #say @!list.perl;
        }
    }

}

# vim: syn=perl6
