#include "include/FLTK_pm.h"

MODULE = FLTK::Color               PACKAGE = FLTK::Color

#ifndef DISABLE_COLOR

#include <fltk/Color.h>

BOOT:
    register_constant( "NO_COLOR", newSViv( fltk::NO_COLOR ));
    export_tag("NO_COLOR", "color");
    register_constant( "FREE_COLOR", newSViv( fltk::FREE_COLOR ));
    export_tag("FREE_COLOR", "color");
    register_constant( "NUM_FREE_COLOR", newSViv( fltk::NUM_FREE_COLOR ));
    export_tag("NUM_FREE_COLOR", "color");
    register_constant( "GRAY00", newSViv( fltk::GRAY00 ));
    export_tag("GRAY00", "color");
    register_constant( "GRAY05", newSViv( fltk::GRAY05 ));
    export_tag("GRAY05", "color");
    register_constant( "GRAY10", newSViv( fltk::GRAY10 ));
    export_tag("GRAY10", "color");
    register_constant( "GRAY15", newSViv( fltk::GRAY15 ));
    export_tag("GRAY15", "color");
    register_constant( "GRAY20", newSViv( fltk::GRAY20 ));
    export_tag("GRAY20", "color");
    register_constant( "GRAY25", newSViv( fltk::GRAY25 ));
    export_tag("GRAY25", "color");
    register_constant( "GRAY30", newSViv( fltk::GRAY30 ));
    export_tag("GRAY30", "color");
    register_constant( "GRAY33", newSViv( fltk::GRAY33 ));
    export_tag("GRAY33", "color");
    register_constant( "GRAY35", newSViv( fltk::GRAY35 ));
    export_tag("GRAY35", "color");
    register_constant( "GRAY40", newSViv( fltk::GRAY40 ));
    export_tag("GRAY40", "color");
    register_constant( "GRAY45", newSViv( fltk::GRAY45 ));
    export_tag("GRAY45", "color");
    register_constant( "GRAY50", newSViv( fltk::GRAY50 ));
    export_tag("GRAY50", "color");
    register_constant( "GRAY55", newSViv( fltk::GRAY55 ));
    export_tag("GRAY55", "color");
    register_constant( "GRAY60", newSViv( fltk::GRAY60 ));
    export_tag("GRAY60", "color");
    register_constant( "GRAY65", newSViv( fltk::GRAY65 ));
    export_tag("GRAY65", "color");
    register_constant( "GRAY66", newSViv( fltk::GRAY66 ));
    export_tag("GRAY66", "color");
    register_constant( "GRAY70", newSViv( fltk::GRAY70 ));
    export_tag("GRAY70", "color");
    register_constant( "GRAY75", newSViv( fltk::GRAY75 ));
    export_tag("GRAY75", "color");
    register_constant( "GRAY80", newSViv( fltk::GRAY80 ));
    export_tag("GRAY80", "color");
    register_constant( "GRAY85", newSViv( fltk::GRAY85 ));
    export_tag("GRAY85", "color");
    register_constant( "GRAY90", newSViv( fltk::GRAY90 ));
    export_tag("GRAY90", "color");
    register_constant( "GRAY95", newSViv( fltk::GRAY95 ));
    export_tag("GRAY95", "color");
    register_constant( "GRAY99", newSViv( fltk::GRAY99 ));
    export_tag("GRAY99", "color");
    register_constant( "BLACK", newSViv( fltk::BLACK ));
    export_tag("BLACK", "color");
    register_constant( "RED", newSViv( fltk::RED ));
    export_tag("RED", "color");
    register_constant( "GREEN", newSViv( fltk::GREEN ));
    export_tag("GREEN", "color");
    register_constant( "YELLOW", newSViv( fltk::YELLOW ));
    export_tag("YELLOW", "color");
    register_constant( "BLUE", newSViv( fltk::BLUE ));
    export_tag("BLUE", "color");
    register_constant( "MAGENTA", newSViv( fltk::MAGENTA ));
    export_tag("MAGENTA", "color");
    register_constant( "CYAN", newSViv( fltk::CYAN ));
    export_tag("CYAN", "color");
    register_constant( "WHITE", newSViv( fltk::WHITE ));
    export_tag("WHITE", "color");
    register_constant( "DARK_RED", newSViv( fltk::DARK_RED ));
    export_tag("DARK_RED", "color");
    register_constant( "DARK_GREEN", newSViv( fltk::DARK_GREEN ));
    export_tag("DARK_GREEN", "color");
    register_constant( "DARK_YELLOW", newSViv( fltk::DARK_YELLOW ));
    export_tag("DARK_YELLOW", "color");
    register_constant( "DARK_BLUE", newSViv( fltk::DARK_BLUE ));
    export_tag("DARK_BLUE", "color");
    register_constant( "DARK_MAGENTA", newSViv( fltk::DARK_MAGENTA ));
    export_tag("DARK_MAGENTA", "color");
    register_constant( "DARK_CYAN", newSViv( fltk::DARK_CYAN ));
    export_tag("DARK_CYAN", "color");
    register_constant( "WINDOWS_BLUE", newSViv( fltk::WINDOWS_BLUE ));
    export_tag("WINDOWS_BLUE", "color");

MODULE = FLTK::Color               PACKAGE = FLTK

fltk::Color
color ( name = 0, g = NO_INIT, b = NO_INIT )
    CASE: items == 3
        int name
        int g
        int b
        CODE:
            RETVAL = fltk::color( name, g, b );
        OUTPUT:
            RETVAL
    CASE:
        char * name
        CODE:
            RETVAL = fltk::color( name );
        OUTPUT:
            RETVAL

BOOT:
    export_tag("color", "color");

MODULE = FLTK::Color               PACKAGE = FLTK::Color

MODULE = FLTK::Color               PACKAGE = FLTK

fltk::Color
parsecolor ( char * name, unsigned length = strlen(name) )
    CODE:
        RETVAL = fltk::parsecolor( name, length );
    OUTPUT:
        RETVAL

BOOT:
    export_tag("parsecolor", "color");

MODULE = FLTK::Color               PACKAGE = FLTK::Color

MODULE = FLTK::Color               PACKAGE = FLTK

fltk::Color
lerp ( fltk::Color color1, fltk::Color color2, float weight )
    CODE:
        RETVAL = fltk::lerp( color1, color2, weight );
    OUTPUT:
        RETVAL

BOOT:
    export_tag("lerp", "color");

MODULE = FLTK::Color               PACKAGE = FLTK::Color

MODULE = FLTK::Color               PACKAGE = FLTK

fltk::Color
inactive ( fltk::Color fore, fltk::Color back = NO_INIT )
    CASE: items == 2
        CODE:
            RETVAL = fltk::inactive( fore, back );
        OUTPUT:
            RETVAL
    CASE:
        CODE:
            RETVAL = fltk::inactive( fore );
    OUTPUT:
        RETVAL

BOOT:
    export_tag("inactive", "color");

MODULE = FLTK::Color               PACKAGE = FLTK::Color

MODULE = FLTK::Color               PACKAGE = FLTK

fltk::Color
contrast ( fltk::Color fore, fltk::Color back )
    CODE:
        RETVAL = fltk::contrast( fore, back );
    OUTPUT:
        RETVAL

BOOT:
    export_tag("contrast", "color");

MODULE = FLTK::Color               PACKAGE = FLTK::Color

MODULE = FLTK::Color               PACKAGE = FLTK

void
split_color ( fltk::Color color )
    PPCODE:
        {   unsigned char	r;
            unsigned char	g;
            unsigned char	b;
            fltk::split_color(color, r, g, b);
            XSprePUSH;	EXTEND(SP,3);
            PUSHs(sv_newmortal());
            sv_setuv(ST(0), (UV)r);
            PUSHs(sv_newmortal());
            sv_setuv(ST(1), (UV)g);
            PUSHs(sv_newmortal());
            sv_setuv(ST(2), (UV)b);
        }
        XSRETURN(3);

BOOT:
    export_tag("split_color", "color");

MODULE = FLTK::Color               PACKAGE = FLTK::Color

MODULE = FLTK::Color               PACKAGE = FLTK

void
set_color_index ( fltk::Color index, fltk::Color color )
    CODE:
        fltk::set_color_index( index, color );

BOOT:
    export_tag("set_color_index", "color");

MODULE = FLTK::Color               PACKAGE = FLTK::Color

MODULE = FLTK::Color               PACKAGE = FLTK

fltk::Color
get_color_index ( fltk::Color color )
    CODE:
        RETVAL = fltk::get_color_index( color );
    OUTPUT:
        RETVAL

BOOT:
    export_tag("get_color_index", "color");

MODULE = FLTK::Color               PACKAGE = FLTK::Color

MODULE = FLTK::Color               PACKAGE = FLTK

void
set_background ( fltk::Color color )
    CODE:
        fltk::set_background( color );

BOOT:
    export_tag("set_background", "color");

MODULE = FLTK::Color               PACKAGE = FLTK::Color

MODULE = FLTK::Color               PACKAGE = FLTK

fltk::Color
nearest_index ( fltk::Color color )
    CODE:
        RETVAL = fltk::nearest_index( color );
    OUTPUT:
        RETVAL

BOOT:
    export_tag("nearest_index", "color");

#endif // #ifndef DISABLE_COLOR
