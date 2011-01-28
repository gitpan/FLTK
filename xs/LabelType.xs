#include "include/FLTK_pm.h"

MODULE = FLTK::LabelType               PACKAGE = FLTK::LabelType

#ifndef DISABLE_LABELTYPE

#include <fltk/LabelType.h>

fltk::LabelType *
fltk::LabelType::new( char * name )

const char *
fltk::LabelType::name( )
    CODE:
        RETVAL = THIS->name;
    OUTPUT:
        RETVAL

fltk::LabelType *
fltk::LabelType::next( )
    CODE:
        RETVAL = THIS->next;
    OUTPUT:
        RETVAL

fltk::LabelType *
fltk::LabelType::first( )
    CODE:
        RETVAL = THIS->first;
    OUTPUT:
        RETVAL

fltk::LabelType *
fltk::LabelType::find( char * name )

#INCLUDE: EngravedLabel.xsi

#endif // ifndef DISABLE_LABELTYPE
