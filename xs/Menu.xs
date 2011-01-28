#include "include/FLTK_pm.h"

MODULE = FLTK::Menu               PACKAGE = FLTK::Menu

#ifndef DISABLE_MENU

#include <fltk/Menu.h>
#include <fltk/Item.h>

#include "include/WidgetSubclass.h"

void
fltk::Menu::new( int x, int y, int w, int h, char * label = 0, bool begin = false )
    PPCODE:
        void * RETVAL = NULL;
        RETVAL = (void *) new WidgetSubclass<fltk::Menu>(CLASS,x,y,w,h,label,begin);
        if (RETVAL != NULL) {
            ST(0) = sv_newmortal();
            sv_setref_pv(ST(0), CLASS, RETVAL); /* -- hand rolled -- */
            XSRETURN(1);
        }

fltk::NamedStyle *
fltk::Menu::default_style( fltk::NamedStyle * style = NO_INIT )
    CASE: items == 1
        CODE:
            RETVAL = THIS->default_style;
        OUTPUT:
            RETVAL
    CASE: items == 2
        CODE:
            THIS->default_style = style;

fltk::List *
fltk::Menu::list( fltk::List * list = NO_INIT )
    CASE: items == 1
        CODE:
            RETVAL = THIS->list();
        OUTPUT:
            RETVAL
    CASE:
        CODE:
            THIS->list( list );

int
fltk::Menu::children( index = NO_INIT, int level  = NO_INIT )
    CASE: items == 1
        C_ARGS:
    CASE: items == 2
        int index
        C_ARGS: index
    CASE: items == 3
        AV * index
        INIT:
            int * indexes;
            for ( int i = 0; i < av_len( index ); i++ )
                indexes[ i ] = SvIV( * av_fetch(index, i, 0));
        C_ARGS: indexes, level

fltk::Widget *
fltk::Menu::child( index = NO_INIT, int level  = NO_INIT )
    CASE: items == 2
        int index
        C_ARGS: index
    CASE: items == 3
        AV * index
        INIT:
            int * indexes;
            for ( int i = 0; i < av_len( index ); i++ )
                indexes[ i ] = SvIV( * av_fetch(index, i, 0));
        C_ARGS: indexes, level

void *
fltk::Menu::item( fltk::Widget * value = NO_INIT )
    PREINIT:
        const char * _class;
    PPCODE:
        if ( items == 1 ) {
            _class = (( WidgetSubclass<fltk::Widget> * ) RETVAL)->bless_class( );
            if (RETVAL != NULL) {
                ST(0) = sv_newmortal( );
                sv_setref_pv(ST(0), _class ? _class : "FLTK::Widget", RETVAL); /* -- hand rolled -- */
                XSRETURN(1);
            }
        }
        else
            THIS->item( value );

bool
fltk::Menu::set_item( AV * index, int level )
    CODE:
        int * indexes;
        for ( int i = 0; i < av_len( index ); i++ )
            indexes[ i ] = SvIV( * av_fetch(index, i, 0));
        RETVAL = THIS->set_item( indexes, level );
    OUTPUT:
        RETVAL

fltk::Widget *
fltk::Menu::get_item( )

int
fltk::Menu::value( int index = NO_INIT )
    CASE: items == 1
        C_ARGS:
    CASE: items == 2
        C_ARGS: index

void
fltk::Menu::layout_in( fltk::Widget * widget, AV * indexes, int level )
    CODE:
        int * _indexes;
        for ( int i = 0; i < av_len( indexes ); i++ )
            _indexes[ i ] = SvIV( * av_fetch(indexes, i, 0));
        THIS->layout_in( widget, _indexes, level );

void
fltk::Menu::draw_in( fltk::Widget * widget, AV * indexes, int level, int selected, int drawn_selected )
    INIT:
        int * _indexes;
        for ( int i = 0; i < av_len( indexes ); i++ )
            _indexes[ i ] = SvIV( * av_fetch(indexes, i, 0));
    C_ARGS: widget, _indexes, level, selected, drawn_selected

int
fltk::Menu::find_selected( fltk::Widget * widget, AV * indexes, int level, int mx, int my )
    INIT:
        int * _indexes;
        for ( int i = 0; i < av_len( indexes ); i++ )
            _indexes[ i ] = SvIV( * av_fetch(indexes, i, 0));
    C_ARGS: widget, _indexes, level, mx, my

fltk::Rectangle
fltk::Menu::get_location( fltk::Widget * widget, AV * indexes, int level, int index )
    INIT:
        int * _indexes;
        for ( int i = 0; i < av_len( indexes ); i++ )
            _indexes[ i ] = SvIV( * av_fetch(indexes, i, 0) );
    C_ARGS: widget, _indexes, level, index

int
fltk::Menu::popup( fltk::Rectangle * rect, char * title = 0, bool menubar = false )
    C_ARGS: * rect, title, menubar

int
fltk::Menu::handle_shortcut( )

void
fltk::Menu::default_callback( fltk::Widget * widget, SV * data )
    C_ARGS: widget, (void *) data

void
fltk::Menu::do_callback( fltk::Widget * widget )

void
fltk::Menu::global( )

fltk::Widget *
fltk::Menu::find( char * label )
    C_ARGS: ( const char * ) label

void
fltk::Menu::remove( widget )
    CASE: SvIOK( ST(1) )
        int widget
    CASE: sv_isobject(ST(1))
        fltk::Widget * widget
    C_ARGS: SvPOK( ST(1) )
        char * widget
        C_ARGS: ( const char * ) widget

fltk::Widget *
fltk::Menu::add( label, shortcut = 0, CV * callback = NO_INIT, SV * data = NO_INIT, int flags = 0 )
    CASE: items == 2 && sv_isobject(ST(1))
        fltk::Widget * label
        CODE:
            THIS->add( label );
    CASE: items == 3
        char * label
        SV * shortcut
        C_ARGS: ( const char * ) label, ( void * ) shortcut
    CASE:
        char * label
        unsigned shortcut
        PREINIT:
            const char * _class;
        INIT:
            HV * cb = newHV( );
            if ( items > 3 )
                hv_store( cb , "coderef",  7, newSVsv( ST(3) ),            0 );
            _class = (( WidgetSubclass<fltk::Item> * ) RETVAL)->bless_class( );
            _class = _class ? _class : "FLTK::Item";
            hv_store( cb , "class",    5, newSVpv( _class, strlen(_class) ), 0 );
            if ( items > 4 )
                hv_store( cb , "args", 4, newSVsv( data ),             0 );
        C_ARGS: ( const char * ) label, shortcut, _cb_w, ( void * ) cb, flags

fltk::Widget *
fltk::Menu::replace( label, shortcut = 0, CV * callback, SV * data = NO_INIT, int flags = 0 )
    CASE: ( ( items == 3 ) && ( sv_isobject(ST(1)) ) && ( sv_isobject(ST(2)) ) )
        int            label
        fltk::Widget * shortcut
        CODE:
            THIS->replace( label, * shortcut );
    CASE: ( ( items == 3 ) && ( sv_isobject(ST(2)) ) )
        fltk::Widget * label
        fltk::Widget * shortcut
        CODE:
            THIS->replace( * label, * shortcut );
    CASE: items <= 3
        char * label
        SV * shortcut
        C_ARGS: ( const char * ) label, ( void * ) shortcut
    CASE:
        char * label
        unsigned shortcut
        PREINIT:
            const char * _class;
        INIT:
            HV * cb = newHV( );
            hv_store( cb , "coderef",  7, newSVsv( ST(3) ),            0 );
            _class = (( WidgetSubclass<fltk::Item> * ) RETVAL)->bless_class( );
            _class = _class ? _class : "FLTK::Item";
            hv_store( cb , "class",    5, newSVpv( _class, strlen(_class) ), 0 );
            if ( items > 4 )
                hv_store( cb , "args", 4, newSVsv( data ),             0 );
        C_ARGS: ( const char * ) label, shortcut, _cb_w, ( void * ) cb, flags

fltk::Widget *
fltk::Menu::insert( index, label, shortcut = 0, CV * callback, SV * data = NO_INIT, int flags = 0 )
    CASE: ( ( items == 3 ) && ( sv_isobject(ST(1)) ) )
        fltk::Widget * index
        int            label
        CODE:
            THIS->insert( * index, label );
    CASE: items < 5
        int    index
        char * label
        SV   * shortcut
        C_ARGS: index, ( const char *) label, ( void * ) shortcut
    CASE:
        int        index
        char     * label
        unsigned   shortcut
        PREINIT:
            const char * _class;
        INIT:
            HV * cb = newHV( );
            hv_store( cb , "coderef",  7, newSVsv( ST(4) ),            0 );
            _class = (( WidgetSubclass<fltk::Item> * ) RETVAL)->bless_class( );
            _class = _class ? _class : "FLTK::Item";
            hv_store( cb , "class",    5, newSVpv( _class, strlen(_class) ), 0 );
            if ( items > 5 )
                hv_store( cb , "args", 4, newSVsv( data ),             0 );
        C_ARGS: index, ( const char * ) label, shortcut, _cb_w, ( void * ) cb, flags

fltk::Group *
fltk::Menu::add_group( char * label, fltk::Group * parent = 0, SV * data = NO_INIT )
    C_ARGS: ( const char * ) label, parent, ( void * ) data

fltk::Widget *
fltk::Menu::add_leaf( char * label, fltk::Group * parent = NO_INIT, SV * data = NO_INIT )
    C_ARGS: ( const char * ) label, parent, ( void * ) data

fltk::Widget *
fltk::Menu::add_many( char * string )
    C_ARGS: ( const char * ) string

#INCLUDE: MenuBar.xsi

#INCLUDE: PopupMenu.xsi

#endif // ifndef DISABLE_MENU

BOOT:
    isa("FLTK::Menu", "FLTK::Group");
