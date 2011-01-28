#include "include/FLTK_pm.h"

MODULE = FLTK::MenuBar               PACKAGE = FLTK::MenuBar

#ifndef DISABLE_MENUBAR

#include <fltk/MenuBar.h>

#include "include/WidgetSubclass.h"

void
fltk::MenuBar::new( int x, int y, int w, int h, char * label = 0 )
    PPCODE:
        void * RETVAL = NULL;
        RETVAL = (void *) new WidgetSubclass<fltk::MenuBar>(CLASS,x,y,w,h,label);
        if (RETVAL != NULL) {
            ST(0) = sv_newmortal();
            sv_setref_pv(ST(0), CLASS, RETVAL); /* -- hand rolled -- */
            XSRETURN(1);
        }

fltk::NamedStyle *
fltk::MenuBar::default_style( fltk::NamedStyle * style = NO_INIT )
    CASE: items == 1
        CODE:
            RETVAL = THIS->default_style;
        OUTPUT:
            RETVAL
    CASE: items == 2
        CODE:
            THIS->default_style = style;

#endif // ifndef DISABLE_MENUBAR

BOOT:
    isa("FLTK::MenuBar", "FLTK::Menu");
