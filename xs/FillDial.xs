#include "include/FLTK_pm.h"

MODULE = FLTK::FillDial               PACKAGE = FLTK::FillDial

#ifndef DISABLE_FILLDIAL

#ifdef NORMAL // from perl, probably
#define PERL_NORMAL NORMAL
#undef NORMAL
#endif // ifdef NORMAL

#include <fltk/FillDial.h>

#ifdef PERL_NORMAL // Undo our workaround
#define NORMAL PERL_NORMAL
#endif // ifdef PERL_NORMAL

#include "include/RectangleSubclass.h"

fltk::FillDial *
fltk::FillDial::new( int x, int y, int w, int h, char * label = 0 )
    CODE:
        RETVAL = new RectangleSubclass<fltk::FillDial>(CLASS,x,y,w,h,label);
    OUTPUT:
        RETVAL

#endif // ifndef DISABLE_FILLDIAL

BOOT:
    isa("FLTK::FillDial", "FLTK::Dial");
