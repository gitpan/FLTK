
=pod

=for abstract Based on helloask.cxx (example2a)

=for license Artistic License 2.0 | Copyright (C) 2009 by Sanko Robinson

=for author Sanko Robinson <sanko@cpan.org> - http://sankorobinson.com/

=for git $Id: helloask.pl 848cb11 2009-10-04 15:26:46Z sanko@cpan.org $

=cut

use strict;
use warnings;
use FLTK;
sub window_callback { shift->hide() if ask('Do you really want to exit?') }
my $window = new FLTK::Window(300, 180);
$window->callback(\&window_callback);
$window->begin();
my $box = new FLTK::Widget(20, 40, 260, 100, 'Hello, World!');
$box->box(UP_BOX);
$box->labelfont(HELVETICA_BOLD_ITALIC);
$box->labelsize(36);
$box->labeltype(SHADOW_LABEL);
$window->end();
$window->show();
run();
__END__
Copyright (C) 2009 by Sanko Robinson <sanko@cpan.org>

This program is free software; you can redistribute it and/or modify it
under the terms of The Artistic License 2.0.  See the LICENSE file
included with this distribution or
http://www.perlfoundation.org/artistic_license_2_0.  For
clarification, see http://www.perlfoundation.org/artistic_2_0_notes.

When separated from the distribution, all POD documentation is covered by
the Creative Commons Attribution-Share Alike 3.0 License.  See
http://creativecommons.org/licenses/by-sa/3.0/us/legalcode.  For
clarification, see http://creativecommons.org/licenses/by-sa/3.0/us/.

$Id: helloask.pl 848cb11 2009-10-04 15:26:46Z sanko@cpan.org $

