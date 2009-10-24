#!perl -Iblib/lib -Iblib/arch

=pod

=for license Artistic License 2.0 | Copyright (C) 2009 by Sanko Robinson

=for author Sanko Robinson <sanko@cpan.org> - http://sankorobinson.com/

=for abstract Tests for xs/Image.xsi

=for git $Id: 60006_Image.t 848cb11 2009-10-04 15:26:46Z sanko@cpan.org $

=cut

use strict;
use warnings;
use Test::More tests => 13;
use Module::Build qw[];
use Time::HiRes qw[];
my $test_builder = Test::More->builder;
chdir '../..' if not -d '_build';
use lib 'inc';
my $build           = Module::Build->current;
my $release_testing = $build->notes('release_testing');
my $verbose         = $build->notes('verbose');
my $interactive     = $build->notes('interactive');

#
use_ok('FLTK');

# Set some typical values to use in this next section...
my ($name, $w, $h, $data, $linedelta) = qw[Name 100 150 RANDOMDATA 300];

# Testing new( char * name = 0 )
my $image_a = new_ok('FLTK::Image', [],      'FLTK::Image->new( )');
my $image_b = new_ok('FLTK::Image', [$name], "FLTK::Image->new( '$name' )");

# Testing new( int w, int h, char * name = 0 )
my $image_c = new_ok('FLTK::Image', [$w, $h], "FLTK::Image->new( $w, $h )");
my $image_d = new_ok('FLTK::Image',
                     [$w, $h, $name],
                     "FLTK::Image->new( $w, $h, '$name' )");

# Testing new( FLTK::PixelType, int w, int h, char * name = 0 )
my $image_e = new_ok('FLTK::Image',
                     [$image_a->pixeltype(), $w, $h],
                     "FLTK::Image->new( PixelType, $w, $h )");
my $image_f = new_ok('FLTK::Image',
                     [$image_a->pixeltype(), $w, $h, $name],
                     "FLTK::Image->new( PixelType, $w, $h, '$name' )");

# Testing new(data, FLTK::PixelType, int w, int h)
my $image_g = new_ok('FLTK::Image',
                     [$data, $image_a->pixeltype(), $w, $h],
                     "FLTK::Image->new( '$data', PixelType, $w, $h )");

# Testing new(data, FLTK::PixelType, int w, int h, int linedelta)
my $image_h = new_ok(
                  'FLTK::Image',
                  [$data, $image_a->pixeltype(), $w, $h, $linedelta],
                  "FLTK::Image->new( '$data', PixelType, $w, $h, $linedelta )"
);

#
is($image_c->width(),  100, '$image_c->width( ) == 100');
is($image_c->height(), 150, '$image_c->height( ) == 150');
note '$image_c->setsize( 200, 300 )';
$image_c->setsize(200, 300);
is($image_c->width(),  200, '$image_c->width( ) == 200');
is($image_c->height(), 300, '$image_c->height( ) == 300');

#use Data::Dump qw[dd pp];
#note pp $image_c->linebuffer( 1 );
#note pp $image_c->buffer( );
#
#note $image_a->pixeltype;
#note $image_b->pixeltype;
note 'TODO: Everything';