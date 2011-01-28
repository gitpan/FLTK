#include "../include/FLTK_pm.h"

MODULE = FLTK::Browser::Mark               PACKAGE = FLTK::Browser::Mark

#ifndef DISABLE_BROWSER_MARK

#ifdef NORMAL // from perl, probably
#define PERL_NORMAL NORMAL
#undef NORMAL
#endif // ifdef NORMAL

#include <fltk/Browser.h>

#ifdef PERL_NORMAL // Undo our workaround
#define NORMAL PERL_NORMAL
#endif // ifdef PERL_NORMAL

fltk::Browser::Mark *
fltk::Browser::Mark::new( fltk::Browser::Mark * mark = NO_INIT )
    CASE: items == 1
        CODE:
            RETVAL = new fltk::Browser::Mark( );
        OUTPUT:
            RETVAL
    CASE:
        CODE:
            RETVAL = new fltk::Browser::Mark( * mark );
        OUTPUT:
            RETVAL

void
fltk::Browser::Mark::destroy( )
    CODE:
        delete THIS;
        sv_setsv(ST(0), &PL_sv_undef);

int
fltk::Browser::Mark::compare( fltk::Browser::Mark * mark2 )
    C_ARGS: * mark2

void
fltk::Browser::Mark::unset( )

bool
fltk::Browser::Mark::is_set( )

#endif // ifndef DISABLE_BROWSER_MARK
