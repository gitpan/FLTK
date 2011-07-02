#include "include/FLTK_pm.h"

MODULE = FLTK::NumericInput               PACKAGE = FLTK::NumericInput

#ifndef DISABLE_NUMERICINPUT

#ifdef NORMAL // from perl, probably
#define PERL_NORMAL NORMAL
#undef NORMAL
#endif // ifdef NORMAL

#include <fltk/NumericInput.h>

#ifdef PERL_NORMAL // Undo our workaround
#define NORMAL PERL_NORMAL
#endif // ifdef PERL_NORMAL

#include "include/RectangleSubclass.h"

fltk::NumericInput *
fltk::NumericInput::new( int x, int y, int w, int h, char * label = 0 )
    CODE:
        RETVAL = new RectangleSubclass<fltk::NumericInput>(CLASS,x,y,w,h,label);
    OUTPUT:
        RETVAL

char *
fltk::NumericInput::value( val = NO_INIT )
    CASE: items == 1
        CODE:
            RETVAL = ( char * ) ( ( fltk::Input * ) THIS )->value( );
        OUTPUT:
            RETVAL
    CASE: ( items == 2 ) && ( SvIOK( ST( 1 ) ) )
        int val
        CODE:
            THIS->value( val );
    CASE: ( items == 2 ) && ( SvNOK( ST( 1 ) ) )
        double val
        CODE:
            THIS->value( val );

#INCLUDE: FloatInput.xsi

#endif // ifndef DISABLE_NUMERICINPUT

BOOT:
    isa("FLTK::NumericInput", "FLTK::Input");
