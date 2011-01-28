#include "include/FLTK_pm.h"

MODULE = FLTK::TabGroup               PACKAGE = FLTK::TabGroup

#ifndef DISABLE_TABGROUP

#include <fltk/TabGroup.h>

#include "include/WidgetSubclass.h"

void
fltk::TabGroup::new( int x, int y, int w, int h, const char * label = 0, bool begin = false )
    PPCODE:
        void * RETVAL = NULL;
        RETVAL = (void *) new WidgetSubclass<fltk::TabGroup>(CLASS,x,y,w,h,label,begin);
        if (RETVAL != NULL) {
            ST(0) = sv_newmortal();
            sv_setref_pv(ST(0), CLASS, RETVAL); /* -- hand rolled -- */
            XSRETURN(1);
        }

fltk::NamedStyle *
fltk::TabGroup::default_style( fltk::NamedStyle * style = NO_INIT )
    CASE: items == 1
        CODE:
            RETVAL = THIS->default_style;
        OUTPUT:
            RETVAL
    CASE: items == 2
        CODE:
            THIS->default_style = style;

int
fltk::TabGroup::value( int newval = NO_INIT )
    CASE: items == 1
        CODE:
            RETVAL = THIS->value( );
        OUTPUT:
            RETVAL
    CASE: items == 2
        CODE:
            RETVAL = THIS->value( newval );

int
fltk::TabGroup::which( int event_x, int event_y )

void
fltk::TabGroup::selected_child( fltk::Widget * newval = NO_INIT )
    PPCODE:
        if ( items == 1 ) {
            void * RETVAL = NULL;
            RETVAL = (void *) THIS->selected_child( );
            if (RETVAL != NULL) {
                ST(0) = sv_newmortal();
                sv_setref_pv(ST(0), "FLTK::Widget", RETVAL); /* -- hand rolled -- */
            }
        }
        else if( items == 2 ) {
            bool RETVAL = THIS->selected_child( newval );
            ST(0) = boolSV(RETVAL);
            sv_2mortal(ST(0));
        }
        XSRETURN(1);

void
fltk::TabGroup::set_draw_outline( bool draw_outline )

fltk::TabGroupPager *
fltk::TabGroup::pager( fltk::TabGroupPager * value = NO_INIT )
    CASE: items == 1
        CODE:
            RETVAL = THIS->pager( );
        OUTPUT:
            RETVAL
    CASE: items == 2
        CODE:
            THIS->pager( value );

void
fltk::TabGroup::default_pager( fltk::TabGroupPager * value )

int
fltk::TabGroup::tab_height( )

AV *
fltk::TabGroup::tab_positions( )
    CODE:
        int children = THIS->children();
        int p[ children - 1 ], w[ children - 1 ], index, i;
        AV * _position = newAV( ); //sv_2mortal((SV*)_position );
        AV * _width    = newAV( ); //sv_2mortal((SV*)_width );
        RETVAL = newAV( ); sv_2mortal((SV*)RETVAL);
        index  = THIS->tab_positions( p, w );
        for ( i = 0; i <= children; i++ ) {
            av_push( _position, newSViv( (int) p[ i ] ) );
            av_push( _width,    newSViv( (int) w[ i ] ) );
        }
        av_push( RETVAL, newSViv( index ) );
        av_push( RETVAL, (SV*) _position );
        av_push( RETVAL, (SV*) _width );
    OUTPUT:
        RETVAL

void
fltk::TabGroup::draw_tab( int x1, int x2, int W, int H, fltk::Widget * o, int sel = 0 )

void
fltk::TabGroup::draw_tab_background( )

#endif // #ifndef DISABLE_TABGROUP

BOOT:
    isa("FLTK::TabGroup", "FLTK::Group");
