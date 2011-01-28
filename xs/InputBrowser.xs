#include "include/FLTK_pm.h"

MODULE = FLTK::InputBrowser               PACKAGE = FLTK::InputBrowser

#ifndef DISABLE_INPUTBROWSER

#ifdef NORMAL // from perl, probably
#define PERL_NORMAL NORMAL
#undef NORMAL
#endif // ifdef NORMAL

#include <fltk/InputBrowser.h>

#ifdef PERL_NORMAL // Undo our workaround
#define NORMAL PERL_NORMAL
#endif // ifdef PERL_NORMAL

#include "include/WidgetSubclass.h"

void
fltk::InputBrowser::new( int x, int y, int w, int h, const char * label = 0 )
    PPCODE:
        void * RETVAL = NULL;
        RETVAL = (void *) new WidgetSubclass<fltk::InputBrowser>(CLASS,x,y,w,h,label);
        if (RETVAL != NULL) {
            ST(0) = sv_newmortal();
            sv_setref_pv(ST(0), CLASS, RETVAL); /* -- hand rolled -- */
            XSRETURN(1);
        }

int
NORMAL( )
    CODE:
        switch ( ix ) {
            case 0: RETVAL = fltk::InputBrowser::NORMAL;               break;
            case 1: RETVAL = fltk::InputBrowser::NONEDITABLE;          break;
            case 2: RETVAL = fltk::InputBrowser::INDENTED;             break;
            case 3: RETVAL = fltk::InputBrowser::NONEDITABLE_INDENTED; break;
        }
    OUTPUT:
        RETVAL
    ALIAS:
                 NONEDITABLE = 1
                    INDENTED = 2
        NONEDITABLE_INDENTED = 3

void
fltk::InputBrowser::popup( )

void
fltk::InputBrowser::hide_popup( )

fltk::Widget *
fltk::InputBrowser::item( fltk::Widget * widget = NO_INIT )
    CASE: items == 1
        C_ARGS:
    CASE: items == 2
        C_ARGS: widget

int
fltk::InputBrowser::minw( int width = NO_INIT )
    CASE: items == 1
        C_ARGS:
    CASE: items == 2
        CODE:
            THIS->minw( width );

int
fltk::InputBrowser::minh( int height = NO_INIT )
    CASE: items == 1
        C_ARGS:
    CASE: items == 2
        CODE:
            THIS->minh( height );

int
fltk::InputBrowser::maxw( int width = NO_INIT )
    CASE: items == 1
        C_ARGS:
    CASE: items == 2
        CODE:
            THIS->maxw( width );

int
fltk::InputBrowser::maxh( int height = NO_INIT )
    CASE: items == 1
        C_ARGS:
    CASE: items == 2
        CODE:
            THIS->maxh( height );

const char *
fltk::InputBrowser::text( char * string = NO_INIT )
    CASE: items == 1
        C_ARGS:
    CASE: items == 2
        CODE:
            THIS->text( string );

#endif // ifndef DISABLE_INPUTBROWSER

BOOT:
    isa("FLTK::InputBrowser", "FLTK::Menu");
