#include "include/FLTK_pm.h"

MODULE = FLTK::FileInput               PACKAGE = FLTK::FileInput

#ifndef DISABLE_FILEINPUT

#ifdef NORMAL // from perl, probably
#define PERL_NORMAL NORMAL
#undef NORMAL
#endif // ifdef NORMAL

#include <fltk/FileInput.h>

#ifdef PERL_NORMAL // Undo our workaround
#define NORMAL PERL_NORMAL
#endif // ifdef PERL_NORMAL

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

void
fltk::FileInput::draw_boxes( bool pressed, fltk::Rectangle * rect )
    C_ARGS: pressed, * rect

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
