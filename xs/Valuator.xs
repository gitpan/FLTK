#include "include/FLTK_pm.h"

MODULE = FLTK::Valuator               PACKAGE = FLTK::Valuator

#ifndef DISABLE_VALUATOR

#include <fltk/Valuator.h>

#include "include/RectangleSubclass.h"

fltk::Valuator *
fltk::Valuator::new( int x, int y, int w, int h, const char * label = 0 )
    CODE:
        RETVAL = new RectangleSubclass<fltk::Valuator>(CLASS,x,y,w,h,label);
    OUTPUT:
        RETVAL

double
fltk::Valuator::value( double v = NO_INIT )
    CASE: items == 1
        CODE:
            RETVAL = THIS->value( );
        OUTPUT:
            RETVAL
    CASE:
        CODE:
            RETVAL = THIS->value ( v ); // !boobs
        OUTPUT:
            RETVAL

void
fltk::Valuator::set_value( double value )
    CODE:
        switch( ix ) {
            case 0: THIS->set_value(value);   break;
            case 1: THIS->maximum(value);     break;
            case 2: THIS->minimum(value);     break;
            case 3: THIS->step(value);        break;
        }
    ALIAS:
            maximum = 1
            minimum = 2
               step = 3

void
fltk::Valuator::range( double min, double max )

double
fltk::Valuator::linesize( double value = NO_INIT )
    CASE: items == 1
        CODE:
            RETVAL = THIS->linesize();
        OUTPUT:
            RETVAL
    CASE:
        CODE:
            THIS->linesize(value);

double
fltk::Valuator::previous_value( )

#INCLUDE: Dial.xsi

#INCLUDE: Slider.xsi

#INCLUDE: ValueInput.xsi

#endif // ifndef DISABLE_VALUATOR

BOOT:
    isa( "FLTK::Valuator", "FLTK::Widget" );
