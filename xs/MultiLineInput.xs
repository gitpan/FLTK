#include "include/FLTK_pm.h"

MODULE = FLTK::MultiLineInput               PACKAGE = FLTK::MultiLineInput

#ifndef DISABLE_MULTILINEINPUT

#ifdef NORMAL // from perl, probably
#define PERL_NORMAL NORMAL
#undef NORMAL
#endif // ifdef NORMAL

#include <fltk/MultiLineInput.h>

#ifdef PERL_NORMAL // Undo our workaround
#define NORMAL PERL_NORMAL
#endif // ifdef PERL_NORMAL

#include "include/RectangleSubclass.h"

fltk::MultiLineInput *
fltk::MultiLineInput::new( int x, int y, int w, int h, char * label = 0 )
    CODE:
        RETVAL = new RectangleSubclass<fltk::MultiLineInput>(CLASS,x,y,w,h,label);
    OUTPUT:
        RETVAL

#endif // ifndef DISABLE_MULTILINEINPUT

BOOT:
    isa("FLTK::MultiLineInput", "FLTK::Input");
