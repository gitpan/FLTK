#include "include/FLTK_pm.h"

MODULE = FLTK::AssociationType               PACKAGE = FLTK::AssociationType

#ifndef DISABLE_ASSOCIATIONTYPE

#include <fltk/WidgetAssociation.h>

SV *
fltk::AssociationType::foreach( fltk::AssociationType * at, fltk::Widget * widget, fltk::AssociationFunctor af )
    CODE:
        RETVAL = (SV*) THIS->foreach( at, widget, at );

#endif // #ifndef DISABLE_ASSOCIATIONTYPE
