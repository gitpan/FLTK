#include "include/FLTK_pm.h"

MODULE = FLTK::Cursor               PACKAGE = FLTK::Cursor

#ifndef DISABLE_CURSOR

#include <fltk/Cursor.h>

MODULE = FLTK::Cursor               PACKAGE = FLTK

fltk::Cursor *
cursor( fltk::Image * image, int x, int y )

fltk::Cursor *
CURSOR_DEFAULT( )
    CODE:
        RETVAL = fltk::CURSOR_DEFAULT;
    OUTPUT:
        RETVAL

BOOT:
    export_tag( "CURSOR_DEFAULT", "cursor" );

fltk::Cursor *
CURSOR_ARROW( )
    CODE:
        RETVAL = fltk::CURSOR_ARROW;
    OUTPUT:
        RETVAL

BOOT:
    export_tag( "CURSOR_ARROW",   "cursor" );

fltk::Cursor *
CURSOR_CROSS( )
    CODE:
        RETVAL = fltk::CURSOR_CROSS;
    OUTPUT:
        RETVAL

BOOT:
    export_tag( "CURSOR_CROSS",   "cursor" );

fltk::Cursor *
CURSOR_WAIT( )
    CODE:
        RETVAL = fltk::CURSOR_DEFAULT;
    OUTPUT:
        RETVAL

BOOT:
    export_tag( "CURSOR_WAIT",    "cursor" );

fltk::Cursor *
CURSOR_INSERT( )
    CODE:
        RETVAL = fltk::CURSOR_INSERT;
    OUTPUT:
        RETVAL

BOOT:
    export_tag( "CURSOR_INSERT",  "cursor" );

fltk::Cursor *
CURSOR_HAND( )
    CODE:
        RETVAL = fltk::CURSOR_HAND;
    OUTPUT:
        RETVAL

BOOT:
    export_tag( "CURSOR_HAND",    "cursor" );

fltk::Cursor *
CURSOR_HELP( )
    CODE:
        RETVAL = fltk::CURSOR_DEFAULT;
    OUTPUT:
        RETVAL

BOOT:
    export_tag( "CURSOR_HELP", "cursor" );

fltk::Cursor *
CURSOR_MOVE( )
    CODE:
        RETVAL = fltk::CURSOR_MOVE;
    OUTPUT:
        RETVAL

BOOT:
    export_tag( "CURSOR_MOVE", "cursor" );

fltk::Cursor *
CURSOR_NS( )
    CODE:
        RETVAL = fltk::CURSOR_NS;
    OUTPUT:
        RETVAL

BOOT:
    export_tag( "CURSOR_NS", "cursor" );

fltk::Cursor *
CURSOR_WE( )
    CODE:
        RETVAL = fltk::CURSOR_WE;
    OUTPUT:
        RETVAL

BOOT:
    export_tag( "CURSOR_WE", "cursor" );

fltk::Cursor *
CURSOR_NWSE( )
    CODE:
        RETVAL = fltk::CURSOR_NWSE;
    OUTPUT:
        RETVAL

BOOT:
    export_tag( "CURSOR_NWSE", "cursor" );

fltk::Cursor *
CURSOR_NESW( )
    CODE:
        RETVAL = fltk::CURSOR_NESW;
    OUTPUT:
        RETVAL

BOOT:
    export_tag( "CURSOR_NESW", "cursor" );

fltk::Cursor *
CURSOR_NO( )
    CODE:
        RETVAL = fltk::CURSOR_NO;
    OUTPUT:
        RETVAL

BOOT:
    export_tag( "CURSOR_NO", "cursor" );

fltk::Cursor *
CURSOR_NONE( )
    CODE:
        RETVAL = fltk::CURSOR_NONE;
    OUTPUT:
        RETVAL

BOOT:
    export_tag( "CURSOR_NONE", "cursor" );

#ifndef DISABLE_WIDGET

MODULE = FLTK::Cursor               PACKAGE = FLTK::Widget

void
fltk::Widget::cursor ( fltk::Cursor * c )

#endif // #ifndef DISABLE_WIDGET

MODULE = FLTK::Cursor               PACKAGE = FLTK::Cursor

#endif // #ifndef DISABLE_CURSOR

BOOT:
    isa("FLTK::Cursor", "FLTK::Image");
