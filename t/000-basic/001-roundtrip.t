#!perl 

use strict;
use warnings;
use utf8;

use Test::More;

BEGIN {
    use_ok('Muesli');
}

use Muesli::Util::Devel qw[ FORMAT_BINARY ];

my $data = { 
    this => { 
        is => [qw[
            a large complex data structure
        ]],
        that => {
            contains => [ 
                'mañy', 
                1_000_000, 
                { 'öf' => 'levelß' },
            ]
        }
    },
    and_lots_of => [ 1 .. 1000 ],
    numbers => undef,
    hello_world_in_jp => '日本語',
    oh_snap_that_worked => [ 'thanks', 2, 'Dāmiæn', 'Grÿskî' ]
};

is_deeply( Muesli::decode( Muesli::encode( $data ) ), $data, '... roundtrippin it' );

done_testing;
