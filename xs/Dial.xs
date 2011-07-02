#include "include/FLTK_pm.h"

MODULE = FLTK::Dial               PACKAGE = FLTK::Dial

#ifndef DISABLE_DIAL

#ifdef NORMAL // from perl, probably
#define PERL_NORMAL NORMAL
#undef NORMAL
#endif // ifdef NORMAL

#include <fltk/Dial.h>

#include "include/RectangleSubclass.h"

fltk::Dial *
fltk::Dial::new( int x, int y, int w, int h, char * label = 0 )
    CODE:
        RETVAL = new RectangleSubclass<fltk::Dial>(CLASS,x,y,w,h,label);
    OUTPUT:
        RETVAL

short
fltk::Dial::angle1( short a = NO_INIT )
    CASE: items == 1
        C_ARGS:
    CASE: items == 2
        CODE:
            THIS->angle1( a );

short
fltk::Dial::angle2( short b = NO_INIT )
    CASE: items == 1
        C_ARGS:
    CASE: items == 2
        CODE:
            THIS->angle2( b );

void
fltk::Dial::angles( short a, short b )

int
NORMAL( )
    CODE:
        switch( ix ) {
            case 0: RETVAL = fltk::Dial::NORMAL; break;
            case 1: RETVAL = fltk::Dial::LINE;   break;
            case 2: RETVAL = fltk::Dial::FILL;   break;
        }
    OUTPUT:
        RETVAL
    ALIAS:
        LINE = 1
        FILL = 2

#ifdef PERL_NORMAL // Undo our workaround
#define NORMAL PERL_NORMAL
#endif // ifdef PERL_NORMAL

#INCLUDE: FillDial.xsi

#INCLUDE: LineDial.xsi

#endif // ifndef DISABLE_DIAL

BOOT:
    isa("FLTK::Dial", "FLTK::Valuator");
