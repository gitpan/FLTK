#include "include/FLTK_pm.h"

MODULE = FLTK::ccCellBox               PACKAGE = FLTK::ccCellBox

#ifndef DISABLE_CCCELLBOX

#include <fltk/ColorChooser.h>

#include "include/WidgetSubclass.h"

void
fltk::ccCellBox::new( int x, int y, int w, int h )
    PPCODE:
        void * RETVAL = NULL;
        RETVAL = (void *) new WidgetSubclass<fltk::ccCellBox>(CLASS,x,y,w,h);
        if (RETVAL != NULL) {
            ST(0) = sv_newmortal();
            sv_setref_pv(ST(0), CLASS, RETVAL); /* -- hand rolled -- */
            XSRETURN(1);
        }

#endif // #ifndef DISABLE_CCCELLBOX

BOOT:
    isa("FLTK::ccCellBox", "FLTK::Widget");
