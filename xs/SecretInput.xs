#include "include/FLTK_pm.h"

MODULE = FLTK::SecretInput               PACKAGE = FLTK::SecretInput

#ifndef DISABLE_SECRETINPUT

=pod

=for license Artistic License 2.0 | Copyright (C) 2009,2010 by Sanko Robinson

=for author Sanko Robinson <sanko@cpan.org> - http://sankorobinson.com/

=for git $Id: SecretInput.xs 0df7f89 2010-09-25 03:28:55Z sanko@cpan.org $

=for version 0.531

=head1 NAME

FLTK::SecretInput - Password field

=head1 Description

One-line text input field that draws asterisks instead of the letters. It also
prevents the user from cutting or copying the text and then pasting it
somewhere.

=begin apidoc

=cut

#ifdef NORMAL // from perl, probably
#define PERL_NORMAL NORMAL
#undef NORMAL
#endif // ifdef NORMAL

#include <fltk/SecretInput.h>

#ifdef PERL_NORMAL // Undo our workaround
#define NORMAL PERL_NORMAL
#endif // ifdef PERL_NORMAL

=for apidoc ||FLTK::SecretInput * self|new|int x|int y|int w|int h|char * label = ''|

Creates a new L<FLTK::SecretInput|FLTK::SecretInput> widget.

=cut

#include "include/WidgetSubclass.h"

void
fltk::Scrollbar::new( int x, int y, int w, int h, const char * label = 0 )
    PPCODE:
        void * RETVAL = NULL;
        RETVAL = (void *) new WidgetSubclass<fltk::SecretInput>(CLASS,x,y,w,h,label);
        if (RETVAL != NULL) {
            ST(0) = sv_newmortal( );
            sv_setref_pv(ST(0), CLASS, RETVAL); /* -- hand rolled -- */
            XSRETURN(1);
        }

#endif // ifndef DISABLE_SECRETINPUT

BOOT:
    isa( "FLTK::SecretInput", "FLTK::Input" );