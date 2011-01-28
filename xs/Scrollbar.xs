#include "include/FLTK_pm.h"

MODULE = FLTK::Scrollbar               PACKAGE = FLTK::Scrollbar

#ifndef DISABLE_SCROLLBAR

#include <fltk/Scrollbar.h>

#include "include/WidgetSubclass.h"

void
fltk::Scrollbar::new( int x, int y, int w, int h, const char * label = 0 )
    PPCODE:
        void * RETVAL = NULL;
        RETVAL = (void *) new WidgetSubclass<fltk::Scrollbar>(CLASS,x,y,w,h,label);
        if (RETVAL != NULL) {
            ST(0) = sv_newmortal();
            sv_setref_pv(ST(0), CLASS, RETVAL); /* -- hand rolled -- */
            XSRETURN(1);
        }

fltk::NamedStyle *
fltk::Scrollbar::default_style( fltk::NamedStyle * new_style = NO_INIT )
    CASE: items == 1
        CODE:
            RETVAL = THIS->default_style;
        OUTPUT:
            RETVAL
    CASE: items == 2
        CODE:
            THIS->default_style = new_style;

int
fltk::Scrollbar::value( int position = NO_INIT, int size = NO_INIT, int top = NO_INIT, int total = NO_INIT )
    CASE: items == 1
        C_ARGS:
    CASE: items == 2
        C_ARGS: position
    CASE: items == 5
        C_ARGS: position, size, top, total

int
fltk::Scrollbar::pagesize( int size = NO_INIT )
    CASE: items == 1
        C_ARGS:
    CASE: items == 2
        CODE:
            THIS->pagesize( size );

#endif // ifndef DISABLE_SCROLLBAR

BOOT:
    isa( "FLTK::Scrollbar", "FLTK::Slider" );
