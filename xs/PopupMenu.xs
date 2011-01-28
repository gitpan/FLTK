#include "include/FLTK_pm.h"

MODULE = FLTK::PopupMenu               PACKAGE = FLTK::PopupMenu

#ifndef DISABLE_POPUPMENU

#ifdef NORMAL // from perl, probably
#define PERL_NORMAL NORMAL
#undef NORMAL
#endif // ifdef NORMAL

#include <fltk/PopupMenu.h>

#ifdef PERL_NORMAL // Undo our workaround
#define NORMAL PERL_NORMAL
#endif // ifdef PERL_NORMAL

int
NORMAL( )
    CODE:
        switch( ix ) {
            case 0: RETVAL = fltk::PopupMenu::NORMAL;   break;
            case 1: RETVAL = fltk::PopupMenu::POPUP1;   break;
            case 2: RETVAL = fltk::PopupMenu::POPUP2;   break;
            case 3: RETVAL = fltk::PopupMenu::POPUP12;  break;
            case 4: RETVAL = fltk::PopupMenu::POPUP3;   break;
            case 5: RETVAL = fltk::PopupMenu::POPUP13;  break;
            case 6: RETVAL = fltk::PopupMenu::POPUP23;  break;
            case 7: RETVAL = fltk::PopupMenu::POPUP123; break;
        }
    OUTPUT: RETVAL
    ALIAS:
          POPUP1 = 1
          POPUP2 = 2
         POPUP12 = 3
          POPUP3 = 4
         POPUP13 = 5
         POPUP23 = 6
        POPUP123 = 7

#include "include/WidgetSubclass.h"

void
fltk::PopupMenu::new( int x, int y, int w, int h, char * label = 0 )
    PPCODE:
        void * RETVAL = NULL;
        RETVAL = (void *) new WidgetSubclass<fltk::PopupMenu>(CLASS,x,y,w,h,label);
        if (RETVAL != NULL) {
            ST(0) = sv_newmortal();
            sv_setref_pv(ST(0), CLASS, RETVAL); /* -- hand rolled -- */
            XSRETURN(1);
        }

int
fltk::PopupMenu::popup( )

#endif // ifndef DISABLE_POPUPMENU

BOOT:
    isa("FLTK::PopupMenu", "FLTK::Menu");
