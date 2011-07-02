#include "include/FLTK_pm.h"

MODULE = FLTK::CycleButton               PACKAGE = FLTK::CycleButton

#ifndef DISABLE_CYCLEBUTTON

#include <fltk/CycleButton.h>

#include "include/RectangleSubclass.h"

fltk::CycleButton *
fltk::CycleButton::new( int x, int y, int w, int h, char * label = 0 )
    CODE:
        RETVAL = new RectangleSubclass<fltk::CycleButton>(CLASS,x,y,w,h,label);
    OUTPUT:
        RETVAL

#endif // ifndef DISABLE_CYCLEBUTTON

BOOT:
    isa("FLTK::CycleButton", "FLTK::Menu");
