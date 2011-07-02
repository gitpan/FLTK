#include "include/FLTK_pm.h"

MODULE = FLTK::FloatInput               PACKAGE = FLTK::FloatInput

#ifndef DISABLE_FLOATINPUT

#ifdef NORMAL // from perl, probably
#define PERL_NORMAL NORMAL
#undef NORMAL
#endif // ifdef NORMAL

#include <fltk/FloatInput.h>

#ifdef PERL_NORMAL // Undo our workaround
#define NORMAL PERL_NORMAL
#endif // ifdef PERL_NORMAL

#include "include/RectangleSubclass.h"

fltk::FloatInput *
fltk::FloatInput::new( int x, int y, int w, int h, char * label = 0 )
    CODE:
        RETVAL = new RectangleSubclass<fltk::FloatInput>(CLASS,x,y,w,h,label);
    OUTPUT:
        RETVAL

int
fltk::FloatInput::ivalue( )

long
fltk::FloatInput::lvalue( )

double
fltk::FloatInput::fvalue( )

 # I want these under FLTK::FloatInput's namespace

int
FLOAT ( )
    CODE:
        switch( ix ) {
            case 0: RETVAL = fltk::FloatInput::FLOAT; break;
            case 1: RETVAL = fltk::FloatInput::INT;   break;
        }
    OUTPUT:
        RETVAL
    ALIAS:
        INT = 1

#endif // ifndef DISABLE_FLOATINPUT

BOOT:
    isa("FLTK::FloatInput", "FLTK::NumericInput");
