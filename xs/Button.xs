#include "include/FLTK_pm.h"

MODULE = FLTK::Button               PACKAGE = FLTK::Button

#ifndef DISABLE_BUTTON

#include <fltk/Button.h>

#include "include/RectangleSubclass.h"

fltk::Button *
fltk::Button::new( int x, int y, int w, int h, const char * label = 0 )
    CODE:
        RETVAL = new RectangleSubclass<fltk::Button>(CLASS,x,y,w,h,label);
    OUTPUT:
        RETVAL

int
HIDDEN ( )
    CODE:
        RETVAL = fltk::Button::HIDDEN;
    OUTPUT:
        RETVAL

bool
fltk::Button::value ( bool value = NO_INIT )
    CASE: items == 1
        CODE:
            RETVAL = THIS->value( );
        OUTPUT:
            RETVAL
    CASE:
        CODE:
            THIS->value( value );

fltk::NamedStyle *
fltk::Button::default_style( fltk::NamedStyle * style = NO_INIT )
    CASE: items == 1
        CODE:
            RETVAL = THIS->default_style;
        OUTPUT:
            RETVAL
    CASE: items == 2
        CODE:
            THIS->default_style = style;

#INCLUDE: CheckButton.xsi

#INCLUDE: RepeatButton.xsi

#INCLUDE: ReturnButton.xsi

#endif // ifndef DISABLE_BUTTON

BOOT:
    isa("FLTK::Button", "FLTK::Widget");
