#include "include/FLTK_pm.h"

MODULE = FLTK::FillSlider               PACKAGE = FLTK::FillSlider

#ifndef DISABLE_FILLSLIDER

#include <fltk/FillSlider.h>

#include "include/WidgetSubclass.h"

void
FillSlider::new( int x, int y, int w, int h, char * label = 0 )
    PPCODE:
        void * RETVAL = NULL;
        RETVAL = (void *) new WidgetSubclass<fltk::FillSlider>(CLASS,x,y,w,h,label);
        if (RETVAL != NULL) {
            ST(0) = sv_newmortal();
            sv_setref_pv(ST(0), CLASS, RETVAL); /* -- hand rolled -- */
            XSRETURN(1);
        }

#endif // ifndef DISABLE_FILLSLIDER

BOOT:
    isa("FLTK::FillSlider", "FLTK::Slider");
