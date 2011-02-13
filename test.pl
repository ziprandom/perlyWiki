#!/usr/sbin/perl -w
use tiddlyWiki;
{
  local $/=undef;
  open FILE, "translations.html" or die "Couldn't open file: $!";
  #binmode FILE;
  $string = <FILE>;
  close FILE;
  my $TWAdaptor = new tiddlyWiki();
  $TWAdaptor->parseTiddlyWiki($string);
  $TWAdaptor->dumpTitles();
  $TWAdaptor->writeTiddlyWebFileStore("/home/odo/workbench/");
}

print "hi\n";
