#include "include/FLTK_pm.h"

MODULE = FLTK::MenuWindow               PACKAGE = FLTK::MenuWindow

#ifndef DISABLE_MENUWINDOW

#include <fltk/MenuWindow.h>

#include "include/RectangleSubclass.h"

fltk::MenuWindow *
fltk::MenuWindow::new( int x, int y, w = 0, int h = 0, char * label = 0 )
    CASE: ( items <= 4 )
        CODE:
            if ( items == 4 )
                label = SvPV_nolen( ST( 3 ) );
            RETVAL = new RectangleSubclass<fltk::MenuWindow>(CLASS,x,y,label);
        OUTPUT:
            RETVAL
    CASE:
        CODE:
            int w = (int)SvIV(ST(3));
            RETVAL = new RectangleSubclass<fltk::MenuWindow>(CLASS,x,y,w,h,label);
        OUTPUT:
            RETVAL

fltk::NamedStyle *
fltk::MenuWindow::default_style( fltk::NamedStyle * style = NO_INIT )
    CASE: items == 1
        CODE:
            RETVAL = THIS->default_style;
        OUTPUT:
            RETVAL
    CASE: items == 2
        CODE:
            THIS->default_style = style;

int
fltk::MenuWindow::overlay( )

void
fltk::MenuWindow::set_overlay( )

void
fltk::MenuWindow::clear_overlay( )

#endif // ifndef DISABLE_MENUWINDOW

BOOT:
    isa("FLTK::MenuWindow", "FLTK::Window");
