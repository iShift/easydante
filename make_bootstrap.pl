use strict;
use warnings;

open(IF, '<', 'users.txt');
my $users = '';
while(my $line = <IF>) {
	if ($line =~ /^([^\:]+)\:(.+)$/) {
		my $user = $1;
		my $password = $2;
		$users .= "useradd $user\n";
		$users .= qq/echo "$user:$password" | chpasswd\n/;
	} else {
		die "Bad user format: $line";
	}
}
close(IF);

open(OF, '>', 'bootstrap.sh');
print OF "#!/bin/bash\n\n";
print OF $users;
print OF "\n/usr/sbin/danted\n";
close(OF);
