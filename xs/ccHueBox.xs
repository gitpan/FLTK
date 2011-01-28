#include "include/FLTK_pm.h"

MODULE = FLTK::ccHueBox               PACKAGE = FLTK::ccHueBox

#ifndef DISABLE_CCHUEBOX

#include <fltk/ColorChooser.h>

#include "include/WidgetSubclass.h"

void
fltk::ccHueBox::new( int x, int y, int w, int h )
    PPCODE:
        void * RETVAL = NULL;
        RETVAL = (void *) new WidgetSubclass<fltk::ccHueBox>(CLASS,x,y,w,h);
        if (RETVAL != NULL) {
            ST(0) = sv_newmortal();
            sv_setref_pv(ST(0), CLASS, RETVAL); /* -- hand rolled -- */
            XSRETURN(1);
        }

#endif // #ifndef DISABLE_CCHUEBOX

BOOT:
    isa("FLTK::ccHueBox", "FLTK::Widget");
