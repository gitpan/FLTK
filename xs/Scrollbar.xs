#include "include/FLTK_pm.h"

MODULE = FLTK::Scrollbar               PACKAGE = FLTK::Scrollbar

#ifndef DISABLE_SCROLLBAR

#include <fltk/Scrollbar.h>

#include "include/RectangleSubclass.h"

fltk::Scrollbar *
fltk::Scrollbar::new( int x, int y, int w, int h, const char * label = 0 )
    CODE:
        RETVAL = new RectangleSubclass<fltk::Scrollbar>(CLASS,x,y,w,h,label);
    OUTPUT:
        RETVAL

fltk::NamedStyle *
fltk::Scrollbar::default_style( fltk::NamedStyle * new_style = NO_INIT )
    CASE: items == 1
        CODE:
            RETVAL = THIS->default_style;
        OUTPUT:
            RETVAL
    CASE: items == 2
        CODE:
            THIS->default_style = new_style;

int
fltk::Scrollbar::value( int position = NO_INIT, int size = NO_INIT, int top = NO_INIT, int total = NO_INIT )
    CASE: items == 1
        C_ARGS:
    CASE: items == 2
        C_ARGS: position
    CASE: items == 5
        C_ARGS: position, size, top, total

int
fltk::Scrollbar::pagesize( int size = NO_INIT )
    CASE: items == 1
        C_ARGS:
    CASE: items == 2
        CODE:
            THIS->pagesize( size );

#endif // ifndef DISABLE_SCROLLBAR

BOOT:
    isa( "FLTK::Scrollbar", "FLTK::Slider" );
