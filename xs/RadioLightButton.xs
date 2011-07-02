#include "include/FLTK_pm.h"

MODULE = FLTK::RadioLightButton               PACKAGE = FLTK::RadioLightButton

#ifndef DISABLE_RADIOLIGHTBUTTON

#include <fltk/RadioLightButton.h>

#include "include/RectangleSubclass.h"

fltk::RadioLightButton *
fltK::RadioLightButton::new( int x, int y, int w, int h, const char * label = 0 )
    CODE:
        RETVAL = new RectangleSubclass<fltk::RadioLightButton>(CLASS,x,y,w,h,label);
    OUTPUT:
        RETVAL

#endif // #ifndef DISABLE_RADIOLIGHTBUTTON

BOOT:
    isa("FLTK::RadioLightButton", "FLTK::LightButton");
