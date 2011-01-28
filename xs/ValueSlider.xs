#include "include/FLTK_pm.h"

MODULE = FLTK::ValueSlider               PACKAGE = FLTK::ValueSlider

#ifndef DISABLE_VALUESLIDER

#ifdef NORMAL // from perl, probably
#define PERL_NORMAL NORMAL
#undef NORMAL
#endif // ifdef NORMAL

#include <fltk/ValueSlider.h>

#ifdef PERL_NORMAL // Undo our workaround
#define NORMAL PERL_NORMAL
#endif // ifdef PERL_NORMAL

#include "include/WidgetSubclass.h"

void
fltk::Scrollbar::new( int x, int y, int w, int h, const char * label = 0 )
    PPCODE:
        void * RETVAL = NULL;
        RETVAL = (void *) new WidgetSubclass<fltk::ValueSlider>(CLASS,x,y,w,h,label);
        if (RETVAL != NULL) {
            ST(0) = sv_newmortal( );
            sv_setref_pv(ST(0), CLASS, RETVAL); /* -- hand rolled -- */
            XSRETURN(1);
        }

#endif // ifndef DISABLE_VALUESLIDER

BOOT:
    isa( "FLTK::ValueSlider", "FLTK::Slider" );
