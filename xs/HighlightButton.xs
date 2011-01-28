#include "include/FLTK_pm.h"

MODULE = FLTK::HighlightButton               PACKAGE = FLTK::HighlightButton

#ifndef DISABLE_HIGHLIGHTBUTTON

#include <fltk/HighlightButton.h>

#include "include/WidgetSubclass.h"

void
HighlightButton::new( int x, int y, int w, int h, char * label = 0 )
    PPCODE:
        void * RETVAL = NULL;
        RETVAL = (void *) new WidgetSubclass<fltk::HighlightButton>(CLASS,x,y,w,h,label);
        if (RETVAL != NULL) {
            ST(0) = sv_newmortal();
            sv_setref_pv(ST(0), CLASS, RETVAL); /* -- hand rolled -- */
            XSRETURN(1);
        }

#endif // ifndef DISABLE_HIGHLIGHTBUTTON

BOOT:
    isa("FLTK::HighlightButton", "FLTK::Button");
