#include "include/FLTK_pm.h"

MODULE = FLTK::Version               PACKAGE = FLTK::Version

#ifndef DISABLE_VERSION

#include <fltk/FL_VERSION.h>

MODULE = FLTK::Version               PACKAGE = FLTK

double
version( )
    CODE:
        RETVAL = fltk::version( );
    OUTPUT:
        RETVAL

BOOT:
    export_tag("version", "version");
    register_constant("FL_MAJOR_VERSION", newSViv(FL_MAJOR_VERSION));
    export_tag("FL_MAJOR_VERSION", "version");
    register_constant("FL_MINOR_VERSION", newSViv(FL_MINOR_VERSION));
    export_tag("FL_MINOR_VERSION", "version");
    register_constant("FL_PATCH_VERSION", newSViv(FL_PATCH_VERSION));
    export_tag("FL_PATCH_VERSION", "version");
    register_constant("FL_VERSION", newSVnv(FL_VERSION));
    export_tag("FL_VERSION", "version");

#endif // ifndef DISABLE_VERSION
