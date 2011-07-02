#include "include/FLTK_pm.h"

MODULE = FLTK::ReturnButton               PACKAGE = FLTK::ReturnButton

#ifndef DISABLE_RETURNBUTTON

#include <fltk/ReturnButton.h>

#include "include/RectangleSubclass.h"

fltk::ReturnButton *
fltK::ReturnButton::new( int x, int y, int w, int h, const char * label = 0 )
    CODE:
        RETVAL = new RectangleSubclass<fltk::ReturnButton>(CLASS,x,y,w,h,label);
    OUTPUT:
        RETVAL

fltk::NamedStyle *
fltk::ReturnButton::default_style( fltk::NamedStyle * style = NO_INIT )
    CASE: items == 1
        CODE:
            RETVAL = THIS->default_style;
        OUTPUT:
            RETVAL
    CASE: items == 2
        CODE:
            THIS->default_style = style;

#endif // #ifndef DISABLE_RETURNBUTTON

BOOT:
    isa("FLTK::ReturnButton", "FLTK::Button");
