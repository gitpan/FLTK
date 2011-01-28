#include "include/FLTK_pm.h"

MODULE = FLTK::ccValueBox               PACKAGE = FLTK::ccValueBox

#ifndef DISABLE_CCVALUEBOX

#include <fltk/ColorChooser.h>

#include "include/WidgetSubclass.h"

void
fltk::ccValueBox::new( int x, int y, int w, int h )
    PPCODE:
        void * RETVAL = NULL;
        RETVAL = (void *) new WidgetSubclass<fltk::ccValueBox>(CLASS,x,y,w,h);
        if (RETVAL != NULL) {
            ST(0) = sv_newmortal();
            sv_setref_pv(ST(0), CLASS, RETVAL); /* -- hand rolled -- */
            XSRETURN(1);
        }

#endif // #ifndef DISABLE_CCVALUEBOX

BOOT:
    isa("FLTK::ccValueBox", "FLTK::Widget");
