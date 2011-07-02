#include "include/FLTK_pm.h"

MODULE = FLTK::ValueSlider               PACKAGE = FLTK::ValueSlider

#ifndef DISABLE_VALUESLIDER

#ifdef NORMAL // from perl, probably
#define PERL_NORMAL NORMAL
#undef NORMAL
#endif // ifdef NORMAL

#include <fltk/ValueSlider.h>

#ifdef PERL_NORMAL // Undo our workaround
#define NORMAL PERL_NORMAL
#endif // ifdef PERL_NORMAL

#include "include/RectangleSubclass.h"

fltk::ValueSlider *
fltk::ValueSlider::new( int x, int y, int w, int h, const char * label = 0 )
    CODE:
        RETVAL = new RectangleSubclass<fltk::ValueSlider>(CLASS,x,y,w,h,label);
    OUTPUT:
        RETVAL

#endif // ifndef DISABLE_VALUESLIDER

BOOT:
    isa( "FLTK::ValueSlider", "FLTK::Slider" );
