#include "include/FLTK_pm.h"

MODULE = FLTK::SecretInput               PACKAGE = FLTK::SecretInput

#ifndef DISABLE_SECRETINPUT

#ifdef NORMAL // from perl, probably
#define PERL_NORMAL NORMAL
#undef NORMAL
#endif // ifdef NORMAL

#include <fltk/SecretInput.h>

#ifdef PERL_NORMAL // Undo our workaround
#define NORMAL PERL_NORMAL
#endif // ifdef PERL_NORMAL

#include "include/RectangleSubclass.h"

fltk::SecretInput *
fltk::SecretInput::new( int x, int y, int w, int h, const char * label = 0 )
    CODE:
        RETVAL = new RectangleSubclass<fltk::SecretInput>(CLASS,x,y,w,h,label);
    OUTPUT:
        RETVAL

#endif // ifndef DISABLE_SECRETINPUT

BOOT:
    isa( "FLTK::SecretInput", "FLTK::Input" );
