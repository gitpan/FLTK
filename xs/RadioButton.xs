#include "include/FLTK_pm.h"

MODULE = FLTK::RadioButton               PACKAGE = FLTK::RadioButton

#ifndef DISABLE_RADIOBUTTON

#include <fltk/RadioButton.h>

#include "include/RectangleSubclass.h"

fltk::RadioButton *
fltk::RadioButton::new( int x, int y, int w, int h, char * label = 0 )
    CODE:
        RETVAL = new RectangleSubclass<fltk::RadioButton>(CLASS,x,y,w,h,label);
    OUTPUT:
        RETVAL

fltk::NamedStyle *
fltk::RadioButton::default_style( fltk::NamedStyle * style = NO_INIT )
    CASE: items == 1
        CODE:
            RETVAL = THIS->default_style;
        OUTPUT:
            RETVAL
    CASE: items == 2
        CODE:
            THIS->default_style = style;

#endif // ifndef DISABLE_RADIOBUTTON

BOOT:
    isa("FLTK::RadioButton", "FLTK::CheckButton");
