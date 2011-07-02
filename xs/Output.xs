#include "include/FLTK_pm.h"

MODULE = FLTK::Output               PACKAGE = FLTK::Output

#ifndef DISABLE_OUTPUT

#ifdef NORMAL // from perl, probably
#define PERL_NORMAL NORMAL
#undef NORMAL
#endif // ifdef NORMAL

#include <fltk/Output.h>

#ifdef PERL_NORMAL // Undo our workaround
#define NORMAL PERL_NORMAL
#endif // ifdef PERL_NORMAL

#include "include/RectangleSubclass.h"

fltk::Output *
fltk::Output::new( int x, int y, int w, int h, char * label = 0 )
    CODE:
        RETVAL = new RectangleSubclass<fltk::Output>(CLASS,x,y,w,h,label);
    OUTPUT:
        RETVAL

fltk::NamedStyle *
fltk::Output::default_style( fltk::NamedStyle * style = NO_INIT )
    CASE: items == 1
        CODE:
            RETVAL = THIS->default_style;
        OUTPUT:
            RETVAL
    CASE: items == 2
        CODE:
            THIS->default_style = style;

#INCLUDE: MultiLineOutput.xsi

#INCLUDE: ValueOutput.xsi

#endif // ifndef DISABLE_OUTPUT

BOOT:
    isa("FLTK::Output", "FLTK::Input");
