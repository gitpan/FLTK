#include "include/FLTK_pm.h"

MODULE = FLTK::FileInput               PACKAGE = FLTK::FileInput

#ifndef DISABLE_FILEINPUT

=pod

=for license Artistic License 2.0 | Copyright (C) 2009,2010 by Sanko Robinson

=for author Sanko Robinson <sanko@cpan.org> - http://sankorobinson.com/

=for version 0.532006

=for git $Id: FileInput.xs c629eeb 2010-09-27 04:12:30Z sanko@cpan.org $

=head1 NAME

FLTK::FileInput - Subclass of FLTK::Browser

=head1 Description



=begin apidoc

=cut

#ifdef NORMAL // from perl, probably
#define PERL_NORMAL NORMAL
#undef NORMAL
#endif // ifdef NORMAL

#include <fltk/FileInput.h>

#ifdef PERL_NORMAL // Undo our workaround
#define NORMAL PERL_NORMAL
#endif // ifdef PERL_NORMAL

=for apidoc d||FLTK::FileInput fi|new|int x|int y|int w|int h|char * label = ''|

Creates a new C<FLTK::FileInput> object.

=cut

#include "include/WidgetSubclass.h"

void
fltk::FileInput::new( int x, int y, int w, int h, const char * label = 0 )
    PPCODE:
        void * RETVAL = NULL;
        RETVAL = (void *) new WidgetSubclass<fltk::FileInput>(CLASS,x,y,w,h,label);
        if (RETVAL != NULL) {
            ST(0) = sv_newmortal();
            sv_setref_pv(ST(0), CLASS, RETVAL); /* -- hand rolled -- */
            XSRETURN(1);
        }

=for apidoc |||draw_boxes|bool pressed|FLTK::Rectangle * rect|

Draw directory buttons.

=cut

void
fltk::FileInput::draw_boxes( bool pressed, fltk::Rectangle * rect )
    C_ARGS: pressed, * rect

=for apidoc ||FLTK::Color color|errorcolor||



=for apidoc |||errorcolor|FLTK::Color color|



=cut

fltk::Color
fltk::FileInput::errorcolor( fltk::Color color )
    CASE: items == 1
        CODE:
            RETVAL = THIS->errorcolor( );
        OUTPUT:
            RETVAL
    CASE: items == 2
        CODE:
            THIS->errorcolor( color );

=for apidoc ||char * string|text||

=for apidoc |||text|char * string|int length = strlen(string)|

Set the string stored in the widget.

=cut

const char *
fltk::FileInput::text( char * string = NO_INIT, int length = strlen( string ) )
    CASE: items == 1
        CODE:
            RETVAL = THIS->text( );
        OUTPUT:
            RETVAL
    CASE:
        C_ARGS: string, length
        CODE:
            RETVAL = (char *) THIS->text(string, length);
        OUTPUT:
            RETVAL

#endif // ifndef DISABLE_FILEINPUT

BOOT:
    isa("FLTK::FileInput", "FLTK::Input");
