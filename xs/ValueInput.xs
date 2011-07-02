#include "include/FLTK_pm.h"

MODULE = FLTK::ValueInput               PACKAGE = FLTK::ValueInput

#ifndef DISABLE_VALUEINPUT

#ifdef NORMAL // from perl, probably
#define PERL_NORMAL NORMAL
#undef NORMAL
#endif // ifdef NORMAL

#include <fltk/ValueInput.h>

#ifdef PERL_NORMAL // Undo our workaround
#define NORMAL PERL_NORMAL
#endif // ifdef PERL_NORMAL

fltk::ValueInput *
fltk::ValueInput::new( int x, int y, int w, int h, char * label = 0 )
    CODE:
        RETVAL = new RectangleSubclass<fltk::ValueInput>(CLASS,x,y,w,h,label);
    OUTPUT:
        RETVAL

#endif // ifndef DISABLE_VALUEINPUT

BOOT:
    isa( "FLTK::ValueInput" , "FLTK::Valuator");
