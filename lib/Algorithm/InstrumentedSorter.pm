use v6;
use Algorithm::Sorter;

class Algorithm::InstrumentedSorter is Algorithm::Sorter {
    has Int $.swaps    is rw = 0;
    has Int $.compares is rw = 0;
    has Int $.copies   is rw = 0;

    method print-stats () {
        say "Performed ", $.compares, " compares";
        say "Performed ", $.swaps, " swaps";
        say "Performed ", $.copies, " copies";
    }

    method reset-stats () {
        $.compares = 0;
        $.swaps = 0;
        $.copies = 0;
    }

}

# vim: syn=perl6
