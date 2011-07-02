#include "include/FLTK_pm.h"

MODULE = FLTK::FlatBox               PACKAGE = FLTK::FlatBox

#ifndef DISABLE_FLATBOX

#include <fltk/Box.h>

#include "include/RectangleSubclass.h"

fltk::FlatBox *
fltk::FlatBox::new( char * name )
    CODE:
        RETVAL = new RectangleSubclass<fltk::FlatBox>(CLASS,name);
    OUTPUT:
        RETVAL

void
fltk::FlatBox::_draw( fltk::Rectangle * rect )
    C_ARGS: * rect

bool
fltk::FlatBox::fills_rectangle(  )
    CODE:
        switch( ix ) {
            case 0: RETVAL = THIS->fills_rectangle( ); break;
            case 1: RETVAL = THIS->is_frame( ); break;
        }
    OUTPUT:
        RETVAL
    ALIAS:
        is_frame = 1

#INCLUDE: HighlightBox.xsi

#endif // #ifndef DISABLE_FLATBOX

BOOT:
    isa("FLTK::FlatBox", "FLTK::Box");
