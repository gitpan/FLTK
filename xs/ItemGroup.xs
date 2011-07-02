#include "include/FLTK_pm.h"

MODULE = FLTK::ItemGroup               PACKAGE = FLTK::ItemGroup

#ifndef DISABLE_ITEMGROUP

#include <fltk/ItemGroup.h>

#include "include/RectangleSubclass.h"

fltk::ItemGroup *
fltk::ItemGroup::new( char * label = 0, ... )
    CASE: ( items <= 3 && ! sv_isobject(ST(2)) )
        CODE:
            bool begin;
            begin = (bool)SvTRUE(ST(2));
            RETVAL = new RectangleSubclass<fltk::ItemGroup>(CLASS,label,begin);
        OUTPUT:
            RETVAL
    CASE: ( items == 3 || items == 4 )
        CODE:
            fltk::Symbol * symbol;
            bool           begin;
            if (sv_isobject(ST(2)) && sv_derived_from(ST(2), "FLTK::Symbol"))
                symbol = INT2PTR( fltk::Symbol *, SvIV( ( SV * ) SvRV( ST(2) ) ) );
            else
                croak( "%s: %s is not of type %s", GvNAME(CvGV(cv)), "symbol",
                                                            "FLTK::Symbol" );
            begin = (bool)SvTRUE(ST(4));
            RETVAL = new RectangleSubclass<fltk::ItemGroup>(CLASS,label,symbol,begin);
        OUTPUT:
            RETVAL

#endif // ifndef DISABLE_ITEMGROUP

BOOT:
    isa("FLTK::ItemGroup", "FLTK::Menu");
