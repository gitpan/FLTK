#include "include/FLTK_pm.h"

MODULE = FLTK::AssociationFunctor               PACKAGE = FLTK::AssociationFunctor

#ifndef DISABLE_ASSOCIATIONFUNCTOR

#include <fltk/WidgetAssociation.h>

bool
fltk::AssociationFunctor::handle( fltk::AssociationType at, fltk::Widget * widget, CV * coderef)
    CODE:
        THIS->handle(at, widget, _cb_w);

#endif // #ifndef DISABLE_ASSOCIATIONFUNCTOR
