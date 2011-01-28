#include "include/FLTK_pm.h"

MODULE = FLTK::Group               PACKAGE = FLTK::Group

#ifndef DISABLE_GROUP

#include <fltk/Group.h>

#include "include/WidgetSubclass.h"

void *
fltk::Group::new( int x, int y, int w, int h, char * label = 0, bool begin = false )
    PPCODE:
        RETVAL = (void *) new WidgetSubclass<fltk::Group>(CLASS,x,y,w,h,label,begin);
        if (RETVAL != NULL) {
            ST(0) = sv_newmortal();
            sv_setref_pv(ST(0), CLASS, RETVAL); /* -- hand rolled -- */
            XSRETURN(1);
        }

int
fltk::Group::children( )

void *
fltk::Group::child( int index )
    PREINIT:
        const char * _class;
    PPCODE:
        if ( index < THIS->children( ) ) {
            RETVAL = (void *) THIS->child( index );
            _class = (( WidgetSubclass<fltk::Widget> * ) RETVAL)->bless_class( );
            if (RETVAL != NULL) {
                ST(0) = sv_newmortal();
                sv_setref_pv(ST(0), (_class?_class:"FLTK::Widget"), RETVAL); /* -- hand rolled -- */
                XSRETURN(1);
            }
        }


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

void *
fltk::Group::add( fltk::Widget * widget )
    PREINIT:
        const char * _class;
    PPCODE:
        THIS->add( widget );
        _class = (( WidgetSubclass<fltk::Widget> * ) widget)->bless_class( );
        if (widget != NULL) {
            ST(0) = sv_newmortal();
            sv_setref_pv(ST(0), (_class?_class:"FLTK::Widget"), widget); /* -- hand rolled -- */
            XSRETURN(1);
        }

void
fltk::Group::insert( fltk::Widget * widget, before )
    CASE: SvIOK( ST(2) )
        int before
        C_ARGS: * widget, before
    POSTCALL:
        const char * _class = (( WidgetSubclass<fltk::Widget> * ) widget)->bless_class( );
        if (widget != NULL) {
            ST(0) = sv_newmortal();
            sv_setref_pv(ST(0), (_class?_class:"FLTK::Widget"), widget); /* -- hand rolled -- */
            XSRETURN(1);
        }
    CASE:
        fltk::Widget * before
        C_ARGS: * widget, before
    POSTCALL:
        const char * _class = (( WidgetSubclass<fltk::Widget> * ) widget)->bless_class( );
        if (widget != NULL) {
            ST(0) = sv_newmortal();
            sv_setref_pv(ST(0), (_class?_class:"FLTK::Widget"), widget); /* -- hand rolled -- */
            XSRETURN(1);
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
            const char * _class = (( WidgetSubclass<fltk::Widget> * ) widget_b)->bless_class( );
            if (widget_b != NULL) {
                ST(0) = sv_newmortal();
                sv_setref_pv(ST(0), (_class?_class:"FLTK::Widget"), widget_b); /* -- hand rolled -- */
                XSRETURN(1);
            }
    CASE:
        fltk::Widget * widget
        C_ARGS: * widget, * widget_b
        POSTCALL:
            const char * _class = (( WidgetSubclass<fltk::Widget> * ) widget_b)->bless_class( );
            if (widget_b != NULL) {
                ST(0) = sv_newmortal();
                sv_setref_pv(ST(0), (_class?_class:"FLTK::Widget"), widget_b); /* -- hand rolled -- */
                XSRETURN(1);
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
