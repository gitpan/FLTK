#include "include/FLTK_pm.h"

MODULE = FLTK::InvisibleBox               PACKAGE = FLTK::InvisibleBox

#ifndef DISABLE_INVISIBLEBOX

#include <fltk/InvisibleBox.h>

#include "include/WidgetSubclass.h"

void
fltk::InvisibleBox::new( int x, int y, int w, int h, const char * label = 0, fltk::Box * box )
    PPCODE:
        void * RETVAL = NULL;
        if ( items < 6 )
            RETVAL = (void *) new WidgetSubclass<fltk::InvisibleBox>(CLASS,x,y,w,h,label);
        else
            RETVAL = (void *) new WidgetSubclass<fltk::InvisibleBox>(CLASS,box,x,y,w,h,label);
        if (RETVAL != NULL) {
            ST(0) = sv_newmortal();
            sv_setref_pv(ST(0), CLASS, RETVAL); /* -- hand rolled -- */
            XSRETURN(1);
        }

#endif // ifndef DISABLE_INVISIBLEBOX

BOOT:
    isa("FLTK::InvisibleBox", "FLTK::Widget");
