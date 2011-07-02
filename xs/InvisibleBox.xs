#include "include/FLTK_pm.h"

MODULE = FLTK::InvisibleBox               PACKAGE = FLTK::InvisibleBox

#ifndef DISABLE_INVISIBLEBOX

#include <fltk/InvisibleBox.h>

#include <fltk/Symbol.h>

#include "include/RectangleSubclass.h"

fltk::InvisibleBox *
fltk::InvisibleBox::new( int x, int y, int w, int h, const char * label = 0, fltk::Box * box )
    CASE: ( items < 6 )
        CODE:
            RETVAL = new RectangleSubclass<fltk::InvisibleBox>(CLASS,x,y,w,h,label);
        OUTPUT:
            RETVAL
    CASE:
        CODE:
            RETVAL = new RectangleSubclass<fltk::InvisibleBox>(CLASS,box,x,y,w,h,label);
        OUTPUT:
            RETVAL

#endif // ifndef DISABLE_INVISIBLEBOX

BOOT:
    isa("FLTK::InvisibleBox", "FLTK::Widget");
