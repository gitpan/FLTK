#include "include/FLTK_pm.h"

MODULE = FLTK::ProgressBar               PACKAGE = FLTK::ProgressBar

#ifndef DISABLE_PROGRESSBAR

#include <fltk/ProgressBar.h>

#include "include/RectangleSubclass.h"

fltk::ProgressBar *
fltk::ProgressBar::new( int x, int y, int w, int h, char * label = 0 )
    CODE:
        RETVAL = new RectangleSubclass<fltk::ProgressBar>(CLASS,x,y,w,h,label);
    OUTPUT:
        RETVAL

void
fltk::ProgressBar::range( double min, double max, double step = 1 )

double
fltk::ProgressBar::step( double step = NO_INIT )
    CASE: items == 1
        C_ARGS:
        OUTPUT:
            RETVAL
    CASE:
        CODE:
            THIS->step( step );

double
fltk::ProgressBar::minimum( double minimum = NO_INIT )
    CASE: items == 1
        C_ARGS:
        OUTPUT:
            RETVAL
    CASE:
        CODE:
            THIS->minimum( minimum );

double
fltk::ProgressBar::maximum( double maximum = NO_INIT )
    CASE: items == 1
        C_ARGS:
        OUTPUT:
            RETVAL
    CASE:
        CODE:
            THIS->maximum( maximum );

double
fltk::ProgressBar::position( double value = NO_INIT )
    CASE: items == 1
        C_ARGS:
        OUTPUT:
            RETVAL
    CASE:
        CODE:
            THIS->position( value );

double
fltk::ProgressBar::showtext( bool show = NO_INIT )
    CASE: items == 1
        C_ARGS:
        OUTPUT:
            RETVAL
    CASE:
        CODE:
            THIS->showtext( show );

fltk::Color
fltk::ProgressBar::text_color( fltk::Color color = NO_INIT )
    CASE: items == 1
        C_ARGS:
        OUTPUT:
            RETVAL
    CASE:
        CODE:
            THIS->text_color( color );

BOOT:
    isa("FLTK::ProgressBar", "FLTK::Widget");

#endif // ifndef DISABLE_PROGRESSBAR
