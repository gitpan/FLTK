#include "include/FLTK_pm.h"

MODULE = FLTK::MultiLineOutput               PACKAGE = FLTK::MultiLineOutput

#ifndef DISABLE_MULTILINEOUTPUT

#ifdef NORMAL // from perl, probably
#define PERL_NORMAL NORMAL
#undef NORMAL
#endif // ifdef NORMAL

#include <fltk/MultiLineOutput.h>

#ifdef PERL_NORMAL // Undo our workaround
#define NORMAL PERL_NORMAL
#endif // ifdef PERL_NORMAL

#include "include/RectangleSubclass.h"

fltk::MultiLineOutput *
fltk::MultiLineOutput::new( int x, int y, int w, int h, char * label = 0 )
    CODE:
        RETVAL = new RectangleSubclass<fltk::MultiLineOutput>(CLASS,x,y,w,h,label);
    OUTPUT:
        RETVAL

#endif // ifndef DISABLE_MULTILINEOUTPUT

BOOT:
    isa("FLTK::MultiLineOutput", "FLTK::Output");
