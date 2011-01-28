#include "include/FLTK_pm.h"

MODULE = FLTK::Flags               PACKAGE = FLTK::Flags

#ifndef DISABLE_FLAGS

#include <fltk/Flags.h>

BOOT:
    register_constant("NO_FLAGS", newSViv( fltk::NO_FLAGS ));
    export_tag("NO_FLAGS", "flags");
    register_constant("ALIGN_TOP", newSViv( fltk::ALIGN_TOP ));
    export_tag("ALIGN_TOP", "flags");
    register_constant("ALIGN_BOTTOM", newSViv( fltk::ALIGN_BOTTOM ));
    export_tag("ALIGN_BOTTOM", "flags");
    register_constant("ALIGN_LEFT", newSViv( fltk::ALIGN_LEFT ));
    export_tag("ALIGN_LEFT", "flags");
    register_constant("ALIGN_RIGHT", newSViv( fltk::ALIGN_RIGHT ));
    export_tag("ALIGN_RIGHT", "flags");
    register_constant("ALIGN_CENTER", newSViv( fltk::ALIGN_CENTER ));
    export_tag("ALIGN_CENTER", "flags");
    register_constant("ALIGN_INSIDE", newSViv( fltk::ALIGN_INSIDE ));
    export_tag("ALIGN_INSIDE", "flags");
    register_constant("ALIGN_CLIP", newSViv( fltk::ALIGN_CLIP ));
    export_tag("ALIGN_CLIP", "flags");
    register_constant("ALIGN_WRAP", newSViv( fltk::ALIGN_WRAP ));
    export_tag("ALIGN_WRAP", "flags");
    register_constant("ALIGN_MASK", newSViv( fltk::ALIGN_MASK ));
    export_tag("ALIGN_MASK", "flags");
    register_constant("ALIGN_POSITIONMASK", newSViv( fltk::ALIGN_POSITIONMASK ));
    export_tag("ALIGN_POSITIONMASK", "flags");
    register_constant("ALIGN_TOPLEFT", newSViv( fltk::ALIGN_TOPLEFT ));
    export_tag("ALIGN_TOPLEFT", "flags");
    register_constant("ALIGN_BOTTOMLEFT", newSViv( fltk::ALIGN_BOTTOMLEFT ));
    export_tag("ALIGN_BOTTOMLEFT", "flags");
    register_constant("ALIGN_TOPRIGHT", newSViv( fltk::ALIGN_TOPRIGHT ));
    export_tag("ALIGN_TOPRIGHT", "flags");
    register_constant("ALIGN_BOTTOMRIGHT", newSViv( fltk::ALIGN_BOTTOMRIGHT ));
    export_tag("ALIGN_BOTTOMRIGHT", "flags");
    register_constant("ALIGN_CENTERLEFT", newSViv( fltk::ALIGN_CENTERLEFT ));
    export_tag("ALIGN_CENTERLEFT", "flags");
    register_constant("ALIGN_CENTERRIGHT", newSViv( fltk::ALIGN_CENTERRIGHT ));
    export_tag("ALIGN_CENTERRIGHT", "flags");
    register_constant("ALIGN_INSIDE_TOP", newSViv( fltk::ALIGN_INSIDE_TOP ));
    export_tag("ALIGN_INSIDE_TOP", "flags");
    register_constant("ALIGN_INSIDE_BOTTOM", newSViv( fltk::ALIGN_INSIDE_BOTTOM ));
    export_tag("ALIGN_INSIDE_BOTTOM", "flags");
    register_constant("ALIGN_INSIDE_LEFT", newSViv( fltk::ALIGN_INSIDE_LEFT ));
    export_tag("ALIGN_INSIDE_LEFT", "flags");
    register_constant("ALIGN_INSIDE_TOPLEFT", newSViv( fltk::ALIGN_INSIDE_TOPLEFT ));
    export_tag("ALIGN_INSIDE_TOPLEFT", "flags");
    register_constant("ALIGN_INSIDE_BOTTOMLEFT", newSViv( fltk::ALIGN_INSIDE_BOTTOMLEFT ));
    export_tag("ALIGN_INSIDE_BOTTOMLEFT", "flags");
    register_constant("ALIGN_INSIDE_RIGHT", newSViv( fltk::ALIGN_INSIDE_RIGHT ));
    export_tag("ALIGN_INSIDE_RIGHT", "flags");
    register_constant("ALIGN_INSIDE_TOPRIGHT", newSViv( fltk::ALIGN_INSIDE_TOPRIGHT ));
    export_tag("ALIGN_INSIDE_TOPRIGHT", "flags");
    register_constant("ALIGN_INSIDE_BOTTOMRIGHT", newSViv( fltk::ALIGN_INSIDE_BOTTOMRIGHT ));
    export_tag("ALIGN_INSIDE_BOTTOMRIGHT", "flags");
    register_constant("ALIGN_MENU", newSViv( fltk::ALIGN_MENU ));
    export_tag("ALIGN_MENU", "flags");
    register_constant("ALIGN_BROWSER", newSViv( fltk::ALIGN_BROWSER ));
    export_tag("ALIGN_BROWSER", "flags");
    register_constant("INACTIVE", newSViv( fltk::INACTIVE ));
    export_tag("INACTIVE", "flags");
    register_constant("OUTPUT", newSViv( fltk::OUTPUT ));
    export_tag("OUTPUT", "flags");
    register_constant("STATE", newSViv( fltk::STATE ));
    export_tag("STATE", "flags");
    register_constant("SELECTED", newSViv( fltk::SELECTED ));
    export_tag("SELECTED", "flags");
    register_constant("INVISIBLE", newSViv( fltk::INVISIBLE ));
    export_tag("INVISIBLE", "flags");
    register_constant("HIGHLIGHT", newSViv( fltk::HIGHLIGHT ));
    export_tag("HIGHLIGHT", "flags");
    register_constant("HIGHLIGHT", newSViv( fltk::HIGHLIGHT ));
    export_tag("HIGHLIGHT", "flags");
    register_constant("CHANGED", newSViv( fltk::CHANGED ));
    export_tag("CHANGED", "flags");
    register_constant("COPIED_LABEL", newSViv( fltk::COPIED_LABEL ));
    export_tag("COPIED_LABEL", "flags");
    register_constant("RAW_LABEL", newSViv( fltk::RAW_LABEL ));
    export_tag("RAW_LABEL", "flags");
    register_constant("LAYOUT_VERTICAL", newSViv( fltk::LAYOUT_VERTICAL ));
    export_tag("LAYOUT_VERTICAL", "flags");
    register_constant("TAB_TO_FOCUS", newSViv( fltk::TAB_TO_FOCUS ));
    export_tag("TAB_TO_FOCUS", "flags");
    register_constant("CLICK_TO_FOCUS", newSViv( fltk::CLICK_TO_FOCUS ));
    export_tag("CLICK_TO_FOCUS", "flags");
    register_constant("INACTIVE_R", newSViv( fltk::INACTIVE_R ));
    export_tag("INACTIVE_R", "flags");
    register_constant("FOCUSED", newSViv( fltk::FOCUSED ));
    export_tag("FOCUSED", "flags");
    register_constant("PUSHED", newSViv( fltk::PUSHED ));
    export_tag("PUSHED", "flags");
    register_constant("RESIZE_NONE", newSViv( fltk::RESIZE_NONE ));
    export_tag("RESIZE_NONE", "flags");
    register_constant("RESIZE_FIT", newSViv( fltk::RESIZE_FIT ));
    export_tag("RESIZE_FIT", "flags");
    register_constant("RESIZE_FILL", newSViv( fltk::RESIZE_FILL ));
    export_tag("RESIZE_FILL", "flags");
    register_constant("OPENED", newSViv( fltk::OPENED ));
    export_tag("OPENED", "flags");

#endif // ifndef DISABLE_FLAGS
