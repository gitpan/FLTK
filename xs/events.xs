#include "include/FLTK_pm.h"

MODULE = FLTK::events               PACKAGE = FLTK::events

#ifndef DISABLE_EVENTS

#ifdef ENTER
#define PERL_ENTER ENTER
#undef ENTER
#endif // #ifdef ENTER

#ifdef LEAVE
#define PERL_LEAVE LEAVE
#undef LEAVE
#endif // #ifdef LEAVE

#include <fltk/events.h>

#include <fltk/Window.h>

BOOT:
    register_constant( "NO_EVENT", newSViv( fltk::NO_EVENT ));
    export_tag("NO_EVENT", "events");
    register_constant( "PUSH", newSViv( fltk::PUSH ));
    export_tag("PUSH", "events");
    register_constant( "RELEASE", newSViv( fltk::RELEASE ));
    export_tag("RELEASE", "events");
    register_constant( "ENTER", newSViv( fltk::ENTER ));
    export_tag("ENTER", "events");
    register_constant( "LEAVE", newSViv( fltk::LEAVE ));
    export_tag("LEAVE", "events");
    register_constant( "DRAG", newSViv( fltk::DRAG ));
    export_tag("DRAG", "events");
    register_constant( "FOCUS", newSViv( fltk::FOCUS ));
    export_tag("FOCUS", "events");
    register_constant( "UNFOCUS", newSViv( fltk::UNFOCUS ));
    export_tag("UNFOCUS", "events");
    register_constant( "KEY", newSViv( fltk::KEY ));
    export_tag("KEY", "events");
    register_constant( "KEYUP", newSViv( fltk::KEYUP ));
    export_tag("KEYUP", "events");
    register_constant( "FOCUS_CHANGE", newSViv( fltk::FOCUS_CHANGE ));
    export_tag("FOCUS_CHANGE", "events");
    register_constant( "MOVE", newSViv( fltk::MOVE ));
    export_tag("MOVE", "events");
    register_constant( "SHORTCUT", newSViv( fltk::SHORTCUT ));
    export_tag("SHORTCUT", "events");
    register_constant( "DEACTIVATE", newSViv( fltk::DEACTIVATE ));
    export_tag("DEACTIVATE", "events");
    register_constant( "ACTIVATE", newSViv( fltk::ACTIVATE ));
    export_tag("ACTIVATE", "events");
    register_constant( "HIDE", newSViv( fltk::HIDE ));
    export_tag("HIDE", "events");
    register_constant( "SHOW", newSViv( fltk::SHOW ));
    export_tag("SHOW", "events");
    register_constant( "PASTE", newSViv( fltk::PASTE ));
    export_tag("PASTE", "events");
    register_constant( "TIMEOUT", newSViv( fltk::TIMEOUT ));
    export_tag("TIMEOUT", "events");
    register_constant( "MOUSEWHEEL", newSViv( fltk::MOUSEWHEEL ));
    export_tag("MOUSEWHEEL", "events");
    register_constant( "DND_ENTER", newSViv( fltk::DND_ENTER ));
    export_tag("DND_ENTER", "events");
    register_constant( "DND_DRAG", newSViv( fltk::DND_DRAG ));
    export_tag("DND_DRAG", "events");
    register_constant( "DND_LEAVE", newSViv( fltk::DND_LEAVE ));
    export_tag("DND_LEAVE", "events");
    register_constant( "DND_RELEASE", newSViv( fltk::DND_RELEASE ));
    export_tag("DND_RELEASE", "events");
    register_constant( "TOOLTIP", newSViv( fltk::TOOLTIP ));
    export_tag("TOOLTIP", "events");

BOOT:
    register_constant( "LeftButton", newSViv( fltk::LeftButton ));
    export_tag("LeftButton", "events");
    register_constant( "MiddleButton", newSViv( fltk::MiddleButton ));
    export_tag("MiddleButton", "events");
    register_constant( "RightButton", newSViv( fltk::RightButton ));
    export_tag("RightButton", "events");
    register_constant( "SpaceKey", newSViv( fltk::SpaceKey ));
    export_tag("SpaceKey", "events");
    register_constant( "BackSpaceKey", newSViv( fltk::BackSpaceKey ));
    export_tag("BackSpaceKey", "events");
    register_constant( "TabKey", newSViv( fltk::TabKey ));
    export_tag("TabKey", "events");
    register_constant( "ClearKey", newSViv( fltk::ClearKey ));
    export_tag("ClearKey", "events");
    register_constant( "ReturnKey", newSViv( fltk::ReturnKey ));
    export_tag("ReturnKey", "events");
    register_constant( "PauseKey", newSViv( fltk::PauseKey ));
    export_tag("PauseKey", "events");
    register_constant( "ScrollLockKey", newSViv( fltk::ScrollLockKey ));
    export_tag("ScrollLockKey", "events");
    register_constant( "EscapeKey", newSViv( fltk::EscapeKey ));
    export_tag("EscapeKey", "events");
    register_constant( "HomeKey", newSViv( fltk::HomeKey ));
    export_tag("HomeKey", "events");
    register_constant( "LeftKey", newSViv( fltk::LeftKey ));
    export_tag("LeftKey", "events");
    register_constant( "UpKey", newSViv( fltk::UpKey ));
    export_tag("UpKey", "events");
    register_constant( "RightKey", newSViv( fltk::RightKey ));
    export_tag("RightKey", "events");
    register_constant( "DownKey", newSViv( fltk::DownKey ));
    export_tag("DownKey", "events");
    register_constant( "PageUpKey", newSViv( fltk::PageUpKey ));
    export_tag("PageUpKey", "events");
    register_constant( "PageDownKey", newSViv( fltk::PageDownKey ));
    export_tag("PageDownKey", "events");
    register_constant( "EndKey", newSViv( fltk::EndKey ));
    export_tag("EndKey", "events");
    register_constant( "PrintKey", newSViv( fltk::PrintKey ));
    export_tag("PrintKey", "events");
    register_constant( "InsertKey", newSViv( fltk::InsertKey ));
    export_tag("InsertKey", "events");
    register_constant( "MenuKey", newSViv( fltk::MenuKey ));
    export_tag("MenuKey", "events");
    register_constant( "HelpKey", newSViv( fltk::HelpKey ));
    export_tag("HelpKey", "events");
    register_constant( "NumLockKey", newSViv( fltk::NumLockKey ));
    export_tag("NumLockKey", "events");
    register_constant( "Keypad", newSViv( fltk::Keypad ));
    export_tag("Keypad", "events");
    register_constant( "KeypadEnter", newSViv( fltk::KeypadEnter ));
    export_tag("KeypadEnter", "events");
    register_constant( "MultiplyKey", newSViv( fltk::MultiplyKey ));
    export_tag("MultiplyKey", "events");
    register_constant( "AddKey", newSViv( fltk::AddKey ));
    export_tag("AddKey", "events");
    register_constant( "SubtractKey", newSViv( fltk::SubtractKey ));
    export_tag("SubtractKey", "events");
    register_constant( "DecimalKey", newSViv( fltk::DecimalKey ));
    export_tag("DecimalKey", "events");
    register_constant( "DivideKey", newSViv( fltk::DivideKey ));
    export_tag("DivideKey", "events");
    register_constant( "Keypad0", newSViv( fltk::Keypad0 ));
    export_tag("Keypad0", "events");
    register_constant( "Keypad1", newSViv( fltk::Keypad1 ));
    export_tag("Keypad1", "events");
    register_constant( "Keypad2", newSViv( fltk::Keypad2 ));
    export_tag("Keypad2", "events");
    register_constant( "Keypad3", newSViv( fltk::Keypad3 ));
    export_tag("Keypad3", "events");
    register_constant( "Keypad4", newSViv( fltk::Keypad4 ));
    export_tag("Keypad4", "events");
    register_constant( "Keypad5", newSViv( fltk::Keypad5 ));
    export_tag("Keypad5", "events");
    register_constant( "Keypad6", newSViv( fltk::Keypad6 ));
    export_tag("Keypad6", "events");
    register_constant( "Keypad7", newSViv( fltk::Keypad7 ));
    export_tag("Keypad7", "events");
    register_constant( "Keypad8", newSViv( fltk::Keypad8 ));
    export_tag("Keypad8", "events");
    register_constant( "Keypad9", newSViv( fltk::Keypad9 ));
    export_tag("Keypad9", "events");
    register_constant( "KeypadLast", newSViv( fltk::KeypadLast ));
    export_tag("KeypadLast", "events");
    register_constant( "F0Key", newSViv( fltk::F0Key ));
    export_tag("F0Key", "events");
    register_constant( "F1Key", newSViv( fltk::F1Key ));
    export_tag("F1Key", "events");
    register_constant( "F2Key", newSViv( fltk::F2Key ));
    export_tag("F2Key", "events");
    register_constant( "F3Key", newSViv( fltk::F3Key ));
    export_tag("F3Key", "events");
    register_constant( "F4Key", newSViv( fltk::F4Key ));
    export_tag("F4Key", "events");
    register_constant( "F5Key", newSViv( fltk::F5Key ));
    export_tag("F5Key", "events");
    register_constant( "F6Key", newSViv( fltk::F6Key ));
    export_tag("F6Key", "events");
    register_constant( "F7Key", newSViv( fltk::F7Key ));
    export_tag("F7Key", "events");
    register_constant( "F8Key", newSViv( fltk::F8Key ));
    export_tag("F8Key", "events");
    register_constant( "F9Key", newSViv( fltk::F9Key ));
    export_tag("F9Key", "events");
    register_constant( "F10Key", newSViv( fltk::F10Key ));
    export_tag("F10Key", "events");
    register_constant( "F11Key", newSViv( fltk::F11Key ));
    export_tag("F11Key", "events");
    register_constant( "F12Key", newSViv( fltk::F12Key ));
    export_tag("F12Key", "events");
    register_constant( "LastFunctionKey", newSViv( fltk::LastFunctionKey ));
    export_tag("LastFunctionKey", "events");
    register_constant( "LeftShiftKey", newSViv( fltk::LeftShiftKey ));
    export_tag("LeftShiftKey", "events");
    register_constant( "RightShiftKey", newSViv( fltk::RightShiftKey ));
    export_tag("RightShiftKey", "events");
    register_constant( "LeftCtrlKey", newSViv( fltk::LeftCtrlKey ));
    export_tag("LeftCtrlKey", "events");
    register_constant( "RightCtrlKey", newSViv( fltk::RightCtrlKey ));
    export_tag("RightCtrlKey", "events");
    register_constant( "CapsLockKey", newSViv( fltk::CapsLockKey ));
    export_tag("CapsLockKey", "events");
    register_constant( "LeftMetaKey", newSViv( fltk::LeftMetaKey ));
    export_tag("LeftMetaKey", "events");
    register_constant( "RightMetaKey", newSViv( fltk::RightMetaKey ));
    export_tag("RightMetaKey", "events");
    register_constant( "LeftAltKey", newSViv( fltk::LeftAltKey ));
    export_tag("LeftAltKey", "events");
    register_constant( "RightAltKey", newSViv( fltk::RightAltKey ));
    export_tag("RightAltKey", "events");
    register_constant( "DeleteKey", newSViv( fltk::DeleteKey ));
    export_tag("DeleteKey", "events");
    register_constant( "LeftAccKey", newSViv( fltk::LeftAccKey ));
    export_tag("LeftAccKey", "events");
    register_constant( "RightAccKey", newSViv( fltk::RightAccKey ));
    export_tag("RightAccKey", "events");
    register_constant( "LeftCmdKey", newSViv( fltk::LeftCmdKey ));
    export_tag("LeftCmdKey", "events");
    register_constant( "RightCmdKey", newSViv( fltk::RightCmdKey ));
    export_tag("RightCmdKey", "events");

BOOT:
    register_constant( "SHIFT", newSViv( fltk::SHIFT ));
    export_tag("SHIFT", "events");
    register_constant( "CAPSLOCK", newSViv( fltk::CAPSLOCK ));
    export_tag("CAPSLOCK", "events");
    register_constant( "CTRL", newSViv( fltk::CTRL ));
    export_tag("CTRL", "events");
    register_constant( "ALT", newSViv( fltk::ALT ));
    export_tag("ALT", "events");
    register_constant( "NUMLOCK", newSViv( fltk::NUMLOCK ));
    export_tag("NUMLOCK", "events");
    register_constant( "META", newSViv( fltk::META ));
    export_tag("META", "events");
    register_constant( "SCROLLLOCK", newSViv( fltk::SCROLLLOCK ));
    export_tag("SCROLLLOCK", "events");
    register_constant( "BUTTON1", newSViv( fltk::BUTTON1 ));
    export_tag("BUTTON1", "events");
    register_constant( "BUTTON2", newSViv( fltk::BUTTON2 ));
    export_tag("BUTTON2", "events");
    register_constant( "BUTTON3", newSViv( fltk::BUTTON3 ));
    export_tag("BUTTON3", "events");
    register_constant( "ANY_BUTTON", newSViv( fltk::ANY_BUTTON ));
    export_tag("ANY_BUTTON", "events");
    register_constant( "ACCELERATOR", newSViv( fltk::ACCELERATOR ));
    export_tag("ACCELERATOR", "events");
    register_constant( "OPTION", newSViv( fltk::OPTION ));
    export_tag("OPTION", "events");
    register_constant( "COMMAND", newSViv( fltk::COMMAND ));
    export_tag("COMMAND", "events");

MODULE = FLTK::events               PACKAGE = FLTK

unsigned
BUTTON( int number )
    CODE:
        RETVAL = fltk::BUTTON( number );
    OUTPUT:
        RETVAL

BOOT:
    export_tag( "BUTTON", "events" );

MODULE = FLTK::events               PACKAGE = FLTK::events

BOOT:
    register_constant( "DEVICE_MOUSE", newSViv( fltk::DEVICE_MOUSE ));
    export_tag("DEVICE_MOUSE", "events");
    register_constant( "DEVICE_STYLUS", newSViv( fltk::DEVICE_STYLUS ));
    export_tag("DEVICE_STYLUS", "events");
    register_constant( "DEVICE_ERASER", newSViv( fltk::DEVICE_ERASER ));
    export_tag("DEVICE_ERASER", "events");
    register_constant( "DEVICE_CURSOR", newSViv( fltk::DEVICE_CURSOR ));
    export_tag("DEVICE_CURSOR", "events");
    register_constant( "DEVICE_AIRBRUSH", newSViv( fltk::DEVICE_AIRBRUSH ));
    export_tag("DEVICE_AIRBRUSH", "events");
    register_constant( "DEVICE_TOUCH", newSViv( fltk::DEVICE_TOUCH ));
    export_tag("DEVICE_TOUCH", "events");

MODULE = FLTK::events               PACKAGE = FLTK

int
event( )
    CODE:
        switch( ix ) {
            case 0: RETVAL = fltk::event( ); break;
            case 1: RETVAL = fltk::event_x( ); break;
            case 2: RETVAL = fltk::event_y( ); break;
            case 3: RETVAL = fltk::event_dx( ); break;
            case 4: RETVAL = fltk::event_dy( ); break;
            case 5: RETVAL = fltk::event_x_root( ); break;
            case 6: RETVAL = fltk::event_y_root( ); break;
        }
    OUTPUT:
        RETVAL
    ALIAS:
             event_x = 1
             event_y = 2
            event_dx = 3
            event_dy = 4
        event_x_root = 5
        event_y_root = 6

BOOT:
    export_tag("event_y_root", "events");
    export_tag("event_x_root", "events");
    export_tag("event_dy", "events");
    export_tag("event_dx", "events");
    export_tag("event_y", "events");
    export_tag("event_x", "events");
    export_tag("event", "events");

MODULE = FLTK::events               PACKAGE = FLTK::events

MODULE = FLTK::events               PACKAGE = FLTK

int
event_clicks( int i = NO_INIT )
    CASE: items == 0
        CODE:
            RETVAL = fltk::event_clicks( );
        OUTPUT:
            RETVAL
    CASE: items == 1
        CODE:
            fltk::event_clicks( i );

BOOT:
    export_tag("event_clicks", "events");

MODULE = FLTK::events               PACKAGE = FLTK::events

MODULE = FLTK::events               PACKAGE = FLTK

bool
event_is_click( bool value = NO_INIT )
    CASE: items == 0
        CODE:
            RETVAL = fltk::event_is_click( );
        OUTPUT:
            RETVAL
    CASE: items == 1
        CODE:
            fltk::event_is_click( value ); /* Really? Only false works? */

BOOT:
    export_tag("event_is_click", "events");

MODULE = FLTK::events               PACKAGE = FLTK::events

MODULE = FLTK::events               PACKAGE = FLTK

unsigned
event_state( unsigned state = NO_INIT )
    CASE: items == 0
        CODE:
            RETVAL = fltk::event_state( );
        OUTPUT:
            RETVAL
    CASE: items == 1
        CODE:
            RETVAL = (unsigned) fltk::event_state( state );

BOOT:
    export_tag("event_state", "events");

MODULE = FLTK::events               PACKAGE = FLTK::events

MODULE = FLTK::events               PACKAGE = FLTK

unsigned
event_key( )
    CODE:
        RETVAL = fltk::event_key( );
    OUTPUT:
        RETVAL

unsigned
event_button( )
    CODE:
        RETVAL = fltk::event_button( );
    OUTPUT:
        RETVAL

BOOT:
    export_tag("event_key", "events");
    export_tag("event_button", "events");

MODULE = FLTK::events               PACKAGE = FLTK::events

MODULE = FLTK::events               PACKAGE = FLTK

bool
event_key_state( unsigned state )
    CODE:
        RETVAL = fltk::event_key_state( state );
    OUTPUT:
        RETVAL

BOOT:
    export_tag("event_key_state", "events");

MODULE = FLTK::events               PACKAGE = FLTK::events

MODULE = FLTK::events               PACKAGE = FLTK

const char *
event_text( )
    CODE:
        RETVAL = fltk::event_text( );
    OUTPUT:
        RETVAL

BOOT:
    export_tag("event_text", "events");

MODULE = FLTK::events               PACKAGE = FLTK::events

MODULE = FLTK::events               PACKAGE = FLTK

unsigned
event_length( )
    CODE:
        RETVAL = fltk::event_length( );
    OUTPUT:
        RETVAL

unsigned
event_key_repeated( )
    CODE:
        RETVAL = fltk::event_key_repeated( );
    OUTPUT:
        RETVAL

BOOT:
    export_tag("event_length", "events");
    export_tag("event_key_repeated", "events");

MODULE = FLTK::events               PACKAGE = FLTK::events

MODULE = FLTK::events               PACKAGE = FLTK

float
event_pressure( )
    CODE:
        RETVAL = fltk::event_pressure( );
    OUTPUT:
        RETVAL

float
event_x_tilt( )
    CODE:
        RETVAL = fltk::event_x_tilt( );
    OUTPUT:
        RETVAL

float
event_y_tilt( )
    CODE:
        RETVAL = fltk::event_y_tilt( );
    OUTPUT:
        RETVAL

BOOT:
    export_tag("event_pressure", "events");
    export_tag("event_x_tilt", "events");
    export_tag("event_y_tilt", "events");

MODULE = FLTK::events               PACKAGE = FLTK::events

MODULE = FLTK::events               PACKAGE = FLTK

int
event_device( )
    CODE:
        RETVAL = fltk::event_device( );
    OUTPUT:
        RETVAL

BOOT:
    export_tag("event_device", "events");

MODULE = FLTK::events               PACKAGE = FLTK::events

MODULE = FLTK::events               PACKAGE = FLTK

bool
event_inside( fltk::Rectangle * rectangle )
    CODE:
        RETVAL = fltk::event_inside( * rectangle );
    OUTPUT:
        RETVAL

BOOT:
    export_tag("event_inside", "events");

MODULE = FLTK::events               PACKAGE = FLTK::events

MODULE = FLTK::events               PACKAGE = FLTK

bool
compose( IN_OUTLIST int del )
    CODE:
        RETVAL = fltk::compose( del );
    OUTPUT:
        RETVAL

BOOT:
    export_tag("compose", "events");

MODULE = FLTK::events               PACKAGE = FLTK::events

MODULE = FLTK::events               PACKAGE = FLTK

void
compose_reset( )
    CODE:
        fltk::compose_reset( );

BOOT:
    export_tag("compose_reset", "events");

MODULE = FLTK::events               PACKAGE = FLTK::events

MODULE = FLTK::events               PACKAGE = FLTK

bool
try_shortcut( )
    CODE:
        RETVAL = fltk::try_shortcut( );
    OUTPUT:
        RETVAL

BOOT:
    export_tag("try_shortcut", "events");

MODULE = FLTK::events               PACKAGE = FLTK::events

MODULE = FLTK::events               PACKAGE = FLTK

const char *
key_name( unsigned hotkey )
    CODE:
        RETVAL = fltk::key_name( hotkey );
    OUTPUT:
        RETVAL

BOOT:
    export_tag("key_name", "events");

MODULE = FLTK::events               PACKAGE = FLTK::events

MODULE = FLTK::events               PACKAGE = FLTK

unsigned
key( const char * name )
    CODE:
        RETVAL = fltk::key( name );
    OUTPUT:
        RETVAL

BOOT:
    export_tag("key", "events");

MODULE = FLTK::events               PACKAGE = FLTK::events

MODULE = FLTK::events               PACKAGE = FLTK

unsigned
foreachShortcut( fltk::ShortcutFunctor * SF, fltk::Widget * widget = NO_INIT )
    CODE:
        if ( items == 1 )
            RETVAL = fltk::foreachShortcut( * SF );
        else if ( items == 2 )
            RETVAL = fltk::foreachShortcut( widget, * SF );
    OUTPUT:
        RETVAL

BOOT:
    export_tag("foreachShortcut", "events");

MODULE = FLTK::events               PACKAGE = FLTK::events

MODULE = FLTK::events               PACKAGE = FLTK

bool
get_key_state( unsigned key )
    CODE:
        RETVAL = fltk::get_key_state( key );
    OUTPUT:
        RETVAL

BOOT:
    export_tag("get_key_state", "events");

MODULE = FLTK::events               PACKAGE = FLTK::events

MODULE = FLTK::events               PACKAGE = FLTK

AV *
get_mouse( )
    PREINIT:
        int x, y;
    INIT:
        RETVAL = newAV( );
        sv_2mortal((SV*)RETVAL);
    CODE:
        fltk::get_mouse( x, y );
        av_push( RETVAL, newSViv( x ) );
        av_push( RETVAL, newSViv( y ) );
    OUTPUT:
        RETVAL

BOOT:
    export_tag("get_mouse", "events");

MODULE = FLTK::events               PACKAGE = FLTK::events

MODULE = FLTK::events               PACKAGE = FLTK

bool
warp_mouse ( int x, int y )
    CODE:
        RETVAL = fltk::warp_mouse ( x, y );
    OUTPUT:
        RETVAL

BOOT:
    export_tag("warp_mouse", "events");

MODULE = FLTK::events               PACKAGE = FLTK::events

MODULE = FLTK::events               PACKAGE = FLTK

bool
handle( int event, fltk::Window * window )
    CODE:
        RETVAL = fltk::handle( event, (fltk::Window *) window );
    OUTPUT:
        RETVAL

MODULE = FLTK::events               PACKAGE = FLTK::events

MODULE = FLTK::events               PACKAGE = FLTK

fltk::Widget *
belowmouse( fltk::Widget * widget = NO_INIT )
    CASE: items == 0
        CODE:
            RETVAL = fltk::belowmouse( );
        OUTPUT:
            RETVAL
    CASE: items == 1
        CODE:
            fltk::belowmouse( widget );

BOOT:
    export_tag("belowmouse", "events");

MODULE = FLTK::events               PACKAGE = FLTK::events

MODULE = FLTK::events               PACKAGE = FLTK

fltk::Widget *
pushed( fltk::Widget * widget = NO_INIT )
    CASE: items == 0
        CODE:
            RETVAL = fltk::pushed( );
        OUTPUT:
            RETVAL
    CASE: items == 1
        CODE:
            fltk::pushed( widget );

BOOT:
    export_tag("pushed", "events");

MODULE = FLTK::events               PACKAGE = FLTK::events

MODULE = FLTK::events               PACKAGE = FLTK

fltk::Widget *
focus( fltk::Widget * widget = NO_INIT )
    CASE: items == 0
        CODE:
            RETVAL = fltk::focus( );
        OUTPUT:
            RETVAL
    CASE: items == 1
        CODE:
            focus( widget );

BOOT:
    export_tag("focus", "events");

MODULE = FLTK::events               PACKAGE = FLTK::events

MODULE = FLTK::events               PACKAGE = FLTK

void
copy( const char * stuff, int len = strlen(stuff), bool clipboard = false )
    CODE:
        fltk::copy( stuff, len, clipboard );

BOOT:
    export_tag("copy", "events");

MODULE = FLTK::events               PACKAGE = FLTK::events

MODULE = FLTK::events               PACKAGE = FLTK

void
paste( fltk::Widget * reciever, bool clipboard = false )
    CODE:
        fltk::paste( * reciever, clipboard );

BOOT:
    export_tag("paste", "events");

MODULE = FLTK::events               PACKAGE = FLTK::events

MODULE = FLTK::events               PACKAGE = FLTK

bool
dnd( )
    CODE:
        RETVAL = fltk::dnd( );
    OUTPUT:
        RETVAL

BOOT:
    export_tag("dnd", "events");

MODULE = FLTK::events               PACKAGE = FLTK::events

MODULE = FLTK::events               PACKAGE = FLTK

fltk::Widget *
modal( fltk::Widget * widget = NO_INIT, bool grab = false )
    CASE: items == 0
        CODE:
            RETVAL = fltk::modal( );
        OUTPUT:
            RETVAL
    CASE:
        CODE:
            fltk::modal( widget, grab );

BOOT:
    export_tag("modal", "events");

MODULE = FLTK::events               PACKAGE = FLTK::events

MODULE = FLTK::events               PACKAGE = FLTK

bool
grab( )
    CODE:
        RETVAL = fltk::grab( );
    OUTPUT:
        RETVAL

BOOT:
    export_tag("grab", "events");

MODULE = FLTK::events               PACKAGE = FLTK::events

MODULE = FLTK::events               PACKAGE = FLTK

void
exit_modal( )
    CODE:
        fltk::exit_modal( );

BOOT:
    export_tag("exit_modal", "events");

MODULE = FLTK::events               PACKAGE = FLTK::events

MODULE = FLTK::events               PACKAGE = FLTK

bool
exit_modal_flag( )
    CODE:
        RETVAL = fltk::exit_modal_flag( );
    OUTPUT:
        RETVAL

BOOT:
    export_tag("exit_modal_flag", "events");

MODULE = FLTK::events               PACKAGE = FLTK::events

MODULE = FLTK::events               PACKAGE = FLTK

const char *
event_name( int event )
    CODE:
        RETVAL = fltk::event_name( event );
    OUTPUT:
        RETVAL

BOOT:
    export_tag("event_name", "events");

MODULE = FLTK::events               PACKAGE = FLTK::events

#ifdef PERL_ENTER
#define ENTER PERL_ENTER
#endif // #ifdef PERL_ENTER
#ifdef PERL_LEAVE
#define LEAVE PERL_LEAVE
#endif // #ifdef PERL_LEAVE

#endif // ifndef DISABLE_EVENTS
