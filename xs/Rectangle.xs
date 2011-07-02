#include "include/FLTK_pm.h"

MODULE = FLTK::Rectangle               PACKAGE = FLTK::Rectangle

#ifndef DISABLE_RECTANGLE

#include <fltk/Rectangle.h>

#include "include/RectangleSubclass.h"

fltk::Rectangle *
fltk::Rectangle::new( original = NO_INIT, ... )
    CASE: ( items == 1 )
        CODE:
            RETVAL = new RectangleSubclass<fltk::Rectangle>(CLASS);
        OUTPUT:
            RETVAL
    CASE: ( items == 5 && SvIOK(ST(1)) && SvIOK(ST(2)) && SvIOK(ST(3)) && SvIOK(ST(4)) )
        CODE:
            RETVAL = new RectangleSubclass<fltk::Rectangle>(CLASS,SvIV(ST(1)),SvIV(ST(2)),SvIV(ST(3)),SvIV(ST(4)));
        OUTPUT:
            RETVAL
    CASE: ( items == 3 && SvIOK(ST(1)) && SvIOK(ST(2)) )
        CODE:
            RETVAL = new RectangleSubclass<fltk::Rectangle>(CLASS,SvIV(ST(1)),SvIV(ST(2)));
        OUTPUT:
            RETVAL
    CASE: ( items == 2 )
        fltk::Rectangle * original
        CODE:
            RETVAL = new RectangleSubclass<fltk::Rectangle>(CLASS, *original);
        OUTPUT:
            RETVAL
    CASE: ( ( ( items == 4 ) || ( items == 5 ) ) && SvIOK(ST(2)) && SvIOK(ST(3)) )
        fltk::Rectangle * original
        CODE:
            int w = SvIV(ST(2));
            int h = SvIV(ST(3));
            int flags = 0;
            if ( items == 5 )
                flags = SvIV(ST(4));
            RETVAL = new RectangleSubclass<fltk::Rectangle>(CLASS,*original,w,h,flags);
        OUTPUT:
            RETVAL

bool
fltk::Rectangle::contains( int x, int y )

SV *
fltk::Rectangle::x( int value = NO_INIT )
    CODE:
        ST(0) = sv_newmortal();
        switch( ix ) {
            case 0: items==2?THIS->x(value):sv_setnv(ST(0),THIS->x()); break;
            case 1: items==2?THIS->y(value):sv_setnv(ST(0),THIS->y()); break;
            case 2: items==2?THIS->w(value):sv_setnv(ST(0),THIS->w()); break;
            case 3: items==2?THIS->h(value):sv_setnv(ST(0),THIS->h()); break;
        }
    ALIAS:
        y = 1
        w = 2
        h = 3

int
fltk::Rectangle::r( )

int
fltk::Rectangle::b( )

void
fltk::Rectangle::set_x( int v )

void
fltk::Rectangle::set_y( int v )

void
fltk::Rectangle::set_r( int v )

void
fltk::Rectangle::set_b( int v )

void
fltk::Rectangle::set( x, int y, int w, int h = 0 )
    CASE: items == 5 && !sv_isobject(ST(1))
        int x
        C_ARGS: x, y, w, h
    CASE:
        fltk::Rectangle * x
        C_ARGS: *x, y, w, h

void
fltk::Rectangle::move_x( int d )

void
fltk::Rectangle::move_y( int y )

void
fltk::Rectangle::move_r( int d )

void
fltk::Rectangle::move_b( int d )

void
fltk::Rectangle::inset( int d )

void
fltk::Rectangle::move( int x, int y )

bool
fltk::Rectangle::empty( )

bool
fltk::Rectangle::not_empty( )

int
fltk::Rectangle::center_x( )

int
fltk::Rectangle::center_y( )

int
fltk::Rectangle::baseline_y( )

void
fltk::Rectangle::merge( fltk::Rectangle * r )
    C_ARGS: * r

void
fltk::Rectangle::intersect( fltk::Rectangle * r )
    C_ARGS: * r

#endif // ifndef DISABLE_RECTANGLE
