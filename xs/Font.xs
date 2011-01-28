#include "include/FLTK_pm.h"

MODULE = FLTK::Font               PACKAGE = FLTK::Font

#ifndef DISABLE_FONT

#include <fltk/Font.h>

BOOT:
    register_constant("BOLD", newSViv(fltk::BOLD));
    export_tag( "BOLD", "font" );
    register_constant("ITALIC", newSViv(fltk::ITALIC));
    export_tag( "ITALIC", "font" );
    register_constant("BOLD_ITALIC", newSViv(fltk::BOLD_ITALIC));
    export_tag( "BOLD_ITALIC", "font" );

MODULE = FLTK::Font               PACKAGE = FLTK

fltk::Font *
font( name, int attributes = 0 )
    CASE: items == 1 && SvIOK(ST(0)) && SvIOK(ST(0))
        int name
        CODE:
            RETVAL = fltk::font( name );
        OUTPUT:
            RETVAL
    CASE:
        char * name
        CODE:
            RETVAL = fltk::font( name, attributes );
        OUTPUT:
            RETVAL

BOOT:
    export_tag( "font", "font" );

MODULE = FLTK::Font               PACKAGE = FLTK::Font

MODULE = FLTK::Font               PACKAGE = FLTK

AV *
list_fonts ( )
    PREINIT:
        fltk::Font ** fonts;
        int           total;
    CODE:
        RETVAL = newAV( );
        sv_2mortal( (SV*) RETVAL );
        total = fltk::list_fonts( fonts );
        for ( int i = 0; i < total; i++ ) {
            SV * obj = newSV(0);
            sv_setref_pv(obj, "FLTK::Font", (void*)fonts[i]); /* -- hand rolled -- */
            av_push( RETVAL, obj );
        }
    OUTPUT:
        RETVAL

BOOT:
    export_tag( "list_fonts", "font" );

MODULE = FLTK::Font               PACKAGE = FLTK::Font

const char *
fltk::Font::name( int attributes = NO_INIT )
    CASE: items == 1
        C_ARGS:
    CASE:
        C_ARGS: & attributes
        OUTPUT:
            RETVAL
            attributes

fltk::Font *
fltk::Font::plus( int attributes )

fltk::Font *
fltk::Font::bold( )

fltk::Font *
fltk::Font::italic( )

AV *
fltk::Font::sizes ( )
    PREINIT:
        int * sizes;
        int   total;
   CODE:
        RETVAL = newAV( );
        sv_2mortal( (SV*) RETVAL );
        total = THIS->sizes( sizes );
        for ( int i = 0; i < total; i++ )
            av_push( RETVAL, newSViv( sizes[ i ] ));
    OUTPUT:
        RETVAL

AV *
fltk::Font::encodings ( )
    PREINIT:
        const char ** encodings;
        int           total;
    CODE:
        RETVAL = newAV( );
        sv_2mortal((SV*)RETVAL);
        total = THIS->encodings( encodings );
        for ( int i = 0; i < total; i++ )
            av_push( RETVAL, newSVpv( encodings[ i ], 0 ) );
    OUTPUT:
        RETVAL

const char *
fltk::Font::system_name( )

#endif // ifndef DISABLE_FONT
