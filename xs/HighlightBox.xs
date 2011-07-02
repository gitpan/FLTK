#include "include/FLTK_pm.h"

MODULE = FLTK::HighlightBox               PACKAGE = FLTK::HighlightBox

#ifndef DISABLE_HIGHLIGHTBOX

#include <fltk/Box.h>

fltk::HighlightBox *
fltk::HighlightBox::new( char * name, fltk::Box * down )
    CODE:
        RETVAL = new RectangleSubclass<fltk::HighlightBox>(CLASS,name,down);
    OUTPUT:
        RETVAL

void
fltk::HighlightBox::_draw( fltk::Rectangle * rect )
    C_ARGS: * rect

bool
fltk::HighlightBox::fills_rectangle( )
    CODE:
        switch( ix ) {
            case 0: RETVAL = THIS->fills_rectangle( ); break;
            case 1: RETVAL = THIS->is_frame( ); break;
        }
    OUTPUT:
        RETVAL
    ALIAS:
        is_frame = 1

#endif // #ifndef DISABLE_HIGHLIGHTBOX

BOOT:
    isa("FLTK::HighlightBox", "FLTK::FlatBox");
