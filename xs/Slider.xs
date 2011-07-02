#include "include/FLTK_pm.h"

MODULE = FLTK::Slider               PACKAGE = FLTK::Slider

#ifndef DISABLE_SLIDER

#include <fltk/Slider.h>

#include "include/RectangleSubclass.h"

fltk::Slider *
fltk::Slider::new( int x, int y, int w, int h, const char * label = 0 )
    CODE:
        RETVAL = new RectangleSubclass<fltk::Slider>(CLASS,x,y,w,h,label);
    OUTPUT:
        RETVAL

int
LINEAR ( )
    CODE:
        switch ( ix ) {
            case 0: RETVAL = fltk::Slider::LINEAR;     break;
            case 1: RETVAL = fltk::Slider::TICK_ABOVE; break;
            case 2: RETVAL = fltk::Slider::TICK_LEFT;  break;
            case 3: RETVAL = fltk::Slider::TICK_BELOW; break;
            case 4: RETVAL = fltk::Slider::TICK_RIGHT; break;
            case 5: RETVAL = fltk::Slider::TICK_BOTH;  break;
            case 6: RETVAL = fltk::Slider::LOG;        break;
        }
    OUTPUT:
        RETVAL
    ALIAS:
        TICK_ABOVE = 1
         TICK_LEFT = 2
        TICK_BELOW = 3
        TICK_RIGHT = 4
         TICK_BOTH = 5
               LOG = 6

void
fltk::Slider::slider_size( int value )
    CODE:
        switch ( ix ) {
            case 0: THIS->slider_size( value ); break;
            case 1:   THIS->tick_size( value ); break;
        }
    ALIAS:
        tick_size = 1

int
fltk::Slider::slider_position( double value, int w )

double
fltk::Slider::position_value( int x, int w )

void
fltk::Slider::draw_ticks( fltk::Rectangle * rect, int min_spacing )
    C_ARGS: * rect, min_spacing

#INCLUDE: Scrollbar.xsi

#endif // ifndef DISABLE_SLIDER

BOOT:
    isa( "FLTK::Slider", "FLTK::Valuator" );
