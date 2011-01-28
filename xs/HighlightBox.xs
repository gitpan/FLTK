#include "include/FLTK_pm.h"

MODULE = FLTK::HighlightBox               PACKAGE = FLTK::HighlightBox

#ifndef DISABLE_HIGHLIGHTBOX

#include <fltk/Box.h>

void
fltk::HighlightBox::new( char * name, fltk::Box * down )
    PPCODE:
        void * RETVAL = NULL;
        RETVAL = (void *) new WidgetSubclass<fltk::HighlightBox>(CLASS,name,down);
        if (RETVAL != NULL) {
            ST(0) = sv_newmortal();
            sv_setref_pv(ST(0), CLASS, RETVAL); /* -- hand rolled -- */
            XSRETURN(1);
        }

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
