#include "include/FLTK_pm.h"

MODULE = FLTK::ShapedWindow               PACKAGE = FLTK::ShapedWindow

#ifndef DISABLE_SHAPEDWINDOW

#include <fltk/ShapedWindow.h>

#include "include/RectangleSubclass.h"

fltk::ShapedWindow *
fltk::ShapedWindow::new( ... )
    CASE: ( items == 3 || items == 4 )
        CODE:
            char * label  = PL_origfilename;
            int w = (int)SvIV(ST(1));
            int h = (int)SvIV(ST(2));
            if (items == 4) label = (char *)SvPV_nolen(ST(3));
            RETVAL = new RectangleSubclass<fltk::ShapedWindow>(CLASS,w,h,label);
        OUTPUT:
            RETVAL
    CASE: (items == 5 || items == 6)
        CODE:
            char * label  = PL_origfilename;
            int x = (int)SvIV(ST(1));
            int y = (int)SvIV(ST(2));
            int w = (int)SvIV(ST(3));
            int h = (int)SvIV(ST(4));
            if (items == 6) label = (char *)SvPV_nolen(ST(5));
            RETVAL = new RectangleSubclass<fltk::ShapedWindow>(CLASS,x,y,w,h,label);
        OUTPUT:
            RETVAL
    POSTCALL:
        if (RETVAL != NULL) {
#ifdef WIN32
            RETVAL->icon((char *)LoadIcon (dllInstance( ), "FLTK" ));
#endif // ifdef WIN32
        }

void
fltk::ShapedWindow::shape( fltk::xbmImage * img )

#endif // ifndef DISABLE_SHAPEDWINDOW

BOOT:
    isa( "FLTK::ShapedWindow", "FLTK::Window" );
