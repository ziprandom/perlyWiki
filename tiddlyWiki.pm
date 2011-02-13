package tiddlyWiki;
use tiddler;

sub new
{
    my $class = shift;
    my $self = {
        @tiddler
    };
    #if (!$self->{tiddlers}) $self->{tiddlers} = null; 
    # Print all the values just for clarification.
    bless $self, $class;
    return $self;
}

sub parseTiddlyWiki {
    my ( $self, $tiddlyWikiRaw ) = @_;
    if ($tiddlyWikiRaw =~ m/<div id="storeArea">(.*)<!--POST-STOREAREA-->/sm) {$tiddlyWikiRaw= $1;} 
    $tiddlyWikiRaw =~ s/<div/XXXXSPLIT_EXPRESSIONXXXX<div/msg;  ## insert Split Expression
    my @tiddlersRaw = split(/XXXXSPLIT_EXPRESSIONXXXX/,$tiddlyWikiRaw); ## SPlit rawTiddlyWiki into rawTiddlers

    foreach my $tiddlerRaw(@tiddlersRaw) {
	my $thisTiddler = new tiddler();
	if ($tiddlerRaw =~ m/<div (.*)>/) {
		my $thisHead = $1;
		$thisHead =~ m/(\w+?=".*?")/; # matches
		my @fields = ($thisHead =~ m/(\w+?=".*?")/g);
		foreach my $field(@fields) {
			if ($field =~ m/^(.*?)="(.*?)"/) {
				$thisTiddler->set($1,$2);
			}
		}
	} 
	if ($tiddlerRaw =~ m/<pre>(.*)<\/pre>/sm) {
		$thisTiddler->set('body',$1);
	}
   	push(@tiddler,$thisTiddler); 
    } 
    

#    print "$tiddlersRaw[30]\n"; 
    print "Parsing ...\n"; 
    return $self->{@tiddlers};
}
sub dumpTitles {
	foreach my $tiddler(@tiddler) {
		print $tiddler->get('created')."\n";
	}
}

sub writeTiddlyWebFileStore {
	my $path = shift;
	system("mkdir $path/bag");
	foreach $tiddler(@tiddler) {
		system("mkdir $path/bag".$tiddler->get('title'));
		
}
}
1;
