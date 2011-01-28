#include "include/FLTK_pm.h"

MODULE = FLTK::BarGroup               PACKAGE = FLTK::BarGroup

#ifndef DISABLE_BARGROUP

#include <fltk/BarGroup.h>

#include "include/WidgetSubclass.h"

void
fltk::BarGroup::new ( int x, int y, int w, int h, char * label = 0, bool begin = false )
    PPCODE:
        void * RETVAL = NULL;
        RETVAL = (void *) new WidgetSubclass<fltk::BarGroup>(CLASS,x,y,w,h,label,begin);
        if (RETVAL != NULL) {
            ST(0) = sv_newmortal();
            sv_setref_pv(ST(0), CLASS, RETVAL); /* -- hand rolled -- */
            XSRETURN(1);
        }

fltk::NamedStyle *
fltk::BarGroup::default_style( fltk::NamedStyle * style = NO_INIT )
    CASE: items == 1
        CODE:
            RETVAL = THIS->default_style;
        OUTPUT:
            RETVAL
    CASE: items == 2
        CODE:
            THIS->default_style = style;

void
fltk::BarGroup::layout( )

bool
fltk::BarGroup::opened( bool value = NO_INIT )
    CASE: items == 1
        C_ARGS:
     CASE:
        C_ARGS: value

bool
fltk::BarGroup::open( )

bool
fltk::BarGroup::close( )

int
fltk::BarGroup::glyph_size( int value = NO_INIT )
    CASE: items == 1
        CODE:
            RETVAL = THIS->glyph_size( );
    CASE:
        CODE:
            THIS->glyph_size( value );

#endif // ifndef DISABLE_BARGROUP

BOOT:
    isa("FLTK::BarGroup", "FLTK::Group");
