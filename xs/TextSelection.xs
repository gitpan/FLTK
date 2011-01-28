#include "include/FLTK_pm.h"

MODULE = FLTK::TextSelection               PACKAGE = FLTK::TextSelection

#ifndef DISABLE_TEXTSELECTION

#include <fltk/TextBuffer.h>

#include "include/WidgetSubclass.h"

void
fltk::TextSelection::new( )
    PPCODE:
        void * RETVAL = NULL;
        RETVAL = (void *) new fltk::TextSelection( );
        if (RETVAL != NULL) {
            ST(0) = sv_newmortal();
            sv_setref_pv(ST(0), CLASS, RETVAL); /* -- hand rolled -- */
            XSRETURN(1);
        }

void
fltk::TextSelection::set( int start, int end )

void
fltk::TextSelection::set_rectangular( int start, int end, int rectstart, int rectend )

void
fltk::TextSelection::update( int pos, int ndeleted, int ninserted )

bool
fltk::TextSelection::rectangular( )

int
fltk::TextSelection::start( )

int
fltk::TextSelection::end( )

int
fltk::TextSelection::rectstart( )

int
fltk::TextSelection::rectend( )

bool
fltk::TextSelection::selected( bool b = NO_INIT )
    CASE: items == 2
        CODE:
            THIS->selected( b );
    CASE:
        CODE:
            RETVAL = THIS->selected( );
        OUTPUT:
            RETVAL

bool
fltk::TextSelection::zerowidth( bool b = NO_INIT )
    CASE: items == 2
        CODE:
            THIS->zerowidth( b );
    CASE:
        CODE:
            RETVAL = THIS->zerowidth( );
        OUTPUT:
            RETVAL

bool
fltk::TextSelection::includes( int pos, int lineStartPos, int dispIndex )

int
fltk::TextSelection::position( IN_OUTLIST int start, IN_OUTLIST int end, IN_OUTLIST int isrect = NO_INIT, IN_OUTLIST int rectstart = NO_INIT, IN_OUTLIST int rectend = NO_INIT )
    CASE: items == 3
        CODE:
            RETVAL = THIS->position( &start, &end );
        OUTPUT:
            RETVAL
    CASE:
        CODE:
            RETVAL = THIS->position( &start, &end, &isrect, &rectstart, &rectend );
        OUTPUT:
            RETVAL

#endif // ifndef DISABLE_TEXTSELECTION
