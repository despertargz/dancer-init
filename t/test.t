use strict;
use warnings;
use Test::WWW::Mechanize::PSGI;
use Test::More;
use Data::Dumper;
use Dancer qw(!pass);
use Home;

set apphandler => 'PSGI';

my $mech = Test::WWW::Mechanize::PSGI->new( app => dance );

my @hooks = ();
hook 'before_template_render' => sub {
	my $tvars = shift;
	my $hook = shift @hooks;
	$hook->($tvars);
};

push (@hooks, sub {
	diag "Running /home tests...";
	my $tvars = shift;
	ok $tvars->{lastn} eq 'mevissen', 'last name';
	ok $tvars->{firstn} eq 'christopher', 'first name';	
});
$mech->get_ok('/home');


push (@hooks, sub {
	diag "Running /index tests...";
	my $tvars = shift;
	ok $tvars->{color} eq 'Orange', 'color';
	ok $tvars->{animal} eq 'Tiger', 'animal';	
});
$mech->get_ok('/index');

done_testing();
