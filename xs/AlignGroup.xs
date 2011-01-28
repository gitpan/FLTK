#include "include/FLTK_pm.h"

MODULE = FLTK::AlignGroup               PACKAGE = FLTK::AlignGroup

#ifndef DISABLE_ALIGNGROUP

#include <fltk/AlignGroup.h>

#include "include/WidgetSubclass.h"

void
fltk::AlignGroup::new( int x, int y, int w, int h, const char * label = 0, uchar n_to_break = 0, bool vertical = 1, fltk::Flags align = fltk::ALIGN_LEFT, uchar dw = 0, uchar dh = 0 )
    PPCODE:
        void * RETVAL = NULL;
        RETVAL = (void *) new WidgetSubclass<fltk::AlignGroup>(CLASS,x,y,w,h,label,
                                        n_to_break, vertical, align, dw, dh );
        if (RETVAL != NULL) {
            ST(0) = sv_newmortal();
            sv_setref_pv(ST(0), CLASS, RETVAL); /* -- hand rolled -- */
            XSRETURN(1);
        }

void
fltk::AlignGroup::layout( )

bool
fltk::AlignGroup::vertical ( bool v = NO_INIT )
    CASE: items == 1
        CODE:
            RETVAL = THIS->vertical( );
        OUTPUT:
            RETVAL
    CASE:
        CODE:
            THIS->vertical( v );

uchar
fltk::AlignGroup::n_to_break( uchar value = NO_INIT )
    CASE: items == 1
        CODE:
            switch ( ix ) {
                case 0: RETVAL = THIS->n_to_break( ); break;
                case 1: RETVAL = THIS->dw( ); break;
                case 2: RETVAL = THIS->dh( ); break;
            }
        OUTPUT:
            RETVAL
    CASE:
        CODE:
            switch ( ix ) {
                case 0: THIS->n_to_break( value ); break;
                case 1: THIS->dw( value ); break;
                case 2: THIS->dh( value ); break;
            }
    ALIAS:
        dw = 1
        dh = 2

fltk::Flags
fltk::AlignGroup::align( fltk::Flags a = NO_INIT )
    CASE: items == 1
        CODE:
            RETVAL = THIS->align( );
        OUTPUT:
            RETVAL
    CASE:
        CODE:
            THIS->align( a );

#endif // ifndef DISABLE_ALIGNGROUP

BOOT:
    isa("FLTK::AlignGroup", "FLTK::Group");
