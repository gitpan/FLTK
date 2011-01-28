#include "include/FLTK_pm.h"

MODULE = FLTK::Adjuster               PACKAGE = FLTK::Adjuster

#ifndef DISABLE_ADJUSTER

#include <fltk/Adjuster.h>

#include "include/WidgetSubclass.h"

void
fltk::Adjuster::new( int x, int y, int w, int h, char * label = 0 )
    PPCODE:
        void * RETVAL = NULL;
        RETVAL = (void *) new WidgetSubclass<fltk::Adjuster>(CLASS,x,y,w,h,label);
        if (RETVAL != NULL) {
            ST(0) = sv_newmortal();
            sv_setref_pv(ST(0), CLASS, RETVAL); /* -- hand rolled -- */
            XSRETURN(1);
        }

fltk::NamedStyle *
fltk::Adjuster::default_style( fltk::NamedStyle * style = NO_INIT )
    CASE: items == 1
        CODE:
            RETVAL = THIS->default_style;
        OUTPUT:
            RETVAL
    CASE: items == 2
        CODE:
            THIS->default_style = style;

int
fltk::Adjuster::soft ( int x = NO_INIT )
    CASE: items == 1
        CODE:
            RETVAL = THIS->soft( );
        OUTPUT:
            RETVAL
    CASE:
        CODE:
            THIS->soft( X );

#endif // ifndef DISABLE_ADJUSTER

BOOT:
    isa("FLTK::Adjuster", "FLTK::Valuator");
