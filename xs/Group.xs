#include "include/FLTK_pm.h"

MODULE = FLTK::Group               PACKAGE = FLTK::Group

#ifndef DISABLE_GROUP

#include <fltk/Group.h>

#include <fltk/Widget.h>

#include "include/RectangleSubclass.h"

fltk::Group *
fltk::Group::new( int x, int y, int w, int h, char * label = 0, bool begin = false )
    CODE:
        RETVAL = new RectangleSubclass<fltk::Group>(CLASS,x,y,w,h,label,begin);
    OUTPUT:
        RETVAL

int
fltk::Group::children( )

fltk::Widget *
fltk::Group::child( int index )
    PREINIT:
        const char * CLASS;
    CODE:
        if ( index < THIS->children( ) ) {
            RETVAL = THIS->child( index );
            CLASS = (( RectangleSubclass<fltk::Widget> * ) RETVAL)->bless_class( );
        }
    OUTPUT:
        RETVAL

void
fltk::Group::begin( )

void
fltk::Group::end( )

fltk::Group *
fltk::Group::current( fltk::Group * group = NO_INIT )
    CASE: items == 1
        C_ARGS:
    CASE: items == 2
        CODE:
            THIS->current( group );

int
fltk::Group::find ( fltk::Widget * widget )

void
fltk::Group::add ( RectangleSubclass<fltk::Widget> * widget )
    PPCODE:
        THIS->add( widget );
        EXTEND(SP, 1); PUSHs(ST(1)); // Do this so we don't have to rebless

void
fltk::Group::insert( fltk::Widget * widget, before )
    CASE: SvIOK( ST(2) )
        int before
        C_ARGS: * widget, before
    POSTCALL:
        if (widget != NULL) {
            EXTEND(SP, 1); PUSHs(ST(1)); // Do this so we don't have to rebless
        }
    CASE:
        fltk::Widget * before
        C_ARGS: * widget, before
    POSTCALL:
        if (widget != NULL) {
            EXTEND(SP, 1); PUSHs(ST(1)); // Do this so we don't have to rebless
        }

void
fltk::Group::remove( widget )
    CASE: SvIOK( ST(1) )
        int widget
    CASE:
        fltk::Widget * widget

void
fltk::Group::remove_all( )

void
fltk::Group::replace( widget, fltk::Widget * widget_b )
    CASE: SvIOK( ST(1) )
        int widget
        C_ARGS:   widget, * widget_b
        POSTCALL:
            if (widget_b != NULL) {
                EXTEND(SP, 1); PUSHs(ST(2)); // Do this so we don't have to rebless
            }
    CASE:
        fltk::Widget * widget
        C_ARGS: * widget, * widget_b
        POSTCALL:
            if (widget_b != NULL) {
                EXTEND(SP, 1); PUSHs(ST(2)); // Do this so we don't have to rebless
            }

void
fltk::Group::swap( int indexA, int indexB )

void
fltk::Group::clear( )

fltk::Widget *
fltk::Group::resizable( fltk::Widget * widget = NO_INIT )
    CASE: items == 1
        C_ARGS:
    CASE:
        CODE:
            THIS->resizable( * widget );

void
fltk::Group::add_resizable( fltk::Widget * widget )
    C_ARGS: * widget

void
fltk::Group::init_sizes( )

int
fltk::Group::focus_index( int index = NO_INIT )
    CASE: items ==  1
        C_ARGS:
    CASE:
        CODE:
            THIS->focus_index( index );

void
fltk::Group::set_focus( fltk::Widget * widget )

int
fltk::Group::navigation_key( )

void
fltk::Group::fix_old_positions(  )

fltk::Flags
fltk::Group::resize_align( fltk::Flags flags = NO_INIT )
    CASE: items == 1
        C_ARGS:
    CASE:
        CODE:
            THIS->resize_align( flags );

#INCLUDE: Menu.xsi

#INCLUDE: PackedGroup.xsi

#INCLUDE: ScrollGroup.xsi

#INCLUDE: TabGroup.xsi

#INCLUDE: TextDisplay.xsi

#INCLUDE: Window.xsi

#endif // ifndef DISABLE_GROUP

BOOT:
    isa("FLTK::Group", "FLTK::Widget");
