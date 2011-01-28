#include "include/FLTK_pm.h"

MODULE = FLTK::HelpDialog               PACKAGE = FLTK::HelpDialog

#ifndef DISABLE_HELPDIALOG

#ifdef NORMAL // from perl, probably
#define PERL_NORMAL NORMAL
#undef NORMAL
#endif // ifdef NORMAL

#include <fltk/HelpDialog.h>

#ifdef PERL_NORMAL // Undo our workaround
#define NORMAL PERL_NORMAL
#endif // ifdef PERL_NORMAL

fltk::HelpDialog *
fltk::HelpDialog::new( )

void
fltk::HelpDialog::destroy( )
    CODE:
        delete THIS;
        sv_setsv(ST(0), &PL_sv_undef);

int
fltk::HelpDialog::h( )

int
fltk::HelpDialog::w( )

int
fltk::HelpDialog::x( )

int
fltk::HelpDialog::y( )

void
fltk::HelpDialog::hide( )

void
fltk::HelpDialog::show( )

void
fltk::HelpDialog::load( char * filename )

void
fltk::HelpDialog::position( int x, int y )

void
fltk::HelpDialog::resize( int x, int y, int w, int h )

uchar
fltk::HelpDialog::textsize( uchar size = NO_INIT )
    CASE: items == 1
        C_ARGS:
    CASE:
        CODE:
            THIS->textsize( size );

void
fltk::HelpDialog::topline( line )
    CASE: SvIOK( ST(1) )
        int line
    CASE:
        char * line

const char *
fltk::HelpDialog::value( char * string = NO_INIT )
    CASE: items == 1
        C_ARGS:
    CASE:
        CODE:
            THIS->value( string );

int
fltk::HelpDialog::visible( )

#endif // ifndef DISABLE_HELPDIALOG
