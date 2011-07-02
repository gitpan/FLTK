#include "include/FLTK_pm.h"

MODULE = FLTK::LightButton               PACKAGE = FLTK::LightButton

#ifndef DISABLE_LIGHTBUTTON

#include <fltk/LightButton.h>

#include "include/RectangleSubclass.h"

fltk::LightButton *
fltk::LightButton::new( int x, int y, int w, int h, const char * label = 0 )
    CODE:
        RETVAL = new RectangleSubclass<fltk::LightButton>(CLASS,x,y,w,h,label);
    OUTPUT:
        RETVAL

fltk::NamedStyle *
fltk::LightButton::default_style( fltk::NamedStyle * new_style = NO_INIT )
    CASE: items == 1
        CODE:
            RETVAL = THIS->default_style;
        OUTPUT:
            RETVAL
    CASE: items == 2
        CODE:
            THIS->default_style = new_style;

#INCLUDE: RadioLightButton.xsi

#endif // #ifndef DISABLE_LIGHTBUTTON

BOOT:
    isa("FLTK::LightButton", "FLTK::CheckButton");
