#include "include/FLTK_pm.h"

MODULE = FLTK::Button               PACKAGE = FLTK::Button

#ifndef DISABLE_BUTTON

#include <fltk/Button.h>

#include "include/WidgetSubclass.h"

void
fltk::Button::new( int x, int y, int w, int h, const char * label = 0 )
    PPCODE:
        void * RETVAL = NULL;
        RETVAL = (void *) new WidgetSubclass<fltk::Button>(CLASS,x,y,w,h,label);
        if (RETVAL != NULL) {
            ST(0) = sv_newmortal();
            sv_setref_pv(ST(0), CLASS, RETVAL); /* -- hand rolled -- */
            XSRETURN(1);
        }

int
HIDDEN ( )
    CODE:
        RETVAL = fltk::Button::HIDDEN;
    OUTPUT:
        RETVAL

bool
fltk::Button::value ( bool value = NO_INIT )
    CASE: items == 1
        CODE:
            RETVAL = THIS->value( );
        OUTPUT:
            RETVAL
    CASE:
        CODE:
            THIS->value( value );

fltk::NamedStyle *
fltk::Button::default_style( fltk::NamedStyle * style = NO_INIT )
    CASE: items == 1
        CODE:
            RETVAL = THIS->default_style;
        OUTPUT:
            RETVAL
    CASE: items == 2
        CODE:
            THIS->default_style = style;

#INCLUDE: CheckButton.xsi

#INCLUDE: RepeatButton.xsi

#INCLUDE: ReturnButton.xsi

#endif // ifndef DISABLE_BUTTON

BOOT:
    isa("FLTK::Button", "FLTK::Widget");
