use v6;
use Algorithm::InstrumentedSorter;

class Algorithm::MergeSorter is Algorithm::InstrumentedSorter {

    # Overrides the super class
    has $!buffer-size = 200;

    method read-buffer-from-input (IO $input) {

        $!buffer-pos = 0;

        while my $record = $input.get() {
            @!buffer[$!buffer-pos] = $record;
            $!buffer-pos++;
            last if $!buffer-pos >= $!buffer-size;
        }

    }

    method sort (IO $input) {
        while $.read-buffer-from-input($input) {
            ...
        }
    }

}

# vim: syn=perl6
