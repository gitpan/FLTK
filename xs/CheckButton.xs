#include "include/FLTK_pm.h"

MODULE = FLTK::CheckButton               PACKAGE = FLTK::CheckButton

#ifndef DISABLE_CHECKBUTTON

#include <fltk/CheckButton.h>

#include "include/RectangleSubclass.h"

fltk::CheckButton *
fltk::CheckButton::new( int x, int y, int w, int h, const char * label = 0 )
    CODE:
        RETVAL = new RectangleSubclass<fltk::CheckButton>(CLASS,x,y,w,h,label);
    OUTPUT:
        RETVAL

fltk::NamedStyle *
fltk::CheckButton::default_style( fltk::NamedStyle * style = NO_INIT )
    CASE: items == 1
        CODE:
            RETVAL = THIS->default_style;
        OUTPUT:
            RETVAL
    CASE: items == 2
        CODE:
            THIS->default_style = style;

#INCLUDE: RadioButton.xsi

#endif // ifndef DISABLE_CHECKBUTTON

BOOT:
    isa("FLTK::CheckButton", "FLTK::Button");
