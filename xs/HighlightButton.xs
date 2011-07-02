#include "include/FLTK_pm.h"

MODULE = FLTK::HighlightButton               PACKAGE = FLTK::HighlightButton

#ifndef DISABLE_HIGHLIGHTBUTTON

#include <fltk/HighlightButton.h>

#include "include/RectangleSubclass.h"

fltk::HighlightButton *
fltk::HighlightButton::new( int x, int y, int w, int h, char * label = 0 )
    CODE:
        RETVAL = new RectangleSubclass<fltk::HighlightButton>(CLASS,x,y,w,h,label);
    OUTPUT:
        RETVAL

#endif // ifndef DISABLE_HIGHLIGHTBUTTON

BOOT:
    isa("FLTK::HighlightButton", "FLTK::Button");
