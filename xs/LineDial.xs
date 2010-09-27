#include "include/FLTK_pm.h"

MODULE = FLTK::LineDial               PACKAGE = FLTK::LineDial

#ifndef DISABLE_LINEDIAL

=pod

=for license Artistic License 2.0 | Copyright (C) 2009,2010 by Sanko Robinson

=for author Sanko Robinson <sanko@cpan.org> - http://sankorobinson.com/

=for version 0.532006

=for git $Id: LineDial.xs c629eeb 2010-09-27 04:12:30Z sanko@cpan.org $

=head1 NAME

FLTK::LineDial - Dial subclass

=head1 Description

L<Dial|FLTK::Dial> but the constructor sets L<C<type()>|FLTK::Dial/"type"> to
C<LINE>, so it draws a pointer rather than a dot.

=begin apidoc

=cut

#ifdef NORMAL // from perl, probably
#define PERL_NORMAL NORMAL
#undef NORMAL
#endif // ifdef NORMAL

#include <fltk/LineDial.h>

#ifdef PERL_NORMAL // Undo our workaround
#define NORMAL PERL_NORMAL
#endif // ifdef PERL_NORMAL

=for apidoc ||FLTK::LineDial * dial|new|int x|int y|int w|int h|char * label = ''|

Creates a new C<FLTK::LineDial> object. Obviously.

=cut

#include "include/WidgetSubclass.h"

void
fltk::LineDial::new( int x, int y, int w, int h, const char * label = 0 )
    PPCODE:
        void * RETVAL = NULL;
        RETVAL = (void *) new WidgetSubclass<fltk::LineDial>(CLASS,x,y,w,h,label);
        if (RETVAL != NULL) {
            ST(0) = sv_newmortal();
            sv_setref_pv(ST(0), CLASS, RETVAL); /* -- hand rolled -- */
            XSRETURN(1);
        }

#endif // #ifndef DISABLE_LINEDIAL

BOOT:
    isa("FLTK::LineDial", "FLTK::Dial");
