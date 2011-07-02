
#include "include/FLTK_pm.h"

MODULE = FLTK::TabGroupPager               PACKAGE = FLTK::TabGroupPager

#ifndef DISABLE_TABGROUPPAGER

#include <fltk/TabGroup.h>

#include "include/RectangleSubclass.h"

fltk::TabGroupPager *
fltk::TabGroupPager::new( )
    CODE:
        RETVAL = new RectangleSubclass<fltk::TabGroupPager>(CLASS);
    OUTPUT:
        RETVAL

#endif // #ifndef DISABLE_TABGROUPPAGER
