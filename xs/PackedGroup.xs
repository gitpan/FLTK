#include "include/FLTK_pm.h"

MODULE = FLTK::PackedGroup               PACKAGE = FLTK::PackedGroup

#ifndef DISABLE_PACKEDGROUP

#ifdef NORMAL // from perl, probably
#define PERL_NORMAL NORMAL
#undef NORMAL
#endif // ifdef NORMAL

#include <fltk/PackedGroup.h>

#ifdef PERL_NORMAL // Undo our workaround
#define NORMAL PERL_NORMAL
#endif // ifdef PERL_NORMAL

int
NORMAL( )
    CODE:
        RETVAL = fltk::PackedGroup::NORMAL;
    OUTPUT:
        RETVAL

int
ALL_CHILDREN_VERTICAL( )
    CODE:
        RETVAL = fltk::PackedGroup::ALL_CHILDREN_VERTICAL;
    OUTPUT:
        RETVAL

#include "include/WidgetSubclass.h"

void
fltk::PackedGroup::new( int x, int y, int w, int h, char * label = 0, bool begin = false )
    PPCODE:
        void * RETVAL = NULL;
        RETVAL = (void *) new WidgetSubclass<fltk::PackedGroup>(CLASS,x,y,w,h,label,begin);
        if (RETVAL != NULL) {
            ST(0) = sv_newmortal();
            sv_setref_pv(ST(0), CLASS, RETVAL); /* -- hand rolled -- */
            XSRETURN(1);
        }

int
fltk::PackedGroup::spacing( int s = NO_INIT )
    CASE: items == 1
        CODE:
            RETVAL = THIS->spacing( );
        OUTPUT:
            RETVAL
    CASE: items == 2
        CODE:
            THIS->spacing( s );

int
fltk::PackedGroup::margin_left( int l = NO_INIT )
    CASE: items == 1
        CODE:
            RETVAL = THIS->margin_left( );
        OUTPUT:
            RETVAL
    CASE: items == 2
        CODE:
            THIS->margin_left( l );

int
fltk::PackedGroup::margin_right( int r = NO_INIT )
    CASE: items == 1
        CODE:
            RETVAL = THIS->margin_right( );
        OUTPUT:
            RETVAL
    CASE: items == 2
        CODE:
            THIS->margin_right( r );

int
fltk::PackedGroup::margin_top( int t = NO_INIT )
    CASE: items == 1
        CODE:
            RETVAL = THIS->margin_top( );
        OUTPUT:
            RETVAL
    CASE: items == 2
        CODE:
            THIS->margin_top( t );

int
fltk::PackedGroup::margin_bottom( int b = NO_INIT )
    CASE: items == 1
        CODE:
            RETVAL = THIS->margin_bottom( );
        OUTPUT:
            RETVAL
    CASE: items == 2
        CODE:
            THIS->margin_bottom( b );

void
fltk::PackedGroup::margin( int m )

BOOT:
    isa("FLTK::PackedGroup", "FLTK::Group");

#endif // ifndef DISABLE_PACKEDGROUP
