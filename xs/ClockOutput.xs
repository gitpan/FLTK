#include "include/FLTK_pm.h"

MODULE = FLTK::ClockOutput               PACKAGE = FLTK::ClockOutput

#ifndef DISABLE_CLOCKOUTPUT

#include <fltk/Clock.h>

void
fltk::ClockOutput::new( int x, int y, int w, int h, const char * label = 0 )
    PPCODE:
        void * RETVAL = NULL;
        RETVAL = (void *) new WidgetSubclass<fltk::ClockOutput>(CLASS,x,y,w,h,label);
        if (RETVAL != NULL) {
            ST(0) = sv_newmortal( );
            sv_setref_pv(ST(0), CLASS, RETVAL); /* -- hand rolled -- */
            XSRETURN(1);
        }

BOOT:
    register_constant( "SQUARE", newSViv(fltk::ClockOutput::SQUARE));
    export_tag("SQUARE", "clock");
    register_constant( "ANALOG", newSViv(fltk::ClockOutput::ANALOG));
    export_tag("ANALOG", "clock");
    register_constant( "ROUND", newSViv(fltk::ClockOutput::ROUND));
    export_tag("ROUND", "clock");
    register_constant( "DIGITAL", newSViv(fltk::ClockOutput::DIGITAL));
    export_tag("DIGITAL", "clock");

unsigned long
fltk::ClockOutput::value( unsigned long time = NO_INIT, int minute = NO_INIT, int second = NO_INIT )
    CASE: items == 1
        CODE:
            RETVAL = THIS->value( );
        OUTPUT:
            RETVAL
    CASE: items == 2
        CODE:
            THIS->value( time );
            XSRETURN_EMPTY;
    CASE: items == 4
        CODE:
            THIS->value( time, minute, second );
            XSRETURN_EMPTY;

int
fltk::ClockOutput::hour( )

int
fltk::ClockOutput::minute( )

int
fltk::ClockOutput::second( )

#INCLUDE: Clock.xsi

#endif // #ifndef DISABLE_CLOCKOUTPUT

BOOT:
    isa("FLTK::ClockOutput", "FLTK::Widget");
