#include "include/FLTK_pm.h"

MODULE = FLTK::HelpView               PACKAGE = FLTK::HelpView

#ifndef DISABLE_HELPVIEW

#include <fltk/HelpView.h>

fltk::HelpView *
fltk::HelpView::new( int x, int y, int w, int h, char * label = 0 )

const char *
fltk::HelpView::directory ( )

const char *
fltk::HelpView::filename( )

int
fltk::HelpView::load( char * filename )

int
fltk::HelpView::size( )

fltk::Color
fltk::HelpView::textcolor( fltk::Color color = NO_INIT )
    CASE: items == 1
        C_ARGS:
    CASE:
        CODE:
            THIS->textcolor( color );

fltk::Font *
fltk::HelpView::textfont( fltk::Font * font = NO_INIT )
    CASE: items == 1
        C_ARGS:
    CASE:
        CODE:
            THIS->textfont( font );

int
fltk::HelpView::textsize( int size = NO_INIT )
        CASE: items == 1
            C_ARGS:
        CASE:
            CODE:
                THIS->textsize( size );

const char *
fltk::HelpView::title( )

int
fltk::HelpView::topline( line = NO_INIT )
    CASE: items == 1
        C_ARGS:
    CASE: SvIOK( ST(1) )
        int line
        CODE:
            THIS->topline( line );
    CASE:
        char * line
        CODE:
            THIS->topline( line );

int
fltk::HelpView::leftline( int col = NO_INIT )
    CASE: items == 1
        C_ARGS:
    CASE:
        CODE:
            THIS->leftline( col );

const char *
fltk::HelpView::value( char * value = NO_INIT )
    CASE: items == 1
        C_ARGS:
    CASE:
        CODE:
            THIS->value( value );

int
fltk::HelpView::find( char * string, int start = 0 )

#endif // ifndef DISABLE_HELPVIEW

BOOT:
    isa("FLTK::HelpView", "FLTK::Group");
