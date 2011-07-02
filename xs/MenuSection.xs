#include "include/FLTK_pm.h"

MODULE = FLTK::MenuSection               PACKAGE = FLTK::MenuSection

#ifndef DISABLE_MENUSECTION

#include <fltk/ItemGroup.h>

#include <fltk/Symbol.h>

#include "include/RectangleSubclass.h"

fltk::MenuSection *
fltk::MenuSection::new( char * label = 0, fltk::Symbol * symbol = NO_INIT )
    CASE: ( items == 2)
        CODE:
            RETVAL = new RectangleSubclass<fltk::MenuSection>(CLASS,label);
        OUTPUT:
            RETVAL
    CASE:
        CODE:
            RETVAL = new RectangleSubclass<fltk::MenuSection>(CLASS,label,symbol);
        OUTPUT:
          RETVAL

bool
fltk::MenuSection::DESTROY( )

fltk::ItemGroup *
fltk::MenuSection::group( )

#endif // ifndef DISABLE_MENUSECTION
