#include "include/FLTK_pm.h"

MODULE = FLTK::pnmImage               PACKAGE = FLTK::pnmImage

#ifndef DISABLE_PNMIMAGE

#include <fltk/pnmImage.h>

fltk::pnmImage *
fltk::pnmImage::new( char * filename )

#endif // ifndef DISABLE_PNMIMAGE

BOOT:
    isa("FLTK::pnmImage", "FLTK::SharedImage");
