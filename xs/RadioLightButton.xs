#include "include/FLTK_pm.h"

MODULE = FLTK::RadioLightButton               PACKAGE = FLTK::RadioLightButton

#ifndef DISABLE_RADIOLIGHTBUTTON

#include <fltk/RadioLightButton.h>

#include "include/WidgetSubclass.h"

void
fltK::RadioLightButton::new( int x, int y, int w, int h, const char * label = 0 )
    PPCODE:
        void * RETVAL = NULL;
        RETVAL = (void *) new WidgetSubclass<fltk::RadioLightButton>(CLASS,x,y,w,h,label);
        if (RETVAL != NULL) {
            ST(0) = sv_newmortal();
            sv_setref_pv(ST(0), CLASS, RETVAL); /* -- hand rolled -- */
            XSRETURN(1);
        }

#endif // #ifndef DISABLE_RADIOLIGHTBUTTON

BOOT:
    isa("FLTK::RadioLightButton", "FLTK::LightButton");
