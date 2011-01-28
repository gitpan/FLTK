#include "include/FLTK_pm.h"

MODULE = FLTK::RepeatButton               PACKAGE = FLTK::RepeatButton

#ifndef DISABLE_REPEATBUTTON

#include <fltk/RepeatButton.h>

#include "include/WidgetSubclass.h"

void
fltK::RepeatButton::new( int x, int y, int w, int h, const char * label = 0 )
    PPCODE:
        void * RETVAL = NULL;
        RETVAL = (void *) new WidgetSubclass<fltk::RepeatButton>(CLASS,x,y,w,h,label);
        if (RETVAL != NULL) {
            ST(0) = sv_newmortal();
            sv_setref_pv(ST(0), CLASS, RETVAL); /* -- hand rolled -- */
            XSRETURN(1);
        }

#endif // #ifndef DISABLE_REPEATBUTTON

BOOT:
    isa("FLTK::RepeatButton", "FLTK::Button");
