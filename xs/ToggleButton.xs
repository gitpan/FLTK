#include "include/FLTK_pm.h"

MODULE = FLTK::ToggleButton               PACKAGE = FLTK::ToggleButton

#ifndef DISABLE_TOGGLEBUTTON

#include <fltk/ToggleButton.h>

#include "include/RectangleSubclass.h"

fltk::ToggleButton *
fltk::ToggleButton::new( int x, int y, int w, int h, const char * label = 0 )
    CODE:
        RETVAL = new RectangleSubclass<fltk::ToggleButton>(CLASS,x,y,w,h,label);
    OUTPUT:
        RETVAL

#endif // #ifndef DISABLE_TOGGLEBUTTON

BOOT:
    isa("FLTK::ToggleButton", "FLTK::Button");
