#include "include/FLTK_pm.h"

MODULE = FLTK::Layout               PACKAGE = FLTK::Layout

#ifndef DISABLE_LAYOUT

#include <fltk/layout.h>

BOOT:
    register_constant( "LAYOUT_X", newSViv( fltk::LAYOUT_X ));
    export_tag( "LAYOUT_X", "layout" );
    register_constant( "LAYOUT_Y", newSViv( fltk::LAYOUT_Y ));
    export_tag( "LAYOUT_Y", "layout" );
    register_constant( "LAYOUT_XY", newSViv( fltk::LAYOUT_XY ));
    export_tag( "LAYOUT_XY", "layout" );
    register_constant( "LAYOUT_W", newSViv( fltk::LAYOUT_W ));
    export_tag( "LAYOUT_W", "layout" );
    register_constant( "LAYOUT_H", newSViv( fltk::LAYOUT_H ));
    export_tag( "LAYOUT_H", "layout" );
    register_constant( "LAYOUT_WH", newSViv( fltk::LAYOUT_WH ));
    export_tag( "LAYOUT_WH", "layout" );
    register_constant( "LAYOUT_XYWH", newSViv( fltk::LAYOUT_XYWH ));
    export_tag( "LAYOUT_XYWH", "layout" );
    register_constant( "LAYOUT_CHILD", newSViv( fltk::LAYOUT_CHILD ));
    export_tag( "LAYOUT_CHILD", "layout" );
    register_constant( "LAYOUT_USER", newSViv( fltk::LAYOUT_USER ));
    export_tag( "LAYOUT_USER", "layout" );
    register_constant( "LAYOUT_DAMAGE", newSViv( fltk::LAYOUT_DAMAGE ));
    export_tag( "LAYOUT_DAMAGE", "layout" );

#endif // ifndef DISABLE_LAYOUT
