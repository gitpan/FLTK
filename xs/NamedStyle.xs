#include "include/FLTK_pm.h"

MODULE = FLTK::NamedStyle               PACKAGE = FLTK::NamedStyle

#ifndef DISABLE_NAMEDSTYLE

#include <fltk/Style.h>

void
fltk::NamedStyle::destroy( )
    CODE:
        delete THIS;
        sv_setsv(ST(0), &PL_sv_undef);

fltk::NamedStyle *
fltk::NamedStyle::new( style, fltk::Style * revert = NO_INIT, fltk::NamedStyle * backptr = NO_INIT )
    CASE: items == 2
        fltk::NamedStyle * style
        CODE:
            RETVAL = new fltk::NamedStyle( * style );
        OUTPUT:
            RETVAL
    CASE: items == 4
        const char * style
        CODE:
            RETVAL = new fltk::NamedStyle( style, (void ( * )( fltk::Style * )) revert, &backptr );
        OUTPUT:
            RETVAL

const char *
fltk::NamedStyle::name( const char * name = NO_INIT )
    CASE: items == 1
        CODE:
            RETVAL = THIS->name;
        OUTPUT:
            RETVAL
    CASE: items == 2
        CODE:
            THIS->name = name;

fltk::NamedStyle *
fltk::NamedStyle::next( )
    CODE:
        RETVAL = THIS->next;
    OUTPUT:
        RETVAL

fltk::NamedStyle *
first( )
    CODE:
        RETVAL = fltk::NamedStyle::first;
    OUTPUT:
        RETVAL

#endif // ifndef DISABLE_NAMEDSTYLE

BOOT:
    isa("FLTK::NamedStyle", "FLTK::Style");
