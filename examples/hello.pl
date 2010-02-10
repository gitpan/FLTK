
=pod

=for abstract Basic 'Hello, World' script described in
L<FLTK::Basics|FLTK::Basics>

=for license Artistic License 2.0 | Copyright (C) 2009 by Sanko Robinson

=for author Sanko Robinson <sanko@cpan.org> - http://sankorobinson.com/

=for git $Id: hello.pl b32bb0b 2009-10-24 14:51:13Z sanko@cpan.org $

=cut
use strict;
use warnings;
use FLTK qw[:default :style];

#
my $window = FLTK::Window->new(300, 180);
$window->begin();
my $box = FLTK::Widget->new(20, 40, 260, 100, "Hello, World!");
$box->box(UP_BOX);
$box->labelfont(HELVETICA_BOLD_ITALIC);
$box->labelsize(36);
$box->labeltype(SHADOW_LABEL);
$window->end();
$window->show();
exit run();
