#!/usr/sbin/perl -w
use tiddler;
my $tid = new tiddler;
$tid->set("title","hallo, das ist der title");
my $title = $tid->get("title");
print $title." yes yes yes\n";
