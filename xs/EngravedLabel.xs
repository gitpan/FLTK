#include "include/FLTK_pm.h"

MODULE = FLTK::EngravedLabel               PACKAGE = FLTK::EngravedLabel

#ifndef DISABLE_ENGRAVEDLABEL

#include <fltk/LabelType.h>

fltk::EngravedLabel *
fltk::EngravedLabel::new( char * name, AV * p, ... )
    CODE:
        croak("FLTK::EngravedLabel is incomplete; Feel free to contribute.");
        //RETVAL = new EngravedLabel(const char * n, const int p[][3]);

#endif // ifndef DISABLE_ENGRAVEDLABEL

BOOT:
    isa( "FLTK::EngravedLabel", "FLTK::LabelType" );
