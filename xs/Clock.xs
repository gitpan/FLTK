#include "include/FLTK_pm.h"

MODULE = FLTK::Clock               PACKAGE = FLTK::Clock

#ifndef DISABLE_CLOCK

#include <fltk/Clock.h>

void
fltk::Clock::new( int x, int y, int w, int h, const char * label = 0 )
    PPCODE:
        void * RETVAL = NULL;
        RETVAL = (void *) new WidgetSubclass<fltk::Clock>(CLASS,x,y,w,h,label);
        if (RETVAL != NULL) {
            ST(0) = sv_newmortal();
            sv_setref_pv(ST(0), CLASS, RETVAL); /* -- hand rolled -- */
            XSRETURN(1);
        }

#endif // ifndef DISABLE_CLOCK

BOOT:
    isa("FLTK::Clock", "FLTK::ClockOutput");
