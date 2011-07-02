#include "include/FLTK_pm.h"

MODULE = FLTK::MultiBrowser               PACKAGE = FLTK::MultiBrowser

#ifndef DISABLE_MULTIBROWSER

#ifdef NORMAL // from perl, probably
#define PERL_NORMAL NORMAL
#undef NORMAL
#endif // ifdef NORMAL

#include <fltk/MultiBrowser.h>

#ifdef PERL_NORMAL // Undo our workaround
#define NORMAL PERL_NORMAL
#endif // ifdef PERL_NORMAL

#include "include/RectangleSubclass.h"

fltk::MultiBrowser *
fltk::MultiBrowser::new( int x, int y, int w, int h, char * label = 0 )
    CODE:
        RETVAL = new RectangleSubclass<fltk::MultiBrowser>(CLASS,x,y,w,h,label);
    OUTPUT:
        RETVAL

#endif // ifndef DISABLE_MULTIBROWSER

BOOT:
    isa("FLTK::MultiBrowser", "FLTK::Browser");
