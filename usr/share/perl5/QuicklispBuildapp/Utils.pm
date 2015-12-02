use strict;

package QuicklispBuildapp::Utils;

use Debian::Debhelper::Dh_Lib;
use File::Slurp;

sub buildapp {
    my ($packages, $callback) = @_;

    foreach my $package ($packages) {
        my $filename = pkgfile($package, "buildapp");

        if ($filename ne '') {
            foreach my $line (read_file($filename)) {
                my ($binary, $system, $entrypoint) = split(" ", $line);
                $callback->($binary, $system, $entrypoint, $package);
            }
        }
        else {
            $callback->($package, $package, "$name::main");
        }
    }
}

1;
