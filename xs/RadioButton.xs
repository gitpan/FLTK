#include "include/FLTK_pm.h"

MODULE = FLTK::RadioButton               PACKAGE = FLTK::RadioButton

#ifndef DISABLE_RADIOBUTTON

#include <fltk/RadioButton.h>

#include "include/WidgetSubclass.h"

void
fltk::RadioButton::new( int x, int y, int w, int h, char * label = 0 )
    PPCODE:
        void * RETVAL = NULL;
        RETVAL = (void *) new WidgetSubclass<fltk::RadioButton>(CLASS,x,y,w,h,label);
        if (RETVAL != NULL) {
            ST(0) = sv_newmortal();
            sv_setref_pv(ST(0), CLASS, RETVAL); /* -- hand rolled -- */
            XSRETURN(1);
        }

fltk::NamedStyle *
fltk::RadioButton::default_style( fltk::NamedStyle * style = NO_INIT )
    CASE: items == 1
        CODE:
            RETVAL = THIS->default_style;
        OUTPUT:
            RETVAL
    CASE: items == 2
        CODE:
            THIS->default_style = style;

#endif // ifndef DISABLE_RADIOBUTTON

BOOT:
    isa("FLTK::RadioButton", "FLTK::CheckButton");
