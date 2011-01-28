#include "include/FLTK_pm.h"

MODULE = FLTK::StatusBarGroup               PACKAGE = FLTK::StatusBarGroup

#ifndef DISABLE_STATUSBARGROUP

#include <fltk/StatusBarGroup.h>

#include "include/WidgetSubclass.h"

void
fltk::StatusBarGroup::new( int x = 24, int y = NO_INIT, int w = NO_INIT, int h = NO_INIT, char * label = 0, bool begin = false )
    PPCODE:
        void * RETVAL = NULL;
        if ( items <= 2 ) {
            RETVAL = (void *) new WidgetSubclass<fltk::StatusBarGroup>(CLASS,x);
        }
        else {
            RETVAL = (void *) new WidgetSubclass<fltk::StatusBarGroup>(CLASS,x,y,w,h,label,begin);
        }
        if (RETVAL != NULL) {
            ST(0) = sv_newmortal();
            sv_setref_pv(ST(0), CLASS, RETVAL); /* -- hand rolled -- */
            XSRETURN(1);
        }

void
fltk::StatusBarGroup::child_box( fltk::Box * b, fltk::StatusBarGroup::Position pos = NO_INIT )
    CASE: items == 2
        C_ARGS: b
    CASE:
        C_ARGS: b, pos

void
fltk::StatusBarGroup::set( const char * t, fltk::StatusBarGroup::Position pos = fltk::StatusBarGroup::SBAR_RIGHT )

BOOT:
    register_constant("FLTK::StatusBarGroup", "SBAR_LEFT",   newSViv( fltk::StatusBarGroup::SBAR_LEFT   ));
    register_constant("FLTK::StatusBarGroup", "SBAR_CENTER", newSViv( fltk::StatusBarGroup::SBAR_CENTER ));
    register_constant("FLTK::StatusBarGroup", "SBAR_RIGHT",  newSViv( fltk::StatusBarGroup::SBAR_RIGHT  ));

#endif // #ifndef DISABLE_STATUSBARGROUP

BOOT:
    isa("FLTK::StatusBarGroup", "FLTK::Group");
