#include "include/FLTK_pm.h"

MODULE = FLTK::ValueOutput               PACKAGE = FLTK::ValueOutput

#ifndef DISABLE_VALUEOUTPUT

#include <fltk/ValueOutput.h>

fltk::ValueOutput *
fltk::ValueOutput::new( int x, int y, int w, int h, char * label = 0 )
    CODE:
        RETVAL = new RectangleSubclass<fltk::ValueOutput>(CLASS,x,y,w,h,label);
    OUTPUT:
        RETVAL

#endif // ifndef DISABLE_VALUEOUTPUT

BOOT:
    isa( "FLTK::ValueOutput" , "FLTK::Output");
