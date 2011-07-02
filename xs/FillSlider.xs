#include "include/FLTK_pm.h"

MODULE = FLTK::FillSlider               PACKAGE = FLTK::FillSlider

#ifndef DISABLE_FILLSLIDER

#include <fltk/FillSlider.h>

#include "include/RectangleSubclass.h"

fltk::FillSlider *
fltk::FillSlider::new( int x, int y, int w, int h, char * label = 0 )
    CODE:
        RETVAL = new RectangleSubclass<fltk::FillSlider>(CLASS,x,y,w,h,label);
    OUTPUT:
        RETVAL

#endif // ifndef DISABLE_FILLSLIDER

BOOT:
    isa("FLTK::FillSlider", "FLTK::Slider");
