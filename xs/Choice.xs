#include "include/FLTK_pm.h"

MODULE = FLTK::Choice               PACKAGE = FLTK::Choice

#ifndef DISABLE_CHOICE

#include <fltk/Choice.h>

#include "include/RectangleSubclass.h"

fltk::Choice *
fltk::Choice::new( int x, int y, int w, int h, char * label = 0 )
    CODE:
        RETVAL = new RectangleSubclass<fltk::Choice>(CLASS,x,y,w,h,label);
    OUTPUT:
        RETVAL

fltk::NamedStyle *
fltk::Choice::default_style( fltk::NamedStyle * style = NO_INIT )
    CASE: items == 1
        CODE:
            RETVAL = THIS->default_style;
        OUTPUT:
            RETVAL
    CASE: items == 2
        CODE:
            THIS->default_style = style;

#endif // ifndef DISABLE_CHOICE

BOOT:
    isa("FLTK::Choice", "FLTK::Menu");
