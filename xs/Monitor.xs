#include "include/FLTK_pm.h"

MODULE = FLTK::Monitor               PACKAGE = FLTK::Monitor

#ifndef DISABLE_MONITOR

#include <fltk/Monitor.h>

fltk::Rectangle
fltk::Monitor::work( )
    CODE:
        RETVAL = THIS->work;
    OUTPUT:
        RETVAL

int
fltk::Monitor::depth( )

float
fltk::Monitor::dpi_x( )

float
fltk::Monitor::dpi_y( )

float
fltk::Monitor::dpi( )

int
fltk::Monitor::list( AV * monitors )
    INIT:
        fltk::Monitor ** _monitors;
        for ( int i = 0; i < av_len(monitors); i++ )
            _monitors[ i ] = (fltk::Monitor *)(av_fetch(monitors, i, 0));
    C_ARGS: ( const fltk::Monitor ** ) _monitors

fltk::Monitor
fltk::Monitor::all( )

fltk::Monitor
fltk::Monitor::find(int x, int y)

#endif // ifndef DISABLE_MONITOR

BOOT:
    isa("FLTK::Monitor", "FLTK::Rectangle");
