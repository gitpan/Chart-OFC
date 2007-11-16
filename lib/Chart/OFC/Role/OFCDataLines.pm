package Chart::OFC::Role::OFCDataLines;

use strict;
use warnings;

use Moose::Role;

requires '_ofc_data_lines';


sub _data_line ## no critic RequireArgUnpacking
{
    my $self  = shift;
    my $label = shift;
    my @vals  = @_;

    $label =~ s/color/colour/;

    my $line = q{&} . $label . q{=};
    $line .= join ',', @vals;
    $line .= q{&};

    return $line;
}


1;


__END__

=pod

=head1 NAME

Chart::OFC::Role::OFCDataLines - helper for classes which generate OFC data

=head1 SYNOPSIS

  package Chart::OFC;

  use MooseX::StrictConstructor;

  with 'Chart::OFC::Role::OFCDataLines';

=head1 DESCRIPTION

This class provides a common helper method for classes which generate
OFC data (which is most classes in the Chart::OFC distro).

=head1 COPYRIGHT & LICENSE

Copyright 2007 Dave Rolsky, All Rights Reserved.

This program is free software; you can redistribute it and/or modify
it under the same terms as Perl itself.

=cut