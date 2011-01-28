#include "include/FLTK_pm.h"

SV * file_chooser_cb;

void _cb_f (const char * file) { // Callback for file_chooser
    dTHX;
    if ( ! SvOK( file_chooser_cb ) ) return;
    dSP;
    ENTER;
        SAVETMPS;
            PUSHMARK( sp );
    XPUSHs( newSVpv( file, strlen( file ) ) );
            PUTBACK;
    call_sv( file_chooser_cb, G_DISCARD );
        FREETMPS;
    LEAVE;
}

MODULE = FLTK::file_chooser               PACKAGE = FLTK::file_chooser

#ifndef DISABLE_FILE_CHOOSER

#include <fltk/file_chooser.h>

MODULE = FLTK::file_chooser               PACKAGE = FLTK

const char *
dir_chooser( char * message, char * directory, int relative = 0 )
    CODE:
        RETVAL = fltk::dir_chooser( message, directory, relative );
    OUTPUT:
        RETVAL


BOOT:
    export_tag("dir_chooser", "dialog");
    export_tag("dir_chooser", "default");

const char *
file_chooser( char * message, char * pattern, char * filename, int relative = 0 )
    CODE:
        RETVAL = fltk::file_chooser( message, pattern, filename, relative );
    OUTPUT:
        RETVAL

BOOT:
    export_tag("alert", "dialog");
    export_tag("alert", "default");

MODULE = FLTK::file_chooser               PACKAGE = FLTK::file_chooser

MODULE = FLTK::file_chooser               PACKAGE = FLTK

void
file_chooser_callback( CV * coderef )
    CODE:
        file_chooser_cb = newSVsv( ST( 0 ) );
        fltk::file_chooser_callback(_cb_f);

BOOT:
    export_tag("file_chooser_callback", "dialog");
    export_tag("file_chooser_callback", "default");

#endif // ifndef DISABLE_FILE_CHOOSER
