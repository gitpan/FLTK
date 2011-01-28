#include "include/FLTK_pm.h"

MODULE = FLTK::Browser               PACKAGE = FLTK::Browser

#ifndef DISABLE_BROWSER

#ifdef NORMAL // from perl, probably
#define PERL_NORMAL NORMAL
#undef NORMAL
#endif // ifdef NORMAL

#include <fltk/Browser.h>

#ifdef PERL_NORMAL // Undo our workaround
#define NORMAL PERL_NORMAL
#endif // ifdef PERL_NORMAL


#include "include/WidgetSubclass.h"

void
fltk::Browser::new( int x, int y, int w, int h, const char * label = 0 )
    PPCODE:
        void * RETVAL = NULL;
        RETVAL = (void *) new WidgetSubclass<fltk::Browser>(CLASS,x,y,w,h,label);
        if (RETVAL != NULL) {
            ST(0) = sv_newmortal();
            sv_setref_pv(ST(0), CLASS, RETVAL); /* -- hand rolled -- */
            XSRETURN(1);
        }

void
fltk::Browser::layout ( )

fltk::NamedStyle *
fltk::Browser::default_style( fltk::NamedStyle * style = NO_INIT )
    CASE: items == 1
        CODE:
            RETVAL = THIS->default_style;
        OUTPUT:
            RETVAL
    CASE: items == 2
        CODE:
            THIS->default_style = style;



int
IS_MULTI ( )
    ALIAS:
        NORMAL             = 1
        MULTI              = 2
        NO_COLUMN_SELECTED = 3
    CODE:
        switch ( ix ) {
            case 0 : RETVAL = fltk::Browser::IS_MULTI;           break;
            case 1 : RETVAL = fltk::Browser::NORMAL;             break;
            case 2 : RETVAL = fltk::Browser::MULTI;              break;
            case 3 : RETVAL = fltk::Browser::NO_COLUMN_SELECTED; break;
        }
    OUTPUT:
        RETVAL

fltk::Browser::linepos
NOSCROLL ( )
    CODE:
        switch ( ix ) {
            case 0 : RETVAL = fltk::Browser::NOSCROLL; break;
            case 1 : RETVAL = fltk::Browser::TOP;      break;
            case 2 : RETVAL = fltk::Browser::MIDDLE;   break;
            case 3 : RETVAL = fltk::Browser::BOTTOM;   break;
        }
    OUTPUT:
        RETVAL
    ALIAS:
           TOP = 1
        MIDDLE = 2
        BOTTOM = 3

int
fltk::Browser::width( )
    CODE:
        switch( ix ) {
            case 0: RETVAL =      THIS->width(); break;
            case 1: RETVAL =     THIS->height(); break;
            case 2: RETVAL =  THIS->box_width(); break;
            case 3: RETVAL = THIS->box_height(); break;
        }
    OUTPUT:
        RETVAL
    ALIAS:
            height = 1
         box_width = 2
        box_height = 3

int
fltk::Browser::xposition( int x = NO_INIT )
    CASE: items == 1
        CODE:
            switch ( ix ) {
                case 0: RETVAL = THIS->xposition(); break;
                case 1: RETVAL = THIS->yposition(); break;
            }
        OUTPUT:
            RETVAL
    CASE:
        CODE:
            switch ( ix ) {
                case 0: THIS->xposition( x ); break;
                case 1: THIS->yposition( x ); break;
            }
    ALIAS:
        yposition = 1

bool
fltk::Browser::indented( bool value = NO_INIT )
    CASE: items == 1
        CODE:
            RETVAL = THIS->indented( );
        OUTPUT:
            RETVAL
    CASE:
        CODE:
            THIS->indented( value );

fltk::Scrollbar *
fltk::Browser::scrollbar ( )
    CODE:
        switch ( ix ) {
            case 0: RETVAL = &(THIS->scrollbar);  break;
            case 1: RETVAL = &(THIS->hscrollbar); break;
        }
    OUTPUT:
        RETVAL
    ALIAS:
        hscrollbar = 1

fltk::Widget *
fltk::Browser::goto_top( )
    CODE:
        switch ( ix ) {
            case 0: RETVAL = THIS->goto_top(); break;
            case 1: RETVAL = THIS->goto_focus(); break;
            case 2: RETVAL = THIS->next(); break;
            case 3: RETVAL = THIS->next_visible(); break;
            case 4: RETVAL = THIS->previous_visible(); break;
        }
    OUTPUT:
        RETVAL
    ALIAS:
              goto_focus = 1
                    next = 2
            next_visible = 3
        previous_visible = 4

fltk::Widget *
fltk::Browser::goto_position( int y )
    CODE:
        THIS->goto_position( y );
    OUTPUT:
        RETVAL

fltk::Widget *
fltk::Browser::goto_index( int index, int level = NO_INIT, int deep = -1, int deeper = -1, int deepest = -1 )
    CASE: items == 2
        CODE:
            RETVAL = THIS->goto_index( index );
        OUTPUT:
            RETVAL
    CASE: items == 3
        CODE:
            RETVAL = THIS->goto_index( index, level );
        OUTPUT:
            RETVAL
    CASE:
        CODE:
            RETVAL = THIS->goto_index( index, level, deep, deeper, deepest );
        OUTPUT:
            RETVAL

fltk::Widget *
fltk::Browser::goto_mark( fltk::Browser::Mark * mark )
    CODE:
        RETVAL = THIS->goto_mark( * mark );
    OUTPUT:
        RETVAL

bool
fltk::Browser::at_mark ( fltk::Browser::Mark * mark )
    CODE:
        RETVAL = THIS->at_mark( * mark );
    OUTPUT:
        RETVAL

int
fltk::Browser::compare_to_mark( fltk::Browser::Mark * mark )
    CODE:
        RETVAL = THIS->compare_to_mark( * mark );
    OUTPUT:
        RETVAL

bool
fltk::Browser::item_is_visible()
    CODE:
        switch ( ix ) {
            case 0: RETVAL = THIS->item_is_visible(); break;
            case 1: RETVAL = THIS->item_is_parent();  break;
            case 2: RETVAL = THIS->item_is_open();    break;
            case 3: RETVAL = THIS->set_focus();       break;
        }
    OUTPUT:
        RETVAL
    ALIAS:
        item_is_parent = 1
          item_is_open = 2
             set_focus = 3

int
fltk::Browser::item_h( )
    CODE:
        switch ( ix ) {
            case 0: RETVAL = THIS->item_h(); break;
        }
    OUTPUT:
        RETVAL
    ALIAS:

void
fltk::Browser::set_mark( fltk::Browser::Mark * destination )
    CODE:
        switch ( ix ) {
            case 0: THIS->set_mark( * destination ); break;
            case 1: THIS->set_mark_to_focus( * destination ); break;
        }
    ALIAS:
        set_mark_to_focus = 1

bool
fltk::Browser::select( item, value, int do_callback = 0 )
    CASE: sv_isobject(ST(1)) /* Hopefully, it's FLTK::Widget based */
        fltk::Widget * item;
        int value;
        CODE:
            RETVAL = THIS->select( item, value, do_callback );
    CASE:
        int item
        bool value = true;
        CODE:
            RETVAL = THIS->select( item, value );

bool
fltk::Browser::set_item_selected( bool value = true, int do_callback = 0 )

bool
fltk::Browser::select_only_this( int do_callback = 0 )
    CODE:
        switch( ix ) {
            case 0: RETVAL = THIS->select_only_this( do_callback ); break;
            case 1: RETVAL = THIS->deselect( do_callback ); break;
        }
    OUTPUT:
        RETVAL
    ALIAS:
        deselect = 1

bool
fltk::Browser::make_item_visible( fltk::Browser::linepos where )

void
fltk::Browser::damage_item ( fltk::Browser::Mark * mark = NO_INIT )
    CASE: items == 1
        CODE:
            THIS->damage_item( );
    CASE:
        CODE:
            THIS->damage_item( * mark );

bool
fltk::Browser::set_item_opened ( bool value )
    CODE:
        switch ( ix ) {
            case 0: RETVAL = THIS->set_item_opened( value );
            case 1: RETVAL = THIS->set_item_visible( value );
        }
    OUTPUT:
        RETVAL
    ALIAS:
        set_item_visible = 1

int
fltk::Browser::current_level ( )
    CODE:
        switch ( ix ) {
            case 0: RETVAL = THIS->current_level( );    break;
            case 1: RETVAL = THIS->current_position( ); break;
            case 2: RETVAL = THIS->focus_level( );      break;
            case 3: RETVAL = THIS->focus_position( );   break;
            case 4: RETVAL = THIS->selected_column( );  break;
            case 5: RETVAL = THIS->nheader( );          break;
        }
    OUTPUT:
        RETVAL
    ALIAS:
        current_position = 1
             focus_level = 2
          focus_positoin = 3
         selected_column = 4
                 nheader = 5

AV *
fltk::Browser::current_index ( )
    CODE:
        RETVAL = newAV( );
        sv_2mortal((SV*)RETVAL);
        const int * ret;
        switch( ix ) {
            case 0: ret = THIS->current_index( ); break;
            case 1: ret = THIS->focus_index( );   break;
        }
        int i = 0;
        while ( ret[ i ] )
            av_push( RETVAL, newSViv( ret[ i++ ] ) );
    OUTPUT:
        RETVAL
    ALIAS:
        focus_index = 1

AV *
fltk::Browser::column_widths ( int col1 = NO_INIT, ... )
    CASE: items == 1
        CODE:
            RETVAL = newAV( );
            sv_2mortal((SV*)RETVAL);
            const int * ret = THIS->column_widths( );
            int i = 0;
            if ( ret )
                while ( ret[ i ] )
                    av_push( RETVAL, newSViv( ret[ i++ ] ) );
        OUTPUT:
            RETVAL
    CASE:
        CODE:
            int args[ items - 1 ];
            for ( int n = 1; n < items; n++ )
                args[ n - 1 ] = (int) SvIV( ST( n ) );
            args[ items - 1 ] = 0;
            THIS->column_widths( args );

AV *
fltk::Browser::column_labels ( char * col1 = NO_INIT, ... )
    CASE: items == 1
        CODE:
            RETVAL = newAV( );
            sv_2mortal((SV*)RETVAL);
            const char ** ret = THIS->column_labels( );
            int i = 0;
            if ( ret )
                while ( ret[ i ] )
                    av_push( RETVAL, newSVpv( ret[ i++ ], 0 ) );
        OUTPUT:
            RETVAL
    CASE: items > 1
        CODE:
            char ** labels = new char * [ items - 1 ];
            for ( int n = 0; n < items - 1; n++ )
                labels[ n ] = (char *) SvPV_nolen( ST( n + 1 ) );
            labels[items - 1] = 0;
            THIS->column_labels( (const char **) labels );

int
fltk::Browser::set_column_start ( int column, int x )

fltk::Widget *
fltk::Browser::header( int column )

int
fltk::Browser::value( int val = NO_INIT )
    CASE: items == 1
        CODE:
            RETVAL = THIS->value( );
        OUTPUT:
            RETVAL
    CASE:
        CODE:
            THIS->value( val );

bool
fltk::Browser::selected( int line )

int
fltk::Browser::topline( int line = NO_INIT )
    CASE: items == 1
        CODE:
            RETVAL = THIS->topline( );
        OUTPUT:
            RETVAL
    CASE:
        CODE:
            THIS->topline( line );

void
fltk::Browser::bottomline ( int line )
    CODE:
        switch( ix ) {
            case 0: THIS->bottomline ( line ); break;
            case 1: THIS->middleline ( line ); break;
        }
    ALIAS:
        middleline = 1

bool
fltk::Browser::displayed( int line )

bool
fltk::Browser::display( int line, bool value = true )

bool
fltk::Browser::display_lines ( bool display = NO_INIT )
    CASE: items == 1
        CODE:
            RETVAL = THIS->display_lines( );
        OUTPUT:
            RETVAL
    CASE:
        CODE:
            THIS->display_lines( display );

int
fltk::Browser::load( char * filename )

int
fltk::Browser::multi( )

fltk::Symbol *
fltk::Browser::leaf_symbol( fltk::Symbol * symbol = NO_INIT )
    CASE: items == 1
        CODE:
            switch ( ix ) {
                case 0: RETVAL = (fltk::Symbol *) THIS->leaf_symbol( );  break;
                case 1: RETVAL = (fltk::Symbol *) THIS->group_symbol( ); break;
            }
        OUTPUT:
            RETVAL
    CASE:
        CODE:
            switch ( ix ) {
                case 0: THIS->leaf_symbol( symbol );  break;
                case 1: THIS->group_symbol( symbol ); break;
            }
    ALIAS:
        group_symbol = 1

#INCLUDE: Browser/Mark.xsi

#INCLUDE: MultiBrowser.xsi

#endif // ifndef DISABLE_BROWSER

BOOT:
    isa("FLTK::Browser", "FLTK::Menu");
