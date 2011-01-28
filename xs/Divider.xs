#include "include/FLTK_pm.h"

MODULE = FLTK::Divider               PACKAGE = FLTK::Divider

#ifndef DISABLE_DIVIDER

#include <fltk/Divider.h>

#include "include/WidgetSubclass.h"

void
Divider::new( )
    PPCODE:
        void * RETVAL = NULL;
        RETVAL = (void *) new WidgetSubclass<fltk::Divider>(CLASS);
        if (RETVAL != NULL) {
            ST(0) = sv_newmortal();
            sv_setref_pv(ST(0), CLASS, RETVAL); /* -- hand rolled -- */
            XSRETURN(1);
        }

#endif // ifndef DISABLE_DIVIDER

BOOT:
    isa("FLTK::Divider", "FLTK::Widget");
