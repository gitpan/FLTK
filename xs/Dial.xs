#include "include/FLTK_pm.h"

MODULE = FLTK::Dial               PACKAGE = FLTK::Dial

#ifndef DISABLE_DIAL

#ifdef NORMAL // from perl, probably
#define PERL_NORMAL NORMAL
#undef NORMAL
#endif // ifdef NORMAL

#include <fltk/Dial.h>

#include "include/WidgetSubclass.h"

void
fltk::Dial::new( int x, int y, int w, int h, char * label = 0 )
    PPCODE:
        void * RETVAL = NULL;
        RETVAL = (void *) new WidgetSubclass<fltk::Dial>(CLASS,x,y,w,h,label);
        if (RETVAL != NULL) {
            ST(0) = sv_newmortal();
            sv_setref_pv(ST(0), CLASS, RETVAL); /* -- hand rolled -- */
            XSRETURN(1);
        }

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
