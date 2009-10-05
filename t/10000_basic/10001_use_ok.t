#!perl -Iblib/lib -Iblib/arch

=pod

=for license Artistic License 2.0 | Copyright (C) 2009 by Sanko Robinson

=for author Sanko Robinson <sanko@cpan.org> - http://sankorobinson.com/

=for abstract As simple as it gets

=for git $Id: 10001_use_ok.t 070a3a8 2009-10-04 14:47:19Z sanko@cpan.org $

=cut

use strict;
use warnings;
use Test::More tests => 1;
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
Test::More::use_ok('FLTK', qw[:all]);
