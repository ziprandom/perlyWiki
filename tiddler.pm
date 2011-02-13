package tiddler;
sub new {
    my $class = shift;
    my $self = {
	'fields' => {} };

    bless $self, $class;
    return $self;
}

sub set {
    my ( $self, $key, $value ) = @_;
    $self->{'fields'}{$key} = $value;
    return $self->{'fields'}{$key};
}

sub get {
        my ( $self, $key ) = @_;
	return $self->{'fields'}{$key};
}

1;
