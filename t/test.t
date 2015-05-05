use strict;
use warnings;
use lib '..';
use Test::WWW::Mechanize::PSGI;
use Test::More;
use Data::Dumper;
use Dancer qw(!pass);
use Cwd qw(cwd abs_path);
use Home;

my $dir = abs_path(cwd());
print "dir: $dir\n";

set appdir => $dir;
set apphandler => 'PSGI';

#set logger => 'console';
#set log => 'core';

my $app = dance;
print Dumper($app);

my $mech = Test::WWW::Mechanize::PSGI->new( app => $app );


$mech->get_ok('/home');
diag $mech->content;



done_testing();
