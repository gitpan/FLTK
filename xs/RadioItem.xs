#include "include/FLTK_pm.h"

MODULE = FLTK::RadioItem               PACKAGE = FLTK::RadioItem

#ifndef DISABLE_RADIOITEM

#include <fltk/RadioItem.h>

#include "include/RectangleSubclass.h"

fltk::RadioItem *
fltk::RadioItem::new( char * label = 0, int shortcut = NO_INIT, CV * callback = NO_INIT, SV * user_data = 0, fltk::Flags flags = 0 )
    CASE: ( items <= 2 )
        CODE:
            RETVAL = new RectangleSubclass<fltk::RadioItem>(CLASS,label);
        OUTPUT:
            RETVAL
    CASE:
        CODE:
            HV   * cb    = newHV( );
            hv_store( cb, "coderef",  7, newSVsv( ST(3) ),                  0 );
            hv_store( cb, "class",    5, newSVpv( CLASS, strlen( CLASS ) ), 0 );
            if ( items >= 5 )
                hv_store( cb, "args", 4, newSVsv( user_data ),              0 );
            RETVAL = new RectangleSubclass<fltk::RadioItem>(CLASS,  label,
                                                            shortcut, _cb_w,
                                                            (void *)cb,flags);
        OUTPUT:
            RETVAL

#endif // ifndef DISABLE_RADIOITEM

BOOT:
    isa("FLTK::RadioItem", "FLTK::Item");
