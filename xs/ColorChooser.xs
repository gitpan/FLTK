#include "include/FLTK_pm.h"

MODULE = FLTK::ColorChooser               PACKAGE = FLTK::ColorChooser

#ifndef DISABLE_COLORCHOOSER

#include <fltk/ColorChooser.h>

#include "include/WidgetSubclass.h"

void
fltk::ColorChooser::new( int x, int y, int w, int h, const char * label = 0 )
    PPCODE:
        void * RETVAL = NULL;
        RETVAL = (void *) new WidgetSubclass<fltk::ColorChooser>(CLASS,x,y,w,h,label);
        if (RETVAL != NULL) {
            ST(0) = sv_newmortal();
            sv_setref_pv(ST(0), CLASS, RETVAL); /* -- hand rolled -- */
            XSRETURN(1);
        }

double
fltk::ColorChooser::h( )
    CODE:
        switch ( ix ) {
            case 0: RETVAL = THIS->h( ); break;
            case 1: RETVAL = THIS->s( ); break;
            case 2: RETVAL = THIS->v( ); break;
            case 3: RETVAL = THIS->r( ); break;
            case 4: RETVAL = THIS->g( ); break;
            case 5: RETVAL = THIS->b( ); break;
        }
    OUTPUT:
        RETVAL
    ALIAS:
        s = 1
        v = 2
        r = 3
        g = 4
        b = 5

bool
fltk::ColorChooser::no_value ( bool value = NO_INIT )
    CASE: items == 1
        C_ARGS:
        OUTPUT:
            RETVAL
    CASE:
        OUTPUT:
            RETVAL

int
fltk::ColorChooser::value( fltk::Color color = NO_INIT )
    PPCODE:
        if ( items == 1 ) {
            fltk::Color RETVAL = THIS->value( );
            XSprePUSH; PUSHi((IV)RETVAL);
        }
        else if ( items == 2 ) {
            bool RETVAL = THIS->value( color );
            ST(0) = boolSV(RETVAL);
            sv_2mortal(ST(0));
        }
        XSRETURN(1);

bool
fltk::ColorChooser::hsv( float h, float s, float v )

bool
fltk::ColorChooser::rgb( float r, float g, float b )

double
fltk::ColorChooser::a( float a = NO_INIT )
    CASE: items == 1
        C_ARGS:
    CASE:
        C_ARGS: a

void
fltk::ColorChooser::hide_a( )
    CODE:
        switch( ix ) {
            case 0: THIS->hide_a( );        break;
            case 1: THIS->hide_no_value( ); break;
        }
    ALIAS:
        hide_no_value = 1

void
fltk::ColorChooser::hsv2rgb( float h, float s, float v, OUTLIST float r, OUTLIST float g, OUTLIST float b )
    C_ARGS: h, s, v, r, g, b

void
fltk::ColorChooser::rgb2hsv( float r, float g, float b, OUTLIST float h, OUTLIST float s, OUTLIST float v )
    C_ARGS: r, g, b, h, s, v

void
fltk::ColorChooser::layout( )

bool
color_chooser ( const char * name, r, g = 0, b = 0, a = 0 )
    CASE: items == 2
        fltk::Color r;
        CODE:
            RETVAL = fltk::color_chooser( name, r );
        OUTPUT:
            RETVAL
            r
    CASE: items == 4 && SvPOK(ST(1)) && SvPOK(ST(2)) && SvPOK(ST(3))
        uchar r;
        uchar g;
        uchar b;
        CODE:
            RETVAL = fltk::color_chooser( name, r, g, b );
        OUTPUT:
            RETVAL
            r
            g
            b
    CASE: items == 5 && SvPOK(ST(1)) && SvPOK(ST(2)) && SvPOK(ST(3)) && SvPOK(ST(4))
        uchar r;
        uchar g;
        uchar b;
        uchar a;
        CODE:
            RETVAL = fltk::color_chooser( name, r, g, b, a );
        OUTPUT:
            RETVAL
            r
            g
            b
            a
    CASE: items == 4 && SvNOK(ST(1)) && SvNOK(ST(2)) && SvNOK(ST(3))
        float r;
        float g;
        float b;
        CODE:
            RETVAL = fltk::color_chooser( name, r, g, b );
        OUTPUT:
            RETVAL
            r
            g
            b
    CASE: items == 5 && SvNOK(ST(1)) && SvNOK(ST(2)) && SvNOK(ST(3)) && SvNOK(ST(4))
        float r;
        float g;
        float b;
        float a;
        CODE:
            RETVAL = fltk::color_chooser( name, r, g, b, a );
        OUTPUT:
            RETVAL
            r
            g
            b
            a

#endif // #ifndef DISABLE_COLORCHOOSER

BOOT:
    isa("FLTK::ColorChooser", "FLTK::Group");
