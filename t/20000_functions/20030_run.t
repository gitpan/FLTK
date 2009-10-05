#!perl -Iblib/lib -Iblib/arch

=pod

=for license Artistic License 2.0 | Copyright (C) 2009 by Sanko Robinson

=for author Sanko Robinson <sanko@cpan.org> - http://sankorobinson.com/

=for abstract Tests for xs/run.xsi

=for git $Id: 20030_run.t 3b70f43 2009-10-05 00:42:52Z sanko@cpan.org $

=cut

use strict;
use warnings;
use Test::More 0.82 tests => 2;
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
use_ok('FLTK', qw[:run]);
{
    FLTK::wait(0.1);
    add_timeout(5, sub { pass 'add_timeout called' });
    FLTK::wait(10);
}
