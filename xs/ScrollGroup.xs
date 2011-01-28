#include "include/FLTK_pm.h"

MODULE = FLTK::ScrollGroup               PACKAGE = FLTK::ScrollGroup

#ifndef DISABLE_SCROLLGROUP

#include <fltk/ScrollGroup.h>

#include "include/WidgetSubclass.h"

void
fltk::Scrollbar::new( int x, int y, int w, int h, const char * label = 0, bool begin = false )
    PPCODE:
        void * RETVAL = NULL;
        RETVAL = (void *) new WidgetSubclass<fltk::ScrollGroup>(CLASS,x,y,w,h,label,begin);
        if (RETVAL != NULL) {
            ST(0) = sv_newmortal( );
            sv_setref_pv(ST(0), CLASS, RETVAL); /* -- hand rolled -- */
            XSRETURN(1);
        }

int
HORIZONTAL( )
    CODE:
        switch( ix ) {
            case 0: RETVAL = fltk::ScrollGroup::HORIZONTAL;        break;
            case 1: RETVAL = fltk::ScrollGroup::VERTICAL;          break;
            case 2: RETVAL = fltk::ScrollGroup::BOTH;              break;
            case 3: RETVAL = fltk::ScrollGroup::ALWAYS_ON;         break;
            case 4: RETVAL = fltk::ScrollGroup::HORIZONTAL_ALWAYS; break;
            case 5: RETVAL = fltk::ScrollGroup::VERTICAL_ALWAYS;   break;
            case 6: RETVAL = fltk::ScrollGroup::BOTH_ALWAYS;       break;
        }
    OUTPUT:
        RETVAL
    ALIAS:
                 VERTICAL = 1
                     BOTH = 2
                ALWAYS_ON = 3
        HORIZONTAL_ALWAYS = 4
          VERTICAL_ALWAYS = 5
              BOTH_ALWAYS = 6

void
fltk::ScrollGroup::bbox( fltk::Rectangle * rect )
    C_ARGS: * rect

void
fltk::ScrollGroup::enable_drag_scroll( bool enable )

int
fltk::ScrollGroup::xposition( )

int
fltk::ScrollGroup::yposition( )

void
fltk::ScrollGroup::scrollTo( int x, int y )

#endif // ifndef DISABLE_SCROLLGROUP

BOOT:
    isa( "FLTK::ScrollGroup", "FLTK::Group" );
