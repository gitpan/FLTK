#include "include/FLTK_pm.h"

MODULE = FLTK::Plugin               PACKAGE = FLTK::Plugin

#ifndef DISABLE_PLUGIN

#include <fltk/load_plugin.h>

MODULE = FLTK::Plugin               PACKAGE = FLTK

void *
load_plugin( char * name, char * symbol = 0 )

#endif // ifndef DISABLE_PLUGIN

BOOT:
    export_tag("load_plugin", "version");
