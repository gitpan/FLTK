#include "include/FLTK_pm.h"

MODULE = FLTK::CycleButton               PACKAGE = FLTK::CycleButton

#ifndef DISABLE_CYCLEBUTTON

#include <fltk/CycleButton.h>

#include "include/WidgetSubclass.h"

void
fltk::CycleButton::new( int x, int y, int w, int h, char * label = 0 )
    PPCODE:
        void * RETVAL = NULL;
        RETVAL = (void *) new WidgetSubclass<fltk::CycleButton>(CLASS,x,y,w,h,label);
        if (RETVAL != NULL) {
            ST(0) = sv_newmortal( );
            sv_setref_pv(ST(0), CLASS, RETVAL); /* -- hand rolled -- */
            XSRETURN(1);
        }

#endif // ifndef DISABLE_CYCLEBUTTON

BOOT:
    isa("FLTK::CycleButton", "FLTK::Menu");
