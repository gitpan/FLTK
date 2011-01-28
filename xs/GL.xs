#include "include/FLTK_pm.h"

MODULE = FLTK::GL               PACKAGE = FLTK::GL

#ifndef DISABLE_GL

#include <fltk/gl.h>

MODULE = FLTK::GL               PACKAGE = FLTK

void
glstart( )
    CODE:
        fltk::glstart( );

void
glfinish( )
    CODE:
        fltk::glfinish( );

BOOT:
    export_tag("glstart",  "gl");
    export_tag("glfinish", "gl");

MODULE = FLTK::GL               PACKAGE = FLTK::GL

MODULE = FLTK::GL               PACKAGE = FLTK

void
glsetcolor( fltk::Color color )
    CODE:
        fltk::glsetcolor( color );

BOOT:
    export_tag("glsetcolor", "gl");

MODULE = FLTK::GL               PACKAGE = FLTK::GL

MODULE = FLTK::GL               PACKAGE = FLTK

void
glstrokerect( int x, int y, int w, int h )
    CODE:
        fltk::glstrokerect( x, y, w, h );

void
glfillrect ( int x, int y, int w, int h )
    CODE:
        fltk::glfillrect ( x, y, w, h );

BOOT:
    export_tag("glstrokerect", "gl");
    export_tag("glfillrect",   "gl");

MODULE = FLTK::GL               PACKAGE = FLTK::GL

MODULE = FLTK::GL               PACKAGE = FLTK

void
glsetfont( fltk::Font * f, float size )
    CODE:
        fltk::glsetfont( f, size );

BOOT:
    export_tag("glsetfont", "gl");

MODULE = FLTK::GL               PACKAGE = FLTK::GL

MODULE = FLTK::GL               PACKAGE = FLTK

float
glgetascent( )
    CODE:
        RETVAL = fltk::glgetascent( );
    OUTPUT:
        RETVAL

float
glgetdescent( )
    CODE:
        RETVAL = fltk::glgetdescent( );
    OUTPUT:
        RETVAL

BOOT:
    export_tag("glgetascent",  "gl");
    export_tag("glgetdescent", "gl");

MODULE = FLTK::GL               PACKAGE = FLTK::GL

MODULE = FLTK::GL               PACKAGE = FLTK

float
glgetwidth( char * string, int length = NO_INIT )
    CODE:
        if ( items == 1 )
            RETVAL = fltk::glgetwidth( string );
        else
            RETVAL = fltk::glgetwidth( string, length );
    OUTPUT:
        RETVAL

BOOT:
    export_tag("glgetwidth", "gl");

MODULE = FLTK::GL               PACKAGE = FLTK::GL

MODULE = FLTK::GL               PACKAGE = FLTK

void
gldrawtext( char * string, float x = NO_INIT, float y = NO_INIT, float z = 0 )
    CODE:
        if ( items == 1 )
            fltk::gldrawtext( string /* NOTE: n (length) is not supported */ );
        else if ( items >= 3 )
            fltk::gldrawtext( string, /* NOTE: n (length) is not supported */ x, y, z );

BOOT:
    export_tag("gldrawtext", "gl");

MODULE = FLTK::GL               PACKAGE = FLTK::GL

MODULE = FLTK::GL               PACKAGE = FLTK

void
gldrawimage( uchar * data, int x, int y, int w, int h, int d = 3, int ld = 0 )
    CODE:
        fltk::gldrawimage( data, x, y, w, h, d, ld );

BOOT:
    export_tag("gldrawimage", "gl");

#endif // ifndef DISABLE_GL
