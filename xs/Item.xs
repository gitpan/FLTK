#include "include/FLTK_pm.h"

MODULE = FLTK::Item               PACKAGE = FLTK::Item

#ifndef DISABLE_ITEM

#include <fltk/Item.h>

#include "include/RectangleSubclass.h"

fltk::Item *
fltk::Item::new( char * label = 0, arg2 = NO_INIT, CV * callback = NO_INIT, SV * user_data = 0, fltk::Flags flags = 0 )
    CASE: ( items <= 2 )
        CODE:
            RETVAL = new RectangleSubclass<fltk::Item>(CLASS,label);
        OUTPUT:
            RETVAL
    CASE: ( items == 3 )
        CODE:
            fltk::Symbol * symbol;
            if (sv_isobject(ST(2)) && sv_derived_from( ST( 2 ), "FLTK::Symbol" ) )
                symbol = INT2PTR( fltk::Symbol *, SvIV( ( SV * ) SvRV( ST( 2 ) ) ) );
            else
                croak( "%s: %s is not of type %s",
                    GvNAME(CvGV(cv)), "symbol", "FLTK::Symbol" );
            RETVAL = new RectangleSubclass<fltk::Item>(CLASS,label,symbol);
        OUTPUT:
            RETVAL
    CASE:
        CODE:
            int shortcut = (int) SvIV( ST( 2 ) );
            HV   * cb    = newHV( );
            hv_store( cb, "coderef",  7, newSVsv( ST(3) ),                  0 );
            hv_store( cb, "class",    5, newSVpv( CLASS, strlen( CLASS ) ), 0 );
            if ( items >= 5 )
                hv_store( cb, "args", 4, newSVsv( user_data ),              0 );
            RETVAL = new RectangleSubclass<fltk::Item>(CLASS,label,shortcut,
                                                        _cb_w,(void *)cb,flags);
        OUTPUT:
            RETVAL

void
fltk::Item::set_style( style, bool menubar )
    CASE: sv_isobject(ST(1)) && sv_derived_from(ST(1), "FLTK::Style")
        fltk::Style  * style
    CASE:
        fltk::Widget * style

void
fltk::Item::clear_style( )

fltk::NamedStyle *
fltk::Item::default_style( fltk::NamedStyle * style = NO_INIT )
    CASE: items == 1
        CODE:
            RETVAL = THIS->default_style;
        OUTPUT:
            RETVAL
    CASE: items == 2
        CODE:
            THIS->default_style = style;

#INCLUDE: RadioItem.xsi

#endif // ifndef DISABLE_ITEM

BOOT:
    isa("FLTK::Item", "FLTK::Widget");
