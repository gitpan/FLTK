#include "include/FLTK_pm.h"

MODULE = FLTK::LightButton               PACKAGE = FLTK::LightButton

#ifndef DISABLE_LIGHTBUTTON

#include <fltk/LightButton.h>

#include "include/WidgetSubclass.h"

void
fltk::LightButton::new( int x, int y, int w, int h, const char * label = 0 )
    PPCODE:
        void * RETVAL = NULL;
        RETVAL = (void *) new WidgetSubclass<fltk::LightButton>(CLASS,x,y,w,h,label);
        if (RETVAL != NULL) {
            ST(0) = sv_newmortal();
            sv_setref_pv(ST(0), CLASS, RETVAL); /* -- hand rolled -- */
            XSRETURN(1);
        }

fltk::NamedStyle *
fltk::LightButton::default_style( fltk::NamedStyle * new_style = NO_INIT )
    CASE: items == 1
        CODE:
            RETVAL = THIS->default_style;
        OUTPUT:
            RETVAL
    CASE: items == 2
        CODE:
            THIS->default_style = new_style;

#INCLUDE: RadioLightButton.xsi

#endif // #ifndef DISABLE_LIGHTBUTTON

BOOT:
    isa("FLTK::LightButton", "FLTK::CheckButton");
