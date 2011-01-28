#include "include/FLTK_pm.h"

MODULE = FLTK::FlatBox               PACKAGE = FLTK::FlatBox

#ifndef DISABLE_FLATBOX

#include <fltk/Box.h>

#include "include/WidgetSubclass.h"

void
fltk::FlatBox::new( char * name )
    PPCODE:
        void * RETVAL = NULL;
        RETVAL = (void *) new WidgetSubclass<fltk::FlatBox>(CLASS,name);
        if (RETVAL != NULL) {
            ST(0) = sv_newmortal();
            sv_setref_pv(ST(0), CLASS, RETVAL); /* -- hand rolled -- */
            XSRETURN(1);
        }

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
