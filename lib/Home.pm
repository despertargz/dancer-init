use strict;
use warnings;

use Dancer qw(:syntax !pass);

get '/home' => sub {
	my $data = { firstn => 'christopher', lastn => 'mevissen' };
	return template 'greeting', $data;
};

get '/index' => sub {
	my $data = { animal => 'Tiger', color => 'Orange' };
	return template 'jungle', $data;
};

get '/test' => sub {
	return 'testing...123';
};


