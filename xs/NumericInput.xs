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

#include "include/WidgetSubclass.h"

void
fltk::NumericInput::new( int x, int y, int w, int h, char * label = 0 )
    PPCODE:
        void * RETVAL = NULL;
        RETVAL = (void *) new WidgetSubclass<fltk::NumericInput>(CLASS,x,y,w,h,label);
        if (RETVAL != NULL) {
            ST(0) = sv_newmortal();
            sv_setref_pv(ST(0), CLASS, RETVAL); /* -- hand rolled -- */
            XSRETURN(1);
        }

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
