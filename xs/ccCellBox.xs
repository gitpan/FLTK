#include "include/FLTK_pm.h"

MODULE = FLTK::ccCellBox               PACKAGE = FLTK::ccCellBox

#ifndef DISABLE_CCCELLBOX

#include <fltk/ColorChooser.h>

#include "include/RectangleSubclass.h"

fltk::ccCellBox *
fltk::ccCellBox::new( int x, int y, int w, int h )
    CODE:
        RETVAL = new RectangleSubclass<fltk::ccCellBox>(CLASS,x,y,w,h);
    OUTPUT:
        RETVAL

#endif // #ifndef DISABLE_CCCELLBOX

BOOT:
    isa("FLTK::ccCellBox", "FLTK::Widget");
