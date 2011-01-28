#include "include/FLTK_pm.h"

MODULE = FLTK::ReturnButton               PACKAGE = FLTK::ReturnButton

#ifndef DISABLE_RETURNBUTTON

#include <fltk/ReturnButton.h>

#include "include/WidgetSubclass.h"

void
fltK::ReturnButton::new( int x, int y, int w, int h, const char * label = 0 )
    PPCODE:
        void * RETVAL = NULL;
        RETVAL = (void *) new WidgetSubclass<fltk::ReturnButton>(CLASS,x,y,w,h,label);
        if (RETVAL != NULL) {
            ST(0) = sv_newmortal();
            sv_setref_pv(ST(0), CLASS, RETVAL); /* -- hand rolled -- */
            XSRETURN(1);
        }

fltk::NamedStyle *
fltk::ReturnButton::default_style( fltk::NamedStyle * style = NO_INIT )
    CASE: items == 1
        CODE:
            RETVAL = THIS->default_style;
        OUTPUT:
            RETVAL
    CASE: items == 2
        CODE:
            THIS->default_style = style;

#endif // #ifndef DISABLE_RETURNBUTTON

BOOT:
    isa("FLTK::ReturnButton", "FLTK::Button");
