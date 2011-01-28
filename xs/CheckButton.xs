#include "include/FLTK_pm.h"

MODULE = FLTK::CheckButton               PACKAGE = FLTK::CheckButton

#ifndef DISABLE_CHECKBUTTON

#include <fltk/CheckButton.h>

#include "include/WidgetSubclass.h"

void
fltk::CheckButton::new( int x, int y, int w, int h, const char * label = 0 )
    PPCODE:
        void * RETVAL = NULL;
        RETVAL = (void *) new WidgetSubclass<fltk::CheckButton>(CLASS,x,y,w,h,label);
        if (RETVAL != NULL) {
            ST(0) = sv_newmortal();
            sv_setref_pv(ST(0), CLASS, RETVAL); /* -- hand rolled -- */
            XSRETURN(1);
        }

fltk::NamedStyle *
fltk::CheckButton::default_style( fltk::NamedStyle * style = NO_INIT )
    CASE: items == 1
        CODE:
            RETVAL = THIS->default_style;
        OUTPUT:
            RETVAL
    CASE: items == 2
        CODE:
            THIS->default_style = style;

#INCLUDE: RadioButton.xsi

#endif // ifndef DISABLE_CHECKBUTTON

BOOT:
    isa("FLTK::CheckButton", "FLTK::Button");
