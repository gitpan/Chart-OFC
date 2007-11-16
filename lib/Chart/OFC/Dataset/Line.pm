package Chart::OFC::Dataset::Line;

use strict;
use warnings;

use MooseX::StrictConstructor;
use Chart::OFC::Types;

extends 'Chart::OFC::Dataset';

has width =>
    ( is      => 'ro',
      isa     => 'PosInt',
      default => 2,
    );

has color =>
    ( is      => 'ro',
      isa     => 'Color',
      coerce  => 1,
      default => '#000000',
    );

has label =>
    ( is        => 'ro',
      isa       => 'Str',
      predicate => '_has_label',
    );

has text_size =>
    ( is      => 'ro',
      isa     => 'Size',
      default => 10,
    );


no Moose;
__PACKAGE__->meta()->make_immutable();


sub type
{
    return 'line';
}

sub _ofc_data_lines
{
    my $self  = shift;
    my $count = shift;

    my $name = $self->type();
    $name .= q{_} . $count
        if $count && $count > 1;

    my $val_name = 'values';
    $val_name .= q{_} . $count
        if $count && $count > 1;

    return
        ( $self->_data_line( $name, $self->_line_parameters() ),
          $self->_data_line( $val_name, $self->values() ),
        );
}

sub _line_parameters
{
    my $self = shift;

    my @p = ( $self->width(), $self->color() );
    push @p, ( $self->label(), $self->text_size() )
        if $self->_has_label();

    return @p;
}


1;

__END__

=pod

=head1 NAME

Chart::OFC::Dataset::Line - A dataset represented as a line

=head1 SYNOPSIS

  my $line = Chart::OFC::Dataset::Line->new( values     => \@numbers,
                                             width      => 5,
                                             color      => 'purple',
                                             label      => 'Daily Sales in $',
                                             text_size  => 12,
                                           );

=head1 DESCRIPTION

This class contains values to be charted as a line on a grid chart.

=head1 ATTRIBUTES

This class has several attributes which may be passed to the C<new()>
method.

It is a subclass of C<Chart::OFC::Dataset> and accepts all of that
class's attributes as well as its own.

=head2 width

The width of the line in pixels.

Defaults to 2.

=head2 color

The color of the line, and of the text in the chart key, if a label is
specified.

Defaults to #999999 (medium grey).

=head2 label

If provided, this will be shown as part of the chart key.

This attribute is optional.

=head2 text_size

This is the size of the text in the key.

Defaults to 10 (pixels).

=head1 ROLES

This class does the C<Chart::OFC::Role::OFCDataLines> role.

=head1 COPYRIGHT & LICENSE

Copyright 2007 Dave Rolsky, All Rights Reserved.

This program is free software; you can redistribute it and/or modify
it under the same terms as Perl itself.

=cut