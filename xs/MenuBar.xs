#include "include/FLTK_pm.h"

MODULE = FLTK::MenuBar               PACKAGE = FLTK::MenuBar

#ifndef DISABLE_MENUBAR

#include <fltk/MenuBar.h>

#include "include/RectangleSubclass.h"

fltk::MenuBar *
fltk::MenuBar::new( int x, int y, int w, int h, char * label = 0 )
    CODE:
        RETVAL = new RectangleSubclass<fltk::MenuBar>(CLASS,x,y,w,h,label);
    OUTPUT:
        RETVAL

fltk::NamedStyle *
fltk::MenuBar::default_style( fltk::NamedStyle * style = NO_INIT )
    CASE: items == 1
        CODE:
            RETVAL = THIS->default_style;
        OUTPUT:
            RETVAL
    CASE: items == 2
        CODE:
            THIS->default_style = style;

#endif // ifndef DISABLE_MENUBAR

BOOT:
    isa("FLTK::MenuBar", "FLTK::Menu");
