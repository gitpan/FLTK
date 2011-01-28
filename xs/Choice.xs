#include "include/FLTK_pm.h"

MODULE = FLTK::Choice               PACKAGE = FLTK::Choice

#ifndef DISABLE_CHOICE

#include <fltk/Choice.h>

#include "include/WidgetSubclass.h"

void
fltk::Choice::new( int x, int y, int w, int h, char * label = 0 )
    PPCODE:
        void * RETVAL = NULL;
        RETVAL = (void *) new WidgetSubclass<fltk::Choice>(CLASS,x,y,w,h,label);
        if (RETVAL != NULL) {
            ST(0) = sv_newmortal();
            sv_setref_pv(ST(0), CLASS, RETVAL); /* -- hand rolled -- */
            XSRETURN(1);
        }

fltk::NamedStyle *
fltk::Choice::default_style( fltk::NamedStyle * style = NO_INIT )
    CASE: items == 1
        CODE:
            RETVAL = THIS->default_style;
        OUTPUT:
            RETVAL
    CASE: items == 2
        CODE:
            THIS->default_style = style;

#endif // ifndef DISABLE_CHOICE

BOOT:
    isa("FLTK::Choice", "FLTK::Menu");
