#!perl -Iblib/lib -Iblib/arch

=pod

=for license Artistic License 2.0 | Copyright (C) 2009,2010 by Sanko Robinson

=for author Sanko Robinson <sanko@cpan.org> - http://sankorobinson.com/

=for abstract Tests for xs/FloatInput.xsi

=for git $Id: 40018_floatinput.t 6858aff 2011-01-29 05:17:25Z sanko@cpan.org $

=cut

use strict;
use warnings;
use Test::More 0.82;
use Module::Build qw[];
use Time::HiRes qw[];
use Test::NeedsDisplay ':skip_all';
plan tests => 3;
my $test_builder = Test::More->builder;
BEGIN { chdir '../..' if not -d '_build'; }
use lib 'inc', 'blib/lib', 'blib/arch', 'lib';
my $build           = Module::Build->current;
my $release_testing = $build->notes('release_testing');
my $verbose         = $build->notes('verbose');
my $interactive     = $build->notes('interactive');

#
use FLTK;

# type() ...uh, types
for my $sub (qw[FLOAT INT]) { can_ok('FLTK::FloatInput', $sub); }

#
my $W = new FLTK::Window(200, 100);
$W || BAIL_OUT('Failed to create window');
$W->begin();
my $FI = new_ok('FLTK::FloatInput' => [0, 0, 100, 100],
                'new FLTK::FloatInput( 0, 0, 100, 100 )');
$W->end();
$W->show() if $interactive;
note 'TODO: ...everything';

#
#is($FI->value(), 0, 'value() is 1.2345678901234567890123456789012345678901');
