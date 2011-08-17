use v6;

class Algorithm::Sorter {

    has @!buffer = ();
    has $!buffer-size = 1000;
    has $!buffer-pos = 0;

    method generate-list ($length is Int = 10, $max is Int = 100) {
        my @list = ();
        my $elem;
        for 1 .. $length {
            $elem = 100 * rand();
            @list.push($elem.Int);
        }
        return @list;
    }

    method generate-file ($filename = "sort.$*PID.tmp", $length is Int = 10000, $max is Int = 32767) {

        my $fh = open($filename, :bin, :w);

        for 1 .. $length {
            my $key = rand() * $max;
            $key = $key.Int;
            $fh.say($key);
        }

        $fh.close();

        return $filename;
    }

}

# vim: syn=perl6
