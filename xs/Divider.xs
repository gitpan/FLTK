#include "include/FLTK_pm.h"

MODULE = FLTK::Divider               PACKAGE = FLTK::Divider

#ifndef DISABLE_DIVIDER

#include <fltk/Divider.h>

#include "include/RectangleSubclass.h"

fltk::Divider *
fltk::Divider::new( )
    CODE:
        RETVAL = new RectangleSubclass<fltk::Divider>(CLASS);
    OUTPUT:
        RETVAL

#endif // ifndef DISABLE_DIVIDER

BOOT:
    isa("FLTK::Divider", "FLTK::Widget");
