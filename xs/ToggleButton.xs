#include "include/FLTK_pm.h"

MODULE = FLTK::ToggleButton               PACKAGE = FLTK::ToggleButton

#ifndef DISABLE_TOGGLEBUTTON

#include <fltk/ToggleButton.h>

#include "include/WidgetSubclass.h"

void
fltk::ToggleButton::new( int x, int y, int w, int h, const char * label = 0 )
    PPCODE:
        void * RETVAL = NULL;
        RETVAL = (void *) new WidgetSubclass<fltk::ToggleButton>(CLASS,x,y,w,h,label);
        if (RETVAL != NULL) {
            ST(0) = sv_newmortal();
            sv_setref_pv(ST(0), CLASS, RETVAL); /* -- hand rolled -- */
            XSRETURN(1);
        }

#endif // #ifndef DISABLE_TOGGLEBUTTON

BOOT:
    isa("FLTK::ToggleButton", "FLTK::Button");
