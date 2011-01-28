#include "../include/FLTK_pm.h"

MODULE = FLTK::TextDisplay::StyleTableEntry               PACKAGE = FLTK::TextDisplay::StyleTableEntry

#ifndef DISABLE_TEXTDISPLAY_STYLETABLEENTRY

#include <fltk/TextDisplay.h>

fltk::TextDisplay::StyleTableEntry *
fltk::TextDisplay::StyleTableEntry::new( )

void
fltk::TextDisplay::StyleTableEntry::destroy( )
    CODE:
        delete THIS;
        sv_setsv(ST(0), &PL_sv_undef);

fltk::Color
fltk::TextDisplay::StyleTableEntry::color( fltk::Color color = NO_INIT )
    CASE: items == 2
        CODE:
            THIS->color = color;
        OUTPUT:
    CASE:
        CODE:
            RETVAL = THIS->color;
        OUTPUT:
            RETVAL

fltk::Font *
fltk::TextDisplay::StyleTableEntry::font( fltk::Font * font = NO_INIT )
    CASE: items == 2
        CODE:
            THIS->font = font;
        OUTPUT:
    CASE:
        CODE:
            RETVAL = THIS->font;
        OUTPUT:
            RETVAL

double
fltk::TextDisplay::StyleTableEntry::size( double size = NO_INIT )
    CASE: items == 2
        CODE:
            THIS->size = size;
        OUTPUT:
    CASE:
        CODE:
            RETVAL = THIS->size;
        OUTPUT:
            RETVAL

unsigned
fltk::TextDisplay::StyleTableEntry::attr( unsigned attr = NO_INIT )
    CASE: items == 2
        CODE:
            THIS->attr = attr;
        OUTPUT:
    CASE:
        CODE:
            RETVAL = THIS->attr;
        OUTPUT:
            RETVAL

#endif // ifndef DISABLE_TEXTDISPLAY_STYLETABLEENTRY
