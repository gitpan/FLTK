#include "include/FLTK_pm.h"

MODULE = FLTK::xpmImage               PACKAGE = FLTK::xpmImage

#ifndef DISABLE_XPMIMAGE

#include <fltk/xpmImage.h>

fltk::xpmImage *
fltk::xpmImage::new( ... )
    PREINIT:
        char ** data;
        int i;
    INIT:
        data = new char * [ items - 1 ];
        for ( i = 1; i < items; i++ )
            data[ i - 1 ] = SvPV_nolen( ST( i ) );
    C_ARGS: ( const char ** ) data
    OUTPUT:
        RETVAL

#endif // ifndef DISABLE_XPMIMAGE

BOOT:
    isa("FLTK::xpmImage", "FLTK::Image");
