#!perl -Iblib/lib -Iblib/arch

=pod

=for license Artistic License 2.0 | Copyright (C) 2009 by Sanko Robinson

=for author Sanko Robinson <sanko@cpan.org> - http://sankorobinson.com/

=for abstract Tests for xs/Color.xsi

=for git $Id: 60001_Color.t 47c21af 2009-10-30 20:48:17Z sanko@cpan.org $

=cut

use strict;
use warnings;
use Test::More tests => 153;
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
use FLTK qw[:color];

# Color types imported with :color tag
for my $sub (
         qw[
         RED      BLUE      CYAN      GREEN      YELLOW      MAGENTA
         DARK_RED DARK_BLUE DARK_CYAN DARK_GREEN DARK_YELLOW DARK_MAGENTA
         GRAY00 GRAY05 GRAY10 GRAY15 GRAY20 GRAY25 GRAY30 GRAY33 GRAY35 GRAY40
         GRAY45 GRAY50 GRAY55 GRAY60 GRAY65 GRAY66 GRAY70 GRAY75 GRAY80 GRAY85
         GRAY90 GRAY95 GRAY99 BLACK WHITE NO_COLOR FREE_COLOR NUM_FREE_COLOR
         WINDOWS_BLUE
         color contrast get_color_index inactive lerp nearest_index parsecolor
         set_background set_color_index ]
    )
{   can_ok(__PACKAGE__, $sub);
}

# "" turns into NO_COLOR
is(color(''), NO_COLOR(), 'color("") == NO_COLOR');
is(color(),   NO_COLOR(), 'color( ) == NO_COLOR');

# "0"-"99" decimal fltk color number, only works for indexed color range
is(color(1),  1,  'color(1) == 1');
is(color(99), 99, 'color(99) == 99');

# "0xnnn" hex value of any fltk color number
is(color('0xAAA'), 2730, 'color("0xAAA") == 2730');

# "rgb" or "#rgb" three hex digits for rgb
is(color('123'), 287453952, 'color("123") == 287453952');
is(color('F00'), -16777216, 'color("F00") == -16777216');

# "rrggbb" or "#rrggbb" 2 hex digits for each of rgb
is(color('112233'),  287453952, 'color("112233") == 287453952');
is(color('#112233'), 287453952, 'color("#112233") == 287453952');

# "rrggbbaa" or "#rrggbbaa" fltk color number in hex
is(color('11223355'),  287454037, 'color("11223355") == 287454037');
is(color('#11223355'), 287454037, 'color("#11223355") == 287454037');

# "rrrgggbbb" or "#rrrgggbbb" 3 hex digits for each of rgb
is(color('111222333'),  287453952, 'color("111222333") == 287453952');
is(color('#111222333'), 287453952, 'color("#111222333") == 287453952');

# "rrrrggggbbbb" or "#rrrrggggbbbb" 4 hex digits for each of rgb
is(color('111122223333'),  287453952, 'color("111122223333") == 287453952');
is(color('#111122223333'), 287453952, 'color("#111122223333") == 287453952');

# 17 "web safe colors" as defined by CSS 2.1
my %web_safe = (maroon  => -2147483648,
                red     => -16777216,
                orange  => -5963776,
                yellow  => -65536,
                olive   => -2139095040,
                purple  => -2147450880,
                fuchsia => -16711936,
                white   => -256,
                lime    => 16711680,
                green   => 8388608,
                navy    => 32768,
                blue    => 65280,
                aqua    => 16776960,
                teal    => 8421376,
                black   => 56,
                silver  => -1061109760,
                gray    => -2139062272
);
for my $color (sort keys %web_safe) {
    is(color($color), $web_safe{$color}, sprintf 'color("%s") == %d',
        $color, $web_safe{$color});
}
my @not_colors = sort 'this', 'that', 'the', 'other', '#testing',
    '22145554564812', '...';

# all other strings return NO_COLOR.
for my $color (@not_colors) {
    is(color($color), NO_COLOR(), sprintf 'color("%s") == NO_COLOR', $color);
}

# First n bytes of name
is(parsecolor('000222', 3), 56, 'parsecolor("000222", 3) == 56');

# "" turns into NO_COLOR
is(parsecolor(''), NO_COLOR(), 'parsecolor("") == NO_COLOR');
is(parsecolor('', 0), NO_COLOR(), 'parsecolor("", 0) == NO_COLOR');

# "0"-"99" decimal fltk color number, only works for indexed color range
is(parsecolor(1),  1,  'parsecolor(1) == 1');
is(parsecolor(99), 99, 'parsecolor(99) == 99');

# "0xnnn" hex value of any fltk color number
is(parsecolor('0xAAA'), 2730, 'parsecolor("0xAAA") == 2730');

# "rgb" or "#rgb" three hex digits for rgb
is(parsecolor('123'), 287453952, 'parsecolor("123") == 287453952');
is(parsecolor('F00'), -16777216, 'parsecolor("F00") == -16777216');

# "rrggbb" or "#rrggbb" 2 hex digits for each of rgb
is(parsecolor('112233'),  287453952, 'parsecolor("112233") == 287453952');
is(parsecolor('#112233'), 287453952, 'parsecolor("#112233") == 287453952');

# "rrggbbaa" or "#rrggbbaa" fltk color number in hex
is(parsecolor('11223355'), 287454037, 'parsecolor("11223355") == 287454037');
is(parsecolor('#11223355'), 287454037,
    'parsecolor("#11223355") == 287454037');

# "rrrgggbbb" or "#rrrgggbbb" 3 hex digits for each of rgb
is(parsecolor('111222333'), 287453952,
    'parsecolor("111222333") == 287453952');
is(parsecolor('#111222333'),
    287453952, 'parsecolor("#111222333") == 287453952');

# "rrrrggggbbbb" or "#rrrrggggbbbb" 4 hex digits for each of rgb
is(parsecolor('111122223333'),
    287453952, 'parsecolor("111122223333") == 287453952');
is(parsecolor('#111122223333'),
    287453952, 'parsecolor("#111122223333") == 287453952');
for my $color (sort keys %web_safe) {
    is(parsecolor($color), $web_safe{$color},
        sprintf 'parsecolor("%s") == %d',
        $color, $web_safe{$color});
}
note 'TODO: If FLTK is compiled to use X11, then XParseColor() is tried';

# all other strings return NO_COLOR.
for my $color (@not_colors) {
    is(parsecolor($color), NO_COLOR(), sprintf 'parsecolor("%s") == NO_COLOR',
        $color);
}

# Color mixer ...one of many.
is(lerp(color(BLACK()), color(WHITE()), 0),
    BLACK(), 'lerp(color(BLACK), color(WHITE), 0) == BLACK');
is(lerp(color(BLACK()), color(WHITE()), 0.25),
    135599360, 'lerp(color(BLACK), color(WHITE), 0.25) == 135599360');
is(lerp(color(BLACK()), color(WHITE()), 0.5),
    287975936, 'lerp(color(BLACK), color(WHITE), 0.5) == 287975936');
is(lerp(color(BLACK()), color(WHITE()), 0.75),
    423575296, 'lerp(color(BLACK), color(WHITE), 0.75) == 423575296');
is(lerp(color(BLACK()), color(WHITE()), 1),
    color(WHITE()), 'lerp(color(BLACK), color(WHITE), 1) == color(WHITE)');
is(lerp(BLACK(), WHITE(), 1), WHITE(), 'lerp(BLACK, WHITE, 1) == WHITE');

# Grays out the color
is(inactive(color(RED()), color(BLUE())),
    -1878510848, 'inactive(color(RED), color(BLUE)) == -1878510848');
is(inactive(color(RED()), color(RED())),
    -16777216, 'inactive(color(RED), color(RED)) == -16777216');
is(inactive(color(RED()) + 1, color(RED()) - 1),
    -544145408, 'inactive(color(RED) + 1, color(RED) - 1) == -544145408');

#
is(contrast(color(BLACK()), color(WHITE())),
    BLACK(), 'contrast(color(RED), color(RED)) == WHITE');
is(contrast(color(RED()), color(RED())),
    BLACK(), 'contrast(color(RED), color(RED)) == BLACK');
is(contrast(color(RED() + 1), color(RED() - 1)),
    RED() + 1,
    'contrast(color(RED + 1), color(RED - 1)) == RED + 1');
is(contrast(color(BLACK()), color(BLACK())),
    WHITE(), 'contrast(color(BLACK), color(BLACK)) == WHITE');

#
is_deeply([split_color(WHITE())],
          [255, 255, 255],
          'split_color(WHITE) ~ [255, 255, 255]');
is_deeply([split_color(BLACK())], [0, 0, 0],
          'split_color(BLACK) ~ [0, 0, 0]');
is_deeply([split_color(RED())], [255, 0, 0],
          'split_color(RED) ~ [255, 0, 0]');

#
is(get_color_index(WHITE()), -256, 'get_color_index(WHITE) == -256');
note 'set_color_index(WHITE, RED)';
set_color_index(WHITE(), RED());
is(get_color_index(WHITE()),
    RED(), 'get_color_index(WHITE) == RED (after set_color_index...)');

#
is(get_color_index(GRAY75()),
    -522133504, 'get_color_index(GRAY75) == -522133504');
note 'set_background( color(WHITE) );';
set_background(color(WHITE()));
is(get_color_index(GRAY75()),
    color(WHITE()),
    'get_color_index(GRAY75) == color(WHITE) (after set_background...)');

#
is(nearest_index(color("#000000")),
    BLACK(), 'nearest_index(color("#000000")) == BLACK');
is(nearest_index(color("#FE0000")),
    RED(), 'nearest_index(color("#FE0000")) == RED');
is(nearest_index(color(GREEN())),
    GREEN(), 'nearest_index(color(GREEN)) == GREEN');
is(nearest_index(YELLOW()), YELLOW(), 'nearest_index(YELLOW) == YELLOW');

#
note 'TODO: color_chooser( ... )';
