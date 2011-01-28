#include "include/FLTK_pm.h"

MODULE = FLTK::MenuSection               PACKAGE = FLTK::MenuSection

#ifndef DISABLE_MENUSECTION

#include <fltk/ItemGroup.h>

#include "include/WidgetSubclass.h"

void
fltk::MenuSection::new( char * label = 0, fltk::Symbol * symbol = NO_INIT )
    PPCODE:
        void * RETVAL = NULL;
        if ( items == 2)
            RETVAL = (void *) new WidgetSubclass<fltk::MenuSection>(CLASS,label);
        else
	        RETVAL = (void *) new WidgetSubclass<fltk::MenuSection>(CLASS,label,symbol);
        if (RETVAL != NULL) {
            ST(0) = sv_newmortal();
            sv_setref_pv(ST(0), CLASS, RETVAL); /* -- hand rolled -- */
            XSRETURN(1);
        }

bool
fltk::MenuSection::DESTROY( )

fltk::ItemGroup *
fltk::MenuSection::group( )

#endif // ifndef DISABLE_MENUSECTION
