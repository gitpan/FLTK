#include "include/FLTK_pm.h"

MODULE = FLTK::HighlightButton               PACKAGE = FLTK::HighlightButton

#ifndef DISABLE_HIGHLIGHTBUTTON

=pod

=for license Artistic License 2.0 | Copyright (C) 2009,2010 by Sanko Robinson

=for author Sanko Robinson <sanko@cpan.org> - http://sankorobinson.com/

=for version 0.532006

=for git $Id: HighlightButton.xs c629eeb 2010-09-27 04:12:30Z sanko@cpan.org $

=head1 NAME

FLTK::HighlightButton - This button highlights even if the default style does not do so

=head1 Description

Same as a normal button but the L<C<box()>|/"box"> defaults to a style that
draws as a flat rectangle until the mouse points at it, then it draws as a
raised highlighted rectangle.

=begin apidoc

=cut

#include <fltk/HighlightButton.h>

=for apidoc ||FLTK::HighlightButton button|new|int x|int y|int w|int h|char * label = ''|

Creates a new C<FLTK::HighlightButton> object. Obviously.

=cut

#include "include/WidgetSubclass.h"

void
HighlightButton::new( int x, int y, int w, int h, char * label = 0 )
    PPCODE:
        void * RETVAL = NULL;
        RETVAL = (void *) new WidgetSubclass<fltk::HighlightButton>(CLASS,x,y,w,h,label);
        if (RETVAL != NULL) {
            ST(0) = sv_newmortal();
            sv_setref_pv(ST(0), CLASS, RETVAL); /* -- hand rolled -- */
            XSRETURN(1);
        }

#endif // ifndef DISABLE_HIGHLIGHTBUTTON

BOOT:
    isa("FLTK::HighlightButton", "FLTK::Button");
