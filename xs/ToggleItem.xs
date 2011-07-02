#include "include/FLTK_pm.h"

MODULE = FLTK::ToggleItem               PACKAGE = FLTK::ToggleItem

#ifndef DISABLE_TOGGLEITEM

#include <fltk/ToggleItem.h>

#include "include/RectangleSubclass.h"

fltk::ToggleItem *
fltk::ToggleItem::new( char * label = 0, arg2 = NO_INIT, CV * callback = NO_INIT, SV * user_data = 0, fltk::Flags flags = 0 )
    CASE: ( items <= 2 )
        CODE:
            RETVAL = new RectangleSubclass<fltk::ToggleItem>(CLASS,label);
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
            RETVAL = new RectangleSubclass<fltk::ToggleItem>(CLASS,label,
                                            shortcut,_cb_w,(void *)cb,flags);
        OUTPUT:
            RETVAL

#endif // #ifndef DISABLE_TOGGLEITEM

BOOT:
    isa("FLTK::ToggleItem", "FLTK::Item");
