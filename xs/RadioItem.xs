#include "include/FLTK_pm.h"

MODULE = FLTK::RadioItem               PACKAGE = FLTK::RadioItem

#ifndef DISABLE_RADIOITEM

#include <fltk/RadioItem.h>

#include "include/WidgetSubclass.h"

void
fltk::RadioItem::new( char * label = 0, arg2 = NO_INIT, CV * callback = NO_INIT, SV * user_data = 0, fltk::Flags flags = 0 )
    PPCODE:
        void * RETVAL = NULL;
        if ( items <= 2 )
            RETVAL = ( void * ) new WidgetSubclass<fltk::RadioItem>(CLASS,label);
        else {
            int shortcut = (int) SvIV( ST( 2 ) );
            HV   * cb    = newHV( );
            hv_store( cb, "coderef",  7, newSVsv( ST(3) ),                  0 );
            hv_store( cb, "class",    5, newSVpv( CLASS, strlen( CLASS ) ), 0 );
            if ( items >= 5 )
                hv_store( cb, "args", 4, newSVsv( user_data ),              0 );
            RETVAL = (void *) new WidgetSubclass<fltk::RadioItem>(CLASS,label,
                                            shortcut,_cb_w,(void *)cb,flags);
        }
        if (RETVAL != NULL) {
            ST(0) = sv_newmortal();
            sv_setref_pv(ST(0), CLASS, RETVAL); /* -- hand rolled -- */
            XSRETURN(1);
        }

#endif // ifndef DISABLE_RADIOITEM

BOOT:
    isa("FLTK::RadioItem", "FLTK::Item");
