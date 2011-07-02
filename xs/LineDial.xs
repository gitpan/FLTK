#include "include/FLTK_pm.h"

MODULE = FLTK::LineDial               PACKAGE = FLTK::LineDial

#ifndef DISABLE_LINEDIAL

#ifdef NORMAL // from perl, probably
#define PERL_NORMAL NORMAL
#undef NORMAL
#endif // ifdef NORMAL

#include <fltk/LineDial.h>

#ifdef PERL_NORMAL // Undo our workaround
#define NORMAL PERL_NORMAL
#endif // ifdef PERL_NORMAL

#include "include/RectangleSubclass.h"

fltk::LineDial *
fltk::LineDial::new( int x, int y, int w, int h, const char * label = 0 )
    CODE:
        RETVAL = new RectangleSubclass<fltk::LineDial>(CLASS,x,y,w,h,label);
    OUTPUT:
        RETVAL

#endif // #ifndef DISABLE_LINEDIAL

BOOT:
    isa("FLTK::LineDial", "FLTK::Dial");
