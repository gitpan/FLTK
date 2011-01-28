#include "include/FLTK_pm.h"

MODULE = FLTK::Box               PACKAGE = FLTK::Box

#ifndef DISABLE_BOX

#include <fltk/Box.h>

void
fltk::Box::_draw( fltk::Rectangle * rect )
    C_ARGS: * rect

#ifndef DISABLE_DEPRECATED

MODULE = FLTK::Box               PACKAGE = FLTK

void
drawframe( char * s, int x, int y, int w, int h )
    CODE:
        fltk::drawframe( s, x, y, w, h );

void
drawframe2( char * s, int x, int y, int w, int h )
    CODE:
        fltk::drawframe2( s, x, y, w, h );


BOOT:
    export_tag("drawframe", "box");
    export_tag("drawframe2", "box");

MODULE = FLTK::Box               PACKAGE = FLTK::Box

#endif // #ifndef DISABLE_DEPRECATED

MODULE = FLTK::Box               PACKAGE = FLTK

fltk::Box *
DOWN_BOX( )
    CODE:
        RETVAL = fltk::DOWN_BOX;
    OUTPUT:
        RETVAL

BOOT:
    export_tag( "DOWN_BOX", "box" );

fltk::Box *
FLAT_BOX( )
    CODE:
        RETVAL = fltk::FLAT_BOX;
    OUTPUT:
        RETVAL

BOOT:
    export_tag( "FLAT_BOX", "box" );

fltk::Box *
NO_BOX( )
    CODE:
        RETVAL = fltk::NO_BOX;
    OUTPUT:
        RETVAL

BOOT:
    export_tag( "NO_BOX", "box" );

fltk::Box *
UP_BOX( )
    CODE:
        RETVAL = fltk::UP_BOX;
    OUTPUT:
        RETVAL

BOOT:
    export_tag( "UP_BOX", "box" );

fltk::Box *
THIN_DOWN_BOX( )
    CODE:
        RETVAL = fltk::THIN_DOWN_BOX;
    OUTPUT:
        RETVAL

BOOT:
    export_tag( "THIN_DOWN_BOX", "box" );

fltk::Box *
THIN_UP_BOX( )
    CODE:
        RETVAL = fltk::THIN_UP_BOX;
    OUTPUT:
        RETVAL

BOOT:
    export_tag( "THIN_UP_BOX", "box" );

fltk::Box *
ENGRAVED_BOX( )
    CODE:
        RETVAL = fltk::ENGRAVED_BOX;
    OUTPUT:
        RETVAL

BOOT:
    export_tag( "ENGRAVED_BOX", "box" );

fltk::Box *
EMBOSSED_BOX( )
    CODE:
        RETVAL = fltk::EMBOSSED_BOX;
    OUTPUT:
        RETVAL

BOOT:
    export_tag( "EMBOSSED_BOX", "box" );

fltk::Box *
BORDER_BOX( )
    CODE:
        RETVAL = fltk::BORDER_BOX;
    OUTPUT:
        RETVAL


BOOT:
    export_tag( "BORDER_BOX", "box" );

fltk::Box *
HIGHLIGHT_UP_BOX( )
    CODE:
        RETVAL = fltk::HIGHLIGHT_UP_BOX;
    OUTPUT:
        RETVAL

BOOT:
    export_tag( "HIGHLIGHT_UP_BOX", "box" );

fltk::Box *
HIGHLIGHT_DOWN_BOX( )
    CODE:
        RETVAL = fltk::HIGHLIGHT_DOWN_BOX;
    OUTPUT:
        RETVAL

BOOT:
    export_tag( "HIGHLIGHT_DOWN_BOX", "box" );

MODULE = FLTK::Box               PACKAGE = FLTK::Box

#INCLUDE: FrameBox.xsi

#INCLUDE: FlatBox.xsi

#endif // ifndef DISABLE_BOX

BOOT:
    isa("FLTK::Box", "FLTK::Symbol");
