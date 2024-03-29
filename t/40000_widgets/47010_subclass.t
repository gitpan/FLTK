#!perl -Iblib/lib -Iblib/arch

=pod

=for license Artistic License 2.0 | Copyright (C) 2009,2010 by Sanko Robinson

=for author Sanko Robinson <sanko@cpan.org> - http://sankorobinson.com/

=for abstract Tests for (Subclassed Widgets)

=for git $Id: 47010_subclass.t 67e5c43 2011-07-04 13:30:00Z sanko@cpan.org $

=cut

use strict;
use warnings;
use Test::More 0.82;
use Module::Build qw[];
use Time::HiRes qw[];
use Test::NeedsDisplay ':skip_all';
plan tests => 6;
my $test_builder = Test::More->builder;
BEGIN { chdir '../..' if not -d '_build'; }
use lib 'inc', 'blib/lib', 'blib/arch', 'lib';
my $build           = Module::Build->current;
my $release_testing = $build->notes('release_testing');
my $verbose         = $build->notes('verbose');
my $interactive     = $build->notes('interactive');

#
use FLTK qw[:events];

#
{

    package FLTKx::TestButton;
    use parent-norequire, 'FLTK::Button';

    sub handle {
        my ($obj, $event) = @_;
        ::pass('FLTKx::TestButton->handle(SHOW) called on Widget creation')
            if $event == ::SHOW();
        ::pass('FLTKx::TestButton->handle(HIDE) called on Widget creation')
            if $event == ::HIDE();
        return 1 if $event == ::SHOW();
        return 0;
    }
}
{

    package my::Test::HiddenButton;
    use parent-norequire, 'FLTK::Button';
    sub draw {
        ::BAIL_OUT(
            "We should never be in a position to call my::Test::HiddenButton->draw([...])"
        );
        }

    sub handle {
        my ($obj, $event) = @_;
        ::BAIL_OUT(
            "We should never be in a position to call my::Test::HiddenButton->handle($event)"
        );
        return 0;
    }
}

#
my $W = new FLTK::Window(200, 100);
$W || BAIL_OUT('Failed to create window');

#
my $W0 = new_ok('my::Test::HiddenButton' => [100, 0, 100, 100],
                'new my::Test::HiddenButton ( 100, 0, 100, 100 )');
isa_ok($W0, 'FLTK::Button');
$W->begin();    # Inside of the group should be seen
my $W1 = new_ok('FLTKx::TestButton' => [0, 0, 100, 100],
                'new FLTKx::TestButton ( 0, 0, 100, 100 )');
isa_ok($W1, 'FLTK::Button');
$W->end();
$W->show();     # if $interactive;
FLTK::wait(1);
$W->hide();
$W1->destroy();
$W0->destroy();
