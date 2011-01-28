#include "include/FLTK_pm.h"

MODULE = FLTK::Rectangle               PACKAGE = FLTK::Rectangle

#ifndef DISABLE_RECTANGLE

#include <fltk/Rectangle.h>

#include "include/WidgetSubclass.h"

void
fltk::Rectangle::new( ... )
    PREINIT:
        void * RETVAL = NULL;
    PPCODE:
        if ( items == 1 )
            RETVAL = (void *) new WidgetSubclass<fltk::Rectangle>(CLASS);
        else if ( items == 5 && SvIOK(ST(1)) && SvIOK(ST(2)) && SvIOK(ST(3)) && SvIOK(ST(4)) )
            RETVAL = (void *) new WidgetSubclass<fltk::Rectangle>(CLASS,SvIV(ST(1)),SvIV(ST(2)),SvIV(ST(3)),SvIV(ST(4)));
        else if ( items == 3 && SvIOK(ST(1)) && SvIOK(ST(2)) )
            RETVAL = (void *) new WidgetSubclass<fltk::Rectangle>(CLASS,SvIV(ST(1)),SvIV(ST(2)));
        else if ( items == 2 ) {
            fltk::Rectangle * original;
            if (sv_isobject(ST(1)) && sv_derived_from(ST(1), "FLTK::Rectangle")) /* -- hand rolled -- */ //
                original = INT2PTR( fltk::Rectangle *, SvIV( ( SV * ) SvRV( ST(1) ) ) );
            else
                Perl_croak( aTHX_ "%s: %s is not of type %s",
                    "FLTK::Rectangle::new", "original", "FLTK::Rectangle" );
            RETVAL = (void *) new WidgetSubclass<fltk::Rectangle>(CLASS,*original);
        }
        else if ( ( ( items == 4 ) || ( items == 5 ) ) && SvIOK(ST(2)) && SvIOK(ST(3)) ) {
            fltk::Rectangle * original;
            int w = SvIV(ST(2));
            int h = SvIV(ST(3));
            int flags = 0;
            if ( items == 5 )
                flags = SvIV(ST(4));
            if (sv_isobject(ST(1)) && sv_derived_from(ST(1), "FLTK::Rectangle")) /* -- hand rolled -- */ //
                original = INT2PTR( fltk::Rectangle *, SvIV( ( SV * ) SvRV( ST(1) ) ) );
            else
                Perl_croak( aTHX_ "%s: %s is not of type %s",
                    "FLTK::Rectangle::new", "original", "FLTK::Rectangle" );
            RETVAL = (void *) new WidgetSubclass<fltk::Rectangle>(CLASS,*original,w,h,flags);
        }
        if (RETVAL != NULL) {
            ST(0) = sv_newmortal();
            sv_setref_pv(ST(0), CLASS, RETVAL); /* -- hand rolled -- */
            XSRETURN(1);
        }

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

#INCLUDE: Monitor.xsi

#INCLUDE: Widget.xsi

#endif // ifndef DISABLE_RECTANGLE
