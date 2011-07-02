#include "include/FLTK_pm.h"

MODULE = FLTK::RepeatButton               PACKAGE = FLTK::RepeatButton

#ifndef DISABLE_REPEATBUTTON

#include <fltk/RepeatButton.h>

#include "include/RectangleSubclass.h"

fltk::RepeatButton *
fltK::RepeatButton::new( int x, int y, int w, int h, const char * label = 0 )
    CODE:
        RETVAL = new RectangleSubclass<fltk::RepeatButton>(CLASS,x,y,w,h,label);
    OUTPUT:
        RETVAL

#endif // #ifndef DISABLE_REPEATBUTTON

BOOT:
    isa("FLTK::RepeatButton", "FLTK::Button");
