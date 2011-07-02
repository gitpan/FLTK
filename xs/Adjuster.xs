#include "include/FLTK_pm.h"

MODULE = FLTK::Adjuster               PACKAGE = FLTK::Adjuster

#ifndef DISABLE_ADJUSTER

#include <fltk/Adjuster.h>

#include "include/RectangleSubclass.h"

fltk::Adjuster *
fltk::Adjuster::new( int x, int y, int w, int h, char * label = 0 )
    CODE:
        RETVAL = new RectangleSubclass<fltk::Adjuster>(CLASS,x,y,w,h,label);
    OUTPUT:
        RETVAL

fltk::NamedStyle *
fltk::Adjuster::default_style( fltk::NamedStyle * style = NO_INIT )
    CASE: items == 1
        CODE:
            RETVAL = THIS->default_style;
        OUTPUT:
            RETVAL
    CASE: items == 2
        CODE:
            THIS->default_style = style;

int
fltk::Adjuster::soft ( int x = NO_INIT )
    CASE: items == 1
        CODE:
            RETVAL = THIS->soft( );
        OUTPUT:
            RETVAL
    CASE:
        CODE:
            THIS->soft( X );

#endif // ifndef DISABLE_ADJUSTER

BOOT:
    isa("FLTK::Adjuster", "FLTK::Valuator");
