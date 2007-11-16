package Chart::OFC::AxisLabel;

use strict;
use warnings;

use MooseX::StrictConstructor;
use Chart::OFC::Types;

with 'Chart::OFC::Role::OFCDataLines';

has label =>
    ( is       => 'ro',
      isa      => 'Str',
      required => 1,
    );

has text_color =>
    ( is      => 'ro',
      isa     => 'Color',
      coerce  => 1,
      default => '#000000',
    );

has text_size =>
    ( is      => 'ro',
      isa     => 'Size',
      default => 20,
    );

no Moose;
__PACKAGE__->meta()->make_immutable();


sub _ofc_data_lines
{
    my $self = shift;
    my $name = shift;

    return $self->_data_line( $name . '_legend', $self->label(), $self->text_size(), $self->text_color() );
}


1;


__END__

=pod

=head1 NAME

Chart::OFC::AxisLabel - A label for an axis

=head1 SYNOPSIS

  my $label = Chart::OFC::AxisLabel->new( label      => 'Some Text',
                                          text_color => 'blue',
                                          text_size  => 15,
                                        );

=head1 DESCRIPTION

This class represents a label for a whole axis, as opposed to the
labels for the ticks on that axis.

=head1 ATTRIBUTES

This class has a number of attributes which may be passed to the
C<new()> method.

=head2 label

The text for the label.

This attribute is required.

=head2 text_color

The default color of tick labels.

Defaults to "#000000" (black).

=head2 text_size

The size of tick labels for the axis, in pixels.

Defaults to 20.

=head1 ROLES

This class does the C<Chart::OFC::Role::OFCDataLines> role.

=head1 COPYRIGHT & LICENSE

Copyright 2007 Dave Rolsky, All Rights Reserved.

This program is free software; you can redistribute it and/or modify
it under the same terms as Perl itself.

=cut
