#!perl -Iblib/lib -Iblib/arch

=pod

=for license Artistic License 2.0 | Copyright (C) 2009,2010 by Sanko Robinson

=for author Sanko Robinson <sanko@cpan.org> - http://sankorobinson.com/

=for abstract Tests for functions found in xs/Version.xsi and lib/FLTK/Version.pm

=for TODO ...create lib/FLTK/Version.pm

=for git $Id: 21000_Version.t 6858aff 2011-01-29 05:17:25Z sanko@cpan.org $

=cut

use strict;
use warnings;
use Test::More 0.82;
use Module::Build qw[];
use Time::HiRes qw[];
use Test::NeedsDisplay ':skip_all';
plan tests => 7;
my $test_builder = Test::More->builder;
BEGIN { chdir '../..' if not -d '_build'; }
use lib 'inc', 'blib/lib', 'blib/arch', 'lib';
my $build           = Module::Build->current;
my $release_testing = $build->notes('release_testing');
my $verbose         = $build->notes('verbose');
my $interactive     = $build->notes('interactive');

#
use FLTK qw[:version];

# Imported with version tag
for my $sub (qw[FL_MAJOR_VERSION FL_MINOR_VERSION FL_PATCH_VERSION
             FL_VERSION version])
{   can_ok(__PACKAGE__, $sub);
}
is(FL_MAJOR_VERSION(), 2, 'This was build with the experimental FLTK libs');
is(FL_VERSION(), version(), 'FL_VERSION and version() match');
