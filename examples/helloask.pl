
=pod

=for abstract Based on helloask.cxx (example2a)

=for license Artistic License 2.0 | Copyright (C) 2009,2010 by Sanko Robinson

=for author Sanko Robinson <sanko@cpan.org> - http://sankorobinson.com/

=for git $Id: helloask.pl 7e88e03 2010-09-17 21:30:36Z sanko@cpan.org $

=cut

use strict;
use warnings;
use FLTK qw[:default :style];

#
my $window = FLTK::Window->new(300, 180);
$window->begin();
$window->callback(sub { shift->hide() if ask('Do you really want to exit?') }
);
my $box = FLTK::Widget->new(20, 40, 260, 100, "Hello, World!");
$box->box(UP_BOX);
$box->labelfont(HELVETICA_BOLD_ITALIC);
$box->labelsize(36);
$box->labeltype(SHADOW_LABEL);
$window->end();
$window->show();
exit run();
