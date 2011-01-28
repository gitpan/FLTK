#include "include/FLTK_pm.h"

MODULE = FLTK::ValueOutput               PACKAGE = FLTK::ValueOutput

#ifndef DISABLE_VALUEOUTPUT

#include <fltk/ValueOutput.h>

void
fltk::ValueOutput::new( int x, int y, int w, int h, char * label = 0 )
    PPCODE:
        void * RETVAL = NULL;
        RETVAL = (void *) new WidgetSubclass<fltk::ValueOutput>(CLASS,x,y,w,h,label);
        if (RETVAL != NULL) {
            ST(0) = sv_newmortal();
            sv_setref_pv(ST(0), CLASS, RETVAL); /* -- hand rolled -- */
            XSRETURN(1);
        }

#endif // ifndef DISABLE_VALUEOUTPUT

BOOT:
    isa( "FLTK::ValueOutput" , "FLTK::Output");
