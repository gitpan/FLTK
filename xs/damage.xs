#include "include/FLTK_pm.h"

MODULE = FLTK::damage               PACKAGE = FLTK::damage

#ifndef DISABLE_DAMAGE

#include <fltk/damage.h>

BOOT:
    register_constant( "DAMAGE_VALUE", newSViv(fltk::DAMAGE_VALUE));
    export_tag( "DAMAGE_VALUE", "damage" );
    register_constant( "DAMAGE_PUSHED", newSViv(fltk::DAMAGE_PUSHED));
    export_tag( "DAMAGE_PUSHED", "damage" );
    register_constant( "DAMAGE_SCROLL", newSViv(fltk::DAMAGE_SCROLL));
    export_tag( "DAMAGE_SCROLL", "damage" );
    register_constant( "DAMAGE_OVERLAY", newSViv(fltk::DAMAGE_OVERLAY));
    export_tag( "DAMAGE_OVERLAY", "damage" );
    register_constant( "DAMAGE_HIGHLIGHT", newSViv(fltk::DAMAGE_HIGHLIGHT));
    export_tag( "DAMAGE_HIGHLIGHT", "damage" );
    register_constant( "DAMAGE_CHILD", newSViv(fltk::DAMAGE_CHILD));
    export_tag( "DAMAGE_CHILD", "damage" );
    register_constant( "DAMAGE_CHILD_LABEL", newSViv(fltk::DAMAGE_CHILD_LABEL));
    export_tag( "DAMAGE_CHILD_LABEL", "damage" );
    register_constant( "DAMAGE_EXPOSE", newSViv(fltk::DAMAGE_EXPOSE));
    export_tag( "DAMAGE_EXPOSE", "damage" );
    register_constant( "DAMAGE_CONTENTS", newSViv(fltk::DAMAGE_CONTENTS));
    export_tag( "DAMAGE_CONTENTS", "damage" );
    register_constant( "DAMAGE_ALL", newSViv(fltk::DAMAGE_ALL));
    export_tag( "DAMAGE_ALL", "damage" );

#endif // ifndef DISABLE_DAMAGE
