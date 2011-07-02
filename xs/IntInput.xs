#include "include/FLTK_pm.h"

MODULE = FLTK::IntInput               PACKAGE = FLTK::IntInput

#ifndef DISABLE_INTINPUT

#ifdef NORMAL // from perl, probably
#define PERL_NORMAL NORMAL
#undef NORMAL
#endif // ifdef NORMAL

#include <fltk/IntInput.h>

#ifdef PERL_NORMAL // Undo our workaround
#define NORMAL PERL_NORMAL
#endif // ifdef PERL_NORMAL

#include "include/RectangleSubclass.h"

fltk::IntInput *
fltk::IntInput::new( int x, int y, int w, int h, const char * label = 0 )
    CODE:
        RETVAL = new RectangleSubclass<fltk::IntInput>(CLASS,x,y,w,h,label);
    OUTPUT:
        RETVAL

#endif // ifndef DISABLE_INTINPUT

BOOT:
    isa("FLTK::IntInput", "FLTK::FloatInput");
