#include "include/FLTK_pm.h"

MODULE = FLTK::Image               PACKAGE = FLTK::Image

#ifndef DISABLE_IMAGE

#include <fltk/Image.h>

void
fltk::Image::new( ... )
    INIT:
        fltk::Image * RETVAL = NULL;
    PPCODE:
        if ( items == 1 || items == 2 ) {
            char *	name = 0;
            if ( items == 2 )
                name = (char *) SvPV_nolen( ST( 1 ) );
            RETVAL = new fltk::Image( name ); /* char * name = 0 */
        }
        else if( ( items == 3 || items == 4 ) ) {
            int w = (int) SvIV( ST( 1 ) );
            int h = (int) SvIV( ST( 2 ) );
            char * name = 0;
            if ( items == 4 )
                name = (char *) SvPV_nolen( ST( 3 ) );
            RETVAL = new fltk::Image( w, h, name ); /* int w, int h, char * name = 0 */
        }
        else if ( ( items == 4 || items == 5 ) && sv_isobject( ST( 1 ) ) ) {
            if (! sv_derived_from(ST(1), "FLTK::PixelType")) /* -- hand rolled -- */
                XSRETURN_UNDEF;
            fltk::PixelType p = INT2PTR(fltk::PixelType,SvIV((SV*)SvRV(ST(1))));
            int    w    = (int) SvIV( ST( 2 ) );
            int    h    = (int) SvIV( ST( 3 ) );
            char * name = 0;
            if ( items == 5 )
                name = (char *) SvPV_nolen( ST( 4 ) );
            RETVAL   = new fltk::Image( p, w, h, name ); /* PixelType p, int w, int h, const char* name=0 */
        }
        else if ( items == 5 ) { /* TODO: untested */
            if (! sv_derived_from(ST( 2 ), "FLTK::PixelType")) /* -- hand rolled -- */
                XSRETURN_UNDEF;
            uchar *   d = (uchar *) SvPV_nolen( ST( 1 ) );
            fltk::PixelType p = INT2PTR(fltk::PixelType,SvIV((SV*)SvRV(ST(2))));
            int       w = (int) SvIV( ST( 3 ) );
            int       h = (int) SvIV( ST( 4 ) );
            RETVAL      = new fltk::Image( d, p, w, h ); /* const uchar* d, PixelType p, int w, int h */
        }
        else if ( items == 6 ) { /* TODO: untested */
            if (! sv_derived_from(ST( 2 ), "FLTK::PixelType")) /* -- hand rolled -- */
                XSRETURN_UNDEF;
            uchar *         d = (uchar *) SvPV_nolen( ST( 1 ) );
            fltk::PixelType p = INT2PTR(fltk::PixelType,SvIV((SV*)SvRV(ST(2))));
            int             w = (int) SvIV( ST( 3 ) );
            int             h = (int) SvIV( ST( 4 ) );
            int     linedelta = (int) SvIV( ST( 5 ) );
            RETVAL            = new fltk::Image( d, p, w, h, linedelta ); /* const uchar* d, PixelType p, int w, int h, int linedelta */
        }
        if ( RETVAL == NULL )
            XSRETURN_UNDEF; /* TODO: They really should be told about their FAIL */

        ST(0) = sv_newmortal( );
        sv_setref_pv(ST(0), "FLTK::Image", (void*)RETVAL); /* -- hand rolled -- */
        XSRETURN(1);

fltk::PixelType
fltk::Image::pixeltype( )

int
fltk::Image::depth( )

int
fltk::Image::width( )
    ALIAS:
        w = 1

int
fltk::Image::height( )
    ALIAS:
        h = 1

void
fltk::Image::setpixeltype( fltk::PixelType pixeltype )

void
fltk::Image::setsize( int w, int h )

void
fltk::Image::setpixels( uchar * data, rect, int linedelta = NO_INIT )
    CASE: items == 3 && SvIOK( ST( 2 ) )
        int rect
        C_ARGS: data, rect
    CASE: items == 3
        fltk::Rectangle * rect
        C_ARGS: data, * rect
    CASE: items == 4
        fltk::Rectangle * rect
        C_ARGS: data, * rect, linedelta

char *
fltk::Image::linebuffer( int y )
    CODE:
        RETVAL = (char *) THIS->linebuffer( y ); /* XXX - ParseXS can't cast uchar* as char* ...ugh. */
    OUTPUT:
        RETVAL

void
fltk::Image::setimage( uchar * source, fltk::PixelType pixeltype, int w, int h, int linedelta = NO_INIT )
    CASE: items == 5
        C_ARGS: source, pixeltype, w, h
    CASE: items == 6
        C_ARGS: source, pixeltype, w, h, linedelta

char *
fltk::Image::buffer( )
    CODE:
        RETVAL = (char *) THIS->buffer( ); /* XXX - ParseXS can't cast uchar* as char* ...ugh. */
    OUTPUT:
        RETVAL

void
fltk::Image::set_forceARGB32( )

void
fltk::Image::clear_forceARGB32( )

bool
fltk::Image::forceARGB32( )

fltk::PixelType
fltk::Image::buffer_pixeltype( )

int
fltk::Image::buffer_depth( )

int
fltk::Image::buffer_width( )

int
fltk::Image::buffer_height( )

int
fltk::Image::buffer_linedelta( )

void
fltk::Image::buffer_changed( )

void
fltk::Image::destroy( )
    CODE:
        delete THIS;
        sv_setsv(ST(0), &PL_sv_undef);

void
fltk::Image::draw( from, destination = NO_INIT )
    CASE: items == 2
        fltk::Rectangle * from
        C_ARGS: * from
    CASE: (items == 3) && SvIOK( ST( 1 ) ) && SvIOK( ST( 2 ) )
        int from
        int destination
        C_ARGS: from, destination
    CASE: items == 3
        fltk::Rectangle * from
        fltk::Rectangle * destination
        C_ARGS: * from, * destination

bool
fltk::Image::fills_rectangle( )

void
fltk::Image::fetch_if_needed( )

void
fltk::Image::refetch( )

unsigned long
fltk::Image::mem_used( )

unsigned long
fltk::Image::total_mem_used( )

void
fltk::Image::make_current( )

#INCLUDE: xpmImage.xsi

#endif // ifndef DISABLE_IMAGE

BOOT:
    isa("FLTK::Image", "FLTK::Symbol");
