#include "include/FLTK_pm.h"

MODULE = FLTK::ccHueBox               PACKAGE = FLTK::ccHueBox

#ifndef DISABLE_CCHUEBOX

#include <fltk/ColorChooser.h>

#include "include/RectangleSubclass.h"

fltk::ccHueBox *
fltk::ccHueBox::new( int x, int y, int w, int h )
    CODE:
        RETVAL = new RectangleSubclass<fltk::ccHueBox>(CLASS,x,y,w,h);
    OUTPUT:
        RETVAL

#endif // #ifndef DISABLE_CCHUEBOX

BOOT:
    isa("FLTK::ccHueBox", "FLTK::Widget");
