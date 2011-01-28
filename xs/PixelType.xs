#include "include/FLTK_pm.h"

MODULE = FLTK::PixelType               PACKAGE = FLTK::PixelType

#ifndef DISABLE_PIXELTYPE

#include <fltk/PixelType.h>

fltk::PixelType
MASK( )
    CODE:
        switch ( ix ) {
            case 0: RETVAL = fltk::MASK;   break;
            case 1: RETVAL = fltk::MONO;   break;
            case 2: RETVAL = fltk::RGBx;   break;
            case 3: RETVAL = fltk::RGB;    break;
            case 4: RETVAL = fltk::RGBA;   break;
            case 5: RETVAL = fltk::RGB32;  break;
            case 6: RETVAL = fltk::ARGB32; break;
            case 7: RETVAL = fltk::RGBM;   break;
            case 8: RETVAL = fltk::MRGB32; break;
        }
    OUTPUT: RETVAL
    ALIAS:
          MONO = 1
          RGBx = 2
           RGB = 3
          RGBA = 4
         RGB32 = 5
        ARGB32 = 6
          RGBM = 7
        MRGB32 = 8

int
depth( fltk::PixelType type )

#endif // ifndef DISABLE_PIXELTYPE

BOOT:
    export_tag("depth", "pixeltype");
