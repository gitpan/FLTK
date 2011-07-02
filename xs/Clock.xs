#include "include/FLTK_pm.h"

MODULE = FLTK::Clock               PACKAGE = FLTK::Clock

#ifndef DISABLE_CLOCK

#include <fltk/Clock.h>

fltk::Clock *
fltk::Clock::new( int x, int y, int w, int h, const char * label = 0 )
    CODE:
        RETVAL = new RectangleSubclass<fltk::Clock>(CLASS,x,y,w,h,label);
    OUTPUT:
        RETVAL

#endif // ifndef DISABLE_CLOCK

BOOT:
    isa("FLTK::Clock", "FLTK::ClockOutput");
