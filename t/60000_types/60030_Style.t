#!perl -Iblib/lib -Iblib/arch

=pod

=for license Artistic License 2.0 | Copyright (C) 2009 by Sanko Robinson

=for author Sanko Robinson <sanko@cpan.org> - http://sankorobinson.com/

=for abstract Tests for xs/Style.xsi

=for git $Id: 60030_Style.t 69456c1 2009-09-12 05:33:53Z sanko@cpan.org $

=cut

use strict;
use warnings;
use Test::More tests => 46;
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
use_ok('FLTK', qw[:style]);

# Font types imported with :font tag
for my $sub (qw[ BOLD ITALIC BOLD_ITALIC
             COURIER COURIER_BOLD COURIER_BOLD_ITALIC COURIER_ITALIC
             HELVETICA HELVETICA_BOLD HELVETICA_BOLD_ITALIC HELVETICA_ITALIC
             TIMES TIMES_BOLD TIMES_BOLD_ITALIC TIMES_ITALIC
             BORDER_BOX BORDER_FRAME BOX_UP DIAMOND_DOWN_BOX
             DIAMOND_UP_BOX DOWN_BOX EMBOSSED_BOX ENGRAVED_BOX FLAT_BOX
             HIGHLIGHT_DOWN_BOX HIGHLIGHT_UP_BOX OFLAT_BOX OSHADOW_BOX
             OVAL_BOX PLASTIC_DOWN_BOX PLASTIC_UP_BOX RFLAT_BOX
             ROUNDED_BOX ROUND_DOWN_BOX ROUND_UP_BOX RSHADOW_BOX
             SCREEN_BOLD_FONT SCREEN_FONT SHADOW_BOX SYMBOL_FONT
             THIN_DOWN_BOX THIN_UP_BOX
             ZAPF_DINGBATS font list_fonts]
    )
{   can_ok(__PACKAGE__, $sub);
}