use strict;
use warnings;
use lib '/';
use Dancer;
use Home;

#set logger => 'console';
#set log => 'core';
#set appdir => '..';

use Data::Dumper;
print STDERR Dumper(config);

dance;



