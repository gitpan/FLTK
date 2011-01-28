#include "include/FLTK_pm.h"

MODULE = FLTK::FrameBox               PACKAGE = FLTK::FrameBox

#ifndef DISABLE_FRAMEBOX

#include <fltk/Box.h>

#include "include/WidgetSubclass.h"

void
fltk::FrameBox::new( char * name, int x, int y, int w, int h, char * pattern, fltk::Box * down = 0  )
    PPCODE:
        void * RETVAL = NULL;
        RETVAL = (void *) new WidgetSubclass<fltk::FrameBox>(CLASS,name,x,y,w,h,pattern,down);
        if (RETVAL != NULL) {
            ST(0) = sv_newmortal();
            sv_setref_pv(ST(0), CLASS, RETVAL); /* -- hand rolled -- */
            XSRETURN(1);
        }

const char *
fltk::FrameBox::data( char * string = NO_INIT )
    CASE: items == 1
        CODE:
            RETVAL = THIS->data( );
        OUTPUT:
            RETVAL
    CASE: items == 2
        CODE:
            THIS->data( string );


void
fltk::FrameBox::_draw( fltk::Rectangle * rect )
    C_ARGS: * rect

void
fltk::FrameBox::inset( fltk::Rectangle * rect )
    C_ARGS: * rect

bool
fltk::FrameBox::fills_rectangle(  )
    CODE:
        switch( ix ) {
            case 0: RETVAL = THIS->fills_rectangle( ); break;
            case 1: RETVAL = THIS->is_frame( ); break;
        }
    OUTPUT:
        RETVAL
    ALIAS:
        is_frame = 1

#endif // #ifndef DISABLE_FRAMEBOX

BOOT:
    isa("FLTK::FrameBox", "FLTK::Box");
