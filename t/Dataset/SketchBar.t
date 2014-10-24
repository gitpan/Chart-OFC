use strict;
use warnings;

use Test::More tests => 3;

use Chart::OFC::Dataset::SketchBar;


{
    my $bar = Chart::OFC::Dataset::SketchBar->new( values => [ 1, 2 ],
                                                 );

    my @data = ( '&bar_sketch=80,3,#999999,#000000&',
                 '&values=1,2&',
               );

    is_deeply( [ $bar->_ofc_data_lines() ], \@data,
               'check _ofc_data_lines output - no label' );
}

{
    my $bar = Chart::OFC::Dataset::SketchBar->new( values    => [ 1, 2 ],
                                                   label     => 'Things',
                                                   text_size => 10,
                                                 );

    my @data = ( '&bar_sketch=80,3,#999999,#000000,Things,10&',
                 '&values=1,2&',
               );

    is_deeply( [ $bar->_ofc_data_lines() ], \@data,
               'check _ofc_data_lines output - labeled' );
}

{
    my $bar = Chart::OFC::Dataset::SketchBar->new( values        => [ 1, 2 ],
                                                   randomness    => 8,
                                                   label         => 'Things',
                                                   fill_color    => 'blue',
                                                   outline_color => 'red',
                                                   text_size     => 26,
                                                   opacity       => 50,
                                                 );

    my @data = ( '&bar_sketch_2=50,8,#0000FF,#FF0000,Things,26&',
                 '&values_2=1,2&',
               );

    is_deeply( [ $bar->_ofc_data_lines(2) ], \@data,
               'check _ofc_data_lines output - all parameters' );
}
