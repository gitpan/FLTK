#include "include/FLTK_pm.h"

MODULE = FLTK::ask               PACKAGE = FLTK::ask

#ifndef DISABLE_ASK

#include <fltk/ask.h>

BOOT:
    register_constant("BEEP_DEFAULT", newSViv( fltk::BEEP_DEFAULT ));
    export_tag("BEEP_DEFAULT", "dialog");
    register_constant("BEEP_MESSAGE", newSViv( fltk::BEEP_MESSAGE ));
    export_tag("BEEP_MESSAGE", "dialog");
    register_constant("BEEP_ERROR", newSViv( fltk::BEEP_ERROR ));
    export_tag("BEEP_ERROR", "dialog");
    register_constant("BEEP_QUESTION", newSViv( fltk::BEEP_QUESTION ));
    export_tag("BEEP_QUESTION", "dialog");
    register_constant("BEEP_PASSWORD", newSViv( fltk::BEEP_PASSWORD ));
    export_tag("BEEP_PASSWORD", "dialog");
    register_constant("BEEP_NOTIFICATION", newSViv( fltk::BEEP_NOTIFICATION ));
    export_tag("BEEP_NOTIFICATION", "dialog");

MODULE = FLTK::ask               PACKAGE = FLTK

void
message( char * string )
    CODE:
        fltk::alert( string );

BOOT:
    export_tag("message", "dialog");
    export_tag("message", "default");

void
alert( char * string )
    CODE:
        fltk::alert( string );

BOOT:
    export_tag("alert", "dialog");
    export_tag("alert", "default");

MODULE = FLTK::ask               PACKAGE = FLTK::ask

MODULE = FLTK::ask               PACKAGE = FLTK

int
ask( char * question )
    CODE:
        RETVAL = fltk::ask( question );
    OUTPUT:
        RETVAL

BOOT:
    export_tag("ask", "dialog");
    export_tag("ask", "default");

MODULE = FLTK::ask               PACKAGE = FLTK::ask

MODULE = FLTK::ask               PACKAGE = FLTK

int
choice( char * question, char * answer_1, char * answer_2, char * answer_3)
    CODE:
        int a = fltk::choice(question, answer_3, answer_2, answer_1);
        RETVAL = a == 0 ? 2 : a == 2 ? 0 : a;
    OUTPUT:
        RETVAL

int
choice_alert( char * question, char * answer_1, char * answer_2, char * answer_3)
    CODE:
        int a = fltk::choice_alert(question, answer_3, answer_2, answer_1);
        RETVAL = a == 0 ? 2 : a == 2 ? 0 : a;
    OUTPUT:
        RETVAL

BOOT:
    export_tag("choice", "dialog");
    export_tag("choice", "default");
    export_tag("choice_alert", "dialog");
    export_tag("choice_alert", "default");

MODULE = FLTK::ask               PACKAGE = FLTK::ask

MODULE = FLTK::ask               PACKAGE = FLTK

const char *
input( char * label, char * default_value = 0 )
    CODE:
        RETVAL = fltk::input( label, default_value );
    OUTPUT:
        RETVAL

const char *
password( char * label, char * default_value = 0 )
    CODE:
        RETVAL = fltk::input( label, default_value );
    OUTPUT:
        RETVAL

BOOT:
    export_tag("input", "dialog");
    export_tag("input", "default");
    export_tag("password", "dialog");
    export_tag("password", "default");

MODULE = FLTK::ask               PACKAGE = FLTK::ask

MODULE = FLTK::ask               PACKAGE = FLTK

void
beep( int type = fltk::BEEP_DEFAULT )
    CODE:
        fltk::beep( type );

BOOT:
    export_tag("beep", "dialog");
    export_tag("beep", "default");

MODULE = FLTK::ask               PACKAGE = FLTK::ask

MODULE = FLTK::ask               PACKAGE = FLTK

bool
beep_on_dialog( bool value = NO_INIT )
    CASE: items == 1
        CODE:
            fltk::beep_on_dialog( value );
    CASE:
        CODE:
            RETVAL = fltk::beep_on_dialog( );
        OUTPUT:
            RETVAL

BOOT:
    export_tag("beep_on_dialog", "dialog");

MODULE = FLTK::ask               PACKAGE = FLTK::ask

MODULE = FLTK::ask               PACKAGE = FLTK

fltk::NamedStyle *
icon_style( fltk::NamedStyle * style = NO_INIT )
    CASE: items == 1
        CODE:
            fltk::icon_style = style;
        OUTPUT:
    CASE:
        CODE:
            RETVAL = fltk::icon_style;
        OUTPUT:
            RETVAL

fltk::NamedStyle *
message_style( fltk::NamedStyle * style = NO_INIT )
    CASE: items == 1
        CODE:
            fltk::message_style = style;
        OUTPUT:
    CASE:
        CODE:
            RETVAL = fltk::message_style;
        OUTPUT:
            RETVAL

BOOT:
    export_tag("icon_style", "dialog");
    export_tag("message_style", "dialog");

MODULE = FLTK::ask               PACKAGE = FLTK::ask

BOOT:
    magic_ptr_init( "FLTK::message_window_label",
                                    &fltk::message_window_label );
    export_tag("$message_window_label", "vars");
    magic_ptr_init( "FLTK::yes",    &fltk::yes );
    export_tag("$yes", "vars");
    magic_ptr_init( "FLTK::no",     &fltk::no );
    export_tag("$no", "vars");
    magic_ptr_init( "FLTK::ok",     &fltk::ok );
    export_tag("$ok", "vars");
    magic_ptr_init( "FLTK::cancel", &fltk::cancel );
    export_tag("$cancel", "vars");

BOOT:
    magic_ptr_init( "FLTK::message_window_timeout",
                    &fltk::message_window_timeout );
    export_tag("$message_window_timeout", "vars");

BOOT:
    magic_ptr_init( "FLTK::message_window_scrollable",
                    &fltk::message_window_scrollable );
    export_tag("$message_window_scrollable", "vars");

#endif // ifndef DISABLE_ASK
