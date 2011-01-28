#include "include/FLTK_pm.h"

MODULE = FLTK::FileIcon               PACKAGE = FLTK::FileIcon

#ifndef DISABLE_FILEICON

#include <fltk/FileIcon.h>

fltk::FileIcon *
fltk::FileIcon::new( char * pattern, int type, int ndata = 0 )

#endif // ifndef DISABLE_FILEICON

BOOT:
    isa("FLTK::FileIcon", "FLTK::Symbol");
