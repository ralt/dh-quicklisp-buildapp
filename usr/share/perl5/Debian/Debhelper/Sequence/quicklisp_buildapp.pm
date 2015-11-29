#!/usr/bin/perl

use warnings;
use strict;
use Debian::Debhelper::Dh_Lib;

init();

# strip messes the buildapp binaries
remove_command("dh_strip");

insert_before("dh_auto_clean", "dh_quicklisp_buildapp_clean");
insert_before("dh_auto_build", "dh_quicklisp_buildapp_build");
insert_before("dh_auto_install", "dh_quicklisp_buildapp_install");

1;
