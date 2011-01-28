#include "include/FLTK_pm.h"

MODULE = FLTK::ItemGroup               PACKAGE = FLTK::ItemGroup

#ifndef DISABLE_ITEMGROUP

#include <fltk/ItemGroup.h>

#include "include/WidgetSubclass.h"

void
fltk::ItemGroup::new( char * label = 0, ... )
    PPCODE:
        void * RETVAL = NULL;
        if ( items <= 3 && ! sv_isobject(ST(2)) ) {
            bool begin;
            begin = (bool)SvTRUE(ST(2));
            RETVAL = (void *) new WidgetSubclass<fltk::ItemGroup>(CLASS,label,begin);
        }
        else if ( items == 3 || items == 4 ) {
            fltk::Symbol * symbol;
            bool           begin;
            if (sv_isobject(ST(2)) && sv_derived_from(ST(2), "FLTK::Symbol"))
                symbol = INT2PTR( fltk::Symbol *, SvIV( ( SV * ) SvRV( ST(2) ) ) );
            else
                Perl_croak( aTHX_ "%s: %s is not of type %s",
                    GvNAME(CvGV(cv)), "symbol", "FLTK::Symbol" );
            begin = (bool)SvTRUE(ST(4));
	        RETVAL = (void *) new WidgetSubclass<fltk::ItemGroup>(CLASS,label,symbol,begin);
        }
        if (RETVAL != NULL) {
            ST(0) = sv_newmortal();
            sv_setref_pv(ST(0), CLASS, RETVAL); /* -- hand rolled -- */
            XSRETURN(1);
        }

#endif // ifndef DISABLE_ITEMGROUP

BOOT:
    isa("FLTK::ItemGroup", "FLTK::Menu");
