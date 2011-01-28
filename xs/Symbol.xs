#include "include/FLTK_pm.h"

MODULE = FLTK::Symbol               PACKAGE = FLTK::Symbol

#ifndef DISABLE_SYMBOL

#include <fltk/Symbol.h>

const char *
fltk::Symbol::name( const char * name = NO_INIT )
    CASE: items == 1
        C_ARGS:
        OUTPUT:
            RETVAL
    CASE:
        CODE:
            THIS->name( name );

void
fltk::Symbol::measure( IN_OUTLIST int w, IN_OUTLIST int h )
    C_ARGS: w, h

void
fltk::Symbol::set_inset( x, int y = NO_INIT, int w = NO_INIT, int h = NO_INIT )
    CASE: items == 5
        int x
        C_ARGS: x, y, w, h
    CASE: items == 3
        int x
        C_ARGS: x, y
    CASE: items == 2 && sv_isobject( ST( 1 ) )
        fltk::Rectangle * x
        C_ARGS: * x
    CASE: items == 2
        int x
        C_ARGS: x

fltk::Rectangle
fltk::Symbol::get_inset( )

int
fltk::Symbol::dx( )

int
fltk::Symbol::dy( )

int
fltk::Symbol::dw( )

int
fltk::Symbol::dh( )

const fltk::Symbol *
find( const char * name, char * end = NO_INIT )
    CASE: items == 1
        CODE:
            RETVAL = fltk::Symbol::find( name );
        OUTPUT:
            RETVAL
    CASE: items == 2
        CODE:
            RETVAL = fltk::Symbol::find( name, (const char *) end );
        OUTPUT:
            RETVAL

const char *
fltk::Symbol::text( char * string = NO_INIT, unsigned n = NO_INIT )
    CASE: items == 1
        C_ARGS:
    CASE: items == 3
        CODE:
            THIS->text( (const char *) string, n );

unsigned
fltk::Symbol::text_length( )

#endif // ifndef DISABLE_SYMBOL
