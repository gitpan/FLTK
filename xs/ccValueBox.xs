#include "include/FLTK_pm.h"

MODULE = FLTK::ccValueBox               PACKAGE = FLTK::ccValueBox

#ifndef DISABLE_CCVALUEBOX

#include <fltk/ColorChooser.h>

#include "include/RectangleSubclass.h"

fltk::ccValueBox *
fltk::ccValueBox::new( int x, int y, int w, int h )
    CODE:
        RETVAL = new RectangleSubclass<fltk::ccValueBox>(CLASS,x,y,w,h);
    OUTPUT:
        RETVAL

#endif // #ifndef DISABLE_CCVALUEBOX

BOOT:
    isa("FLTK::ccValueBox", "FLTK::Widget");
