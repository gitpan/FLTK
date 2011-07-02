#include "include/FLTK_pm.h"

MODULE = FLTK::Widget               PACKAGE = FLTK::Widget

#ifndef DISABLE_WIDGET

#include <fltk/Widget.h>

#include <fltk/LabelType.h>

#include "include/RectangleSubclass.h"

fltk::Widget *
fltk::Widget::new( int x, int y, int w, int h, const char * label = 0 )
    CODE:
        RETVAL = new RectangleSubclass<fltk::Widget>(CLASS,x,y,w,h,label);
    OUTPUT:
        RETVAL

void
fltk::Widget::destroy( )
    CODE:
        delete THIS;
        sv_setsv(ST(0), &PL_sv_undef);

fltk::Group *
fltk::Widget::parent ( fltk::Group * group = NO_INIT )
    CASE: items == 1
        CODE:
            RETVAL = THIS->parent( );
        OUTPUT:
            RETVAL
    CASE:
        CODE:
            THIS->parent( group );

fltk::Window *
fltk::Widget::window ( )


int
RESERVED_TYPE ( )
    CODE:
        switch( ix ) {
            case 0: RETVAL = fltk::Widget::RESERVED_TYPE; break;
            case 1: RETVAL = fltk::Widget::TOGGLE;        break;
            case 2: RETVAL = fltk::Widget::RADIO;         break;
            case 3: RETVAL = fltk::Widget::GROUP_TYPE;    break;
            case 4: RETVAL = fltk::Widget::WINDOW_TYPE;   break;
        }
    OUTPUT:
        RETVAL
    ALIAS:
             TOGGLE = 1
              RADIO = 2
         GROUP_TYPE = 3
        WINDOW_TYPE = 4

uchar
fltk::Widget::type( uchar value = NO_INIT )
    CASE: items == 1
        CODE:
            RETVAL = THIS->type( );
        OUTPUT:
            RETVAL
    CASE:
        CODE:
            THIS->type( value );

bool
fltk::Widget::is_group( )
    CODE:
        switch( ix ) {
            case 0: RETVAL = THIS->is_group( );  break;
            case 1: RETVAL = THIS->is_window( ); break;
            case 2: RETVAL = THIS->horizontal( ); break;
            case 3: RETVAL = THIS->vertical( );   break;
        }
    OUTPUT:
        RETVAL
    ALIAS:
         is_window = 1
        horizontal = 2
          vertical = 3

bool
fltk::Widget::resize ( int x = NO_INIT, int y = NO_INIT, int w, int h )
    CASE: items == 3
        CODE:
            RETVAL = THIS->resize( x, y, w, h );
    CASE: items == 5
        CODE:
            RETVAL = THIS->resize( w, h );
    OUTPUT:
        RETVAL

bool
fltk::Widget::position ( int x, int y )

void
fltk::Widget::get_absolute_rect( fltk::Rectangle * rect )

const char *
fltk::Widget::label ( char * string = NO_INIT )
    CASE: items == 1
        CODE:
            switch( ix ) {
                case 0: RETVAL = THIS->label( );   break;
                case 1: RETVAL = THIS->tooltip( ); break;
            }
        OUTPUT:
            RETVAL
    CASE:
        CODE:
            switch( ix ) {
                case 0: THIS->label( string );   break;
                case 1: THIS->tooltip( string ); break;
            }
    ALIAS:
        tooltip = 1

void
fltk::Widget::copy_label( char * string )

#include <fltk/Image.h>

const fltk::Symbol *
fltk::Widget::image ( fltk::Image * image = NO_INIT )
    CASE: items == 1
        CODE:
            RETVAL = THIS->image( );
        OUTPUT:
            RETVAL
    CASE:
        CODE:
            THIS->image( image );

unsigned
fltk::Widget::shortcut ( unsigned KEY = NO_INIT )
    CASE: items == 1
        CODE:
            RETVAL = THIS->shortcut( );
        OUTPUT:
            RETVAL
    CASE:
        CODE:
            THIS->shortcut( KEY );

bool
fltk::Widget::add_shortcut ( unsigned key )
    CODE:
        switch( ix ) {
            case 0:    RETVAL = THIS->add_shortcut( key ); break;
            case 1: RETVAL = THIS->remove_shortcut( key ); break;
        }
    OUTPUT:
        RETVAL
    ALIAS:
        remove_shortcut = 1

unsigned
fltk::Widget::label_shortcut ( )

bool
fltk::Widget::test_label_shortcut ( )

bool
fltk::Widget::test_shortcut ( bool test_label = NO_INIT )
    CASE: items == 1
        CODE:
            RETVAL = THIS->test_shortcut( );
        OUTPUT:
            RETVAL
    CASE:
        CODE:
            RETVAL = THIS->test_shortcut( test_label );
        OUTPUT:
            RETVAL

fltk::Callback *
fltk::Widget::callback( callback = NO_INIT, SV * args = NO_INIT )
    CASE: items == 1
        CODE:
            RETVAL = THIS->callback( );
        OUTPUT:
            RETVAL
    CASE: (SvROK( ST( 1 ) ) ) && ( SvTYPE(SvRV(ST(1))) == SVt_PVCV )
        CV * callback
        CODE:
            HV   * stash = SvSTASH( SvRV( ST( 0 ) ) );
            char * CLASS = HvNAME( stash );
            HV   * cb    = newHV( );
            hv_store( cb, "coderef",  7, newSVsv( ST( 1 ) ),                0 );
            hv_store( cb, "class",    5, newSVpv( CLASS, strlen( CLASS ) ), 0 );
            if ( items == 3 )
                hv_store( cb, "args", 4, newSVsv( args ),                   0 );
            THIS->callback(_cb_w, (void *) cb);
    CASE:
        fltk::Callback * callback
        CODE:
            THIS->callback( callback );

SV *
fltk::Widget::user_data ( SV * args = NO_INIT )
    CASE: items == 1
        CODE:
            AV * arr = (AV*)THIS->user_data( ); // XXX - check if arr == NULL
            RETVAL = av_len(arr) == 2 ? *av_fetch(arr, 2, 0) : &PL_sv_undef;
        OUTPUT:
            RETVAL
    CASE:
        CODE:
            AV * arr = newAV( );
            av_push(arr, av_shift((AV*)THIS->user_data()));
            SV * widget = newSVsv((SV*)ST(0));
#ifdef SvWEAKREF // XXX - Do I need to check this here? See FLTK::cb_w()
            //sv_rvweaken(widget);
#else // ifdef SvWEAKREF
            croak("weak references are not implemented in this release of perl");
            XSRETURN_EMPTY;
#endif // ifdef SvWEAKREF
            av_push(arr, widget); // widget
            for (int i = 1; i < items; i++) {
                av_push(arr, newSVsv((SV*)ST(i)));
            }
            THIS->user_data(arr);
    ALIAS:
        argument    = 1


uchar
fltk::Widget::when ( uchar flag = NO_INIT )
    CASE: items == 1
        CODE:
            RETVAL = THIS->when( );
        OUTPUT:
            RETVAL
    CASE:
        CODE:
            THIS->when( flag );

void
fltk::Widget::default_callback( fltk::Widget * w, SV * args = NO_INIT)
    CODE:
        SV * _widget = newSVsv((SV*)ST(1));
#ifdef SvWEAKREF // XXX - Do I need to check this here? See FLTK::cb_w()
        //sv_rvweaken(_widget);
#else // ifdef SvWEAKREF
        croak("weak references are not implemented in this release of perl");
        XSRETURN_EMPTY;
#endif // ifdef SvWEAKREF
        AV  * arr     = newAV( );
        if (THIS->user_data() == NULL) // if THIS has no cb, do nothing
            return;
        SV ** coderef = av_fetch((AV*)THIS->user_data(), 0, 0);
        av_push(arr, newSVsv(*coderef));
        av_push(arr, _widget);
        if ( items == 3 )
            av_push(arr, newSVsv(args));
        THIS->default_callback(w, (void *) arr);

void
fltk::Widget::do_callback( fltk::Widget * widget = NO_INIT, SV * args = NO_INIT )
    CASE: items == 1
        CODE:
            THIS->do_callback( );
    CASE:
        CODE:
            SV * _widget = newSVsv((SV*)ST(1));
#ifdef SvWEAKREF // XXX - Do I need to check this here? See FLTK::cb_w()
            //sv_rvweaken(_widget);
#else // ifdef SvWEAKREF
        croak("weak references are not implemented in this release of perl");
        XSRETURN_EMPTY;
#endif // ifdef SvWEAKREF
            AV  * arr     = newAV( );
            if (THIS->user_data() == NULL) // if THIS has no cb, do nothing
                return;
            SV ** coderef = av_fetch((AV*)THIS->user_data(), 0, 0);
            av_push(arr, newSVsv(*coderef));
            av_push(arr, _widget);
            if ( items == 3 )
                av_push(arr, newSVsv(args));
            THIS->do_callback(widget, (void *) arr);


bool
fltk::Widget::contains ( fltk::Widget * child )
    CODE:
        switch( ix ) {
            case 0: RETVAL = THIS->contains(child); break;
            case 1: RETVAL = THIS->inside(child);   break;
        }
    OUTPUT:
        RETVAL
    ALIAS:
        inside = 1

bool
fltk::Widget::active( )
    CODE:
        switch ( ix ) {
            case  0: RETVAL = THIS->active( );         break;
            case  1: RETVAL = THIS->active_r( );       break;
            case  2: RETVAL = THIS->output( );         break;
            case  3: RETVAL = THIS->visible( );        break;
            case  4: RETVAL = THIS->visible_r( );      break;
            case  5: RETVAL = THIS->takesevents( );    break;
            case  6: RETVAL = THIS->click_to_focus( ); break;
            case  7: RETVAL = THIS->tab_to_focus( );   break;
            case  8: RETVAL = THIS->changed( );        break;
          //case  9: RETVAL = THIS->value( );          break;
            case 10: RETVAL = THIS->selected( );       break;
            case 11: RETVAL = THIS->pushed( );         break;
            case 12: RETVAL = THIS->focused( );        break;
            case 13: RETVAL = THIS->belowmouse( );     break;
            case 15: RETVAL = THIS->clear( );          break;
            case 16: RETVAL = THIS->take_focus( );     break;
        }
    OUTPUT:
        RETVAL
    ALIAS:
              active_r =  1
                output =  2
               visible =  3
             visible_r =  4
           takesevents =  5
        click_to_focus =  6
          tab_to_focus =  7
               changed =  8
                 value =  9
              selected = 10
                pushed = 11
               focused = 12
            belowmouse = 13
                 clear = 15
            take_focus = 16


fltk::Flags
fltk::Widget::flags( fltk::Flags f = NO_INIT )
    CASE: items == 1
        CODE:
            RETVAL = THIS->flags( );
            OUTPUT:
                RETVAL
    CASE:
        CODE:
            THIS->flags( f );

void
fltk::Widget::set_flag( unsigned f, bool b = NO_INIT )
    CASE: items == 2
        CODE:
            THIS->set_flag( f );
    CASE:
        CODE:
            THIS->set_flag( f, b );

void
fltk::Widget::clear_flag( unsigned f )

void
fltk::Widget::invert_flag( unsigned f )

bool
fltk::Widget::flag( unsigned f )
    ALIAS:
        any_of = 1
        all_of = 2
    CODE:
        switch( ix ) {
            case 0: RETVAL = THIS->flag( f ); break;
            case 1: RETVAL = THIS->any_of( f ); break;
            case 2: RETVAL = THIS->all_of( f ); break;
        }
    OUTPUT:
        RETVAL

bool
fltk::Widget::state( bool value = NO_INIT )
    CASE: items == 1
        CODE:
            RETVAL = THIS->state( );
        OUTPUT:
            RETVAL
    CASE:
        CODE:
            THIS->state( value );

fltk::Flags
fltk::Widget::align( unsigned flags = NO_INIT )
    CASE: items == 1
        CODE:
            RETVAL = THIS->align( );
        OUTPUT:
            RETVAL
    CASE:
        CODE:
            THIS->align( flags );

void
fltk::Widget::activate( int b = NO_INIT )
    CASE: items == 1
        CODE:
            THIS->activate( );
    CASE:
        CODE:
            THIS->activate( b );

void
fltk::Widget::set_output( )
    CODE:
        switch( ix ) {
            case  0:           THIS->set_output( ); break;
            case  1:         THIS->clear_output( ); break;
            case  2:          THIS->set_changed( ); break;
            case  3:        THIS->clear_changed( ); break;
            case  4:         THIS->set_selected( ); break;
            case  5:       THIS->clear_selected( ); break;
            case  6:   THIS->set_click_to_focus( ); break;
            case  7: THIS->clear_click_to_focus( ); break;
            case  8:     THIS->set_tab_to_focus( ); break;
            case  9:   THIS->clear_tab_to_focus( ); break;
            case 10:         THIS->set_vertical( ); break;
            case 11:       THIS->set_horizontal( ); break;
            case 12:          THIS->throw_focus( ); break;
            case 13:     THIS->remove_shortcuts( ); break;
            case 14:         THIS->make_current( ); break;
            case 15:      THIS->draw_background( ); break;
            case 16:           THIS->draw_frame( ); break;
        }
    ALIAS:
                clear_output =  1
                 set_changed =  2
               clear_changed =  3
                set_selected =  4
              clear_selected =  5
          set_click_to_focus =  6
        clear_click_to_focus =  7
            set_tab_to_focus =  8
          clear_tab_to_focus =  9
                set_vertical = 10
              set_horizontal = 11
                 throw_focus = 12
            remove_shortcuts = 13
                make_current = 14
             draw_background = 15
                  draw_frame = 16

void
fltk::Widget::redraw( args = NO_INIT )
    CASE: items == 1
        CODE:
            THIS->redraw( );
    CASE: sv_isobject(ST(0))
        fltk::Rectangle * args
        CODE:
            THIS->redraw( * args );
    CASE:
        uchar args
        CODE:
            THIS->redraw( args );

void
fltk::Widget::redraw_label( )
    CODE:
        switch ( ix ) {
            case 0: THIS->redraw_label( );     break;
            case 1: THIS->redraw_highlight( ); break;
        }
    ALIAS:
        redraw_highlight = 1


void
fltk::Widget::draw_box ( fltk::Rectangle * rect = NO_INIT )
    CASE: items == 1
        CODE:
            THIS->draw_box( );
    CASE:
        CODE:
            THIS->draw_box( *rect );

void
fltk::Widget::draw_label ( fltk::Rectangle * ir = NO_INIT, fltk::Flags flags = NO_INIT )
    CASE: items == 1
        CODE:
            THIS->draw_label( );
    CASE: items == 3
        CODE:
            THIS->draw_label( *ir, flags );

void
fltk::Widget::draw_glyph ( int which, fltk::Rectangle * rect )
    C_ARGS: which, * rect

void
fltk::Widget::measure_label( OUTLIST int w, OUTLIST int h )
    C_ARGS: w, h

fltk::Box *
fltk::Widget::box( fltk::Box * box = NO_INIT )
    CASE: items == 1
        CODE:
            switch ( ix ) {
                case 0: RETVAL =       THIS->box( ); break;
                case 1: RETVAL = THIS->buttonbox( ); break;
            }
        OUTPUT:
            RETVAL
    CASE:
        CODE:
            switch( ix ) {
                case 0:       THIS->box( box ); break;
                case 1: THIS->buttonbox( box ); break;
            }
    ALIAS:
        buttonbox = 1

fltk::Symbol *
fltk::Widget::glyph( fltk::Symbol * symbol = NO_INIT )
    CASE: items == 1
        CODE:
            RETVAL = THIS->glyph( );
        OUTPUT:
            RETVAL
    CASE:
        CODE:
            THIS->glyph( symbol );

fltk::Font *
fltk::Widget::labelfont ( fltk::Font * font = NO_INIT )
    CASE: items == 1
        CODE:
            switch ( ix ) {
                case 0: RETVAL = THIS->labelfont( ); break;
                case 1: RETVAL =  THIS->textfont( ); break;
            }
        OUTPUT:
            RETVAL
    CASE:
        CODE:
            switch ( ix ) {
                case 0: THIS->labelfont( font ); break;
                case 1:  THIS->textfont( font ); break;
            }
    ALIAS:
        textfont = 1

fltk::LabelType *
fltk::Widget::labeltype( fltk::LabelType * type = NO_INIT )
    CASE: items == 1
        CODE:
            RETVAL = THIS->labeltype( );
        OUTPUT:
            RETVAL
    CASE:
        CODE:
            THIS->labeltype( type );

fltk::Color
fltk::Widget::color ( fltk::Color color = NO_INIT )
    CASE: items == 1
        CODE:
            switch( ix ) {
                case 0:               RETVAL = THIS->color( ); break;
                case 1:           RETVAL = THIS->textcolor( ); break;
                case 2:     RETVAL = THIS->selection_color( ); break;
                case 3: RETVAL = THIS->selection_textcolor( ); break;
                case 4:         RETVAL = THIS->buttoncolor( ); break;
                case 5:          RETVAL = THIS->labelcolor( ); break;
                case 6:     RETVAL = THIS->highlight_color( ); break;
                case 7: RETVAL = THIS->highlight_textcolor( ); break;
            }
        OUTPUT:
            RETVAL
    CASE:
        CODE:
            switch( ix ) {
                case 0:               THIS->color( color ); break;
                case 1:           THIS->textcolor( color ); break;
                case 2:     THIS->selection_color( color ); break;
                case 3: THIS->selection_textcolor( color ); break;
                case 4:         THIS->buttoncolor( color ); break;
                case 5:          THIS->labelcolor( color ); break;
                case 6:     THIS->highlight_color( color ); break;
                case 7: THIS->highlight_textcolor( color ); break;
            }
    ALIAS:
                  textcolor = 1
            selection_color = 2
        selection_textcolor = 3
                buttoncolor = 4
                 labelcolor = 5
            highlight_color = 6
        highlight_textcolor = 7

float
fltk::Widget::labelsize( float size = NO_INIT )
    CASE: items == 1
        CODE:
            switch ( ix ) {
                case 0: RETVAL = THIS->labelsize( ); break;
                case 1:  RETVAL = THIS->textsize( ); break;
                case 2:   RETVAL = THIS->leading( ); break;
            }
        OUTPUT:
            RETVAL
    CASE:
        CODE:
            switch ( ix ) {
                case 0: THIS->labelsize( size ); break;
                case 1:  THIS->textsize( size ); break;
                case 2:   THIS->leading( size ); break;
             }
    ALIAS:
        textsize = 1
         leading = 2

unsigned char
fltk::Widget::scrollbar_align ( unsigned char value = NO_INIT )
    CASE: items == 1
        CODE:
            switch ( ix ) {
                case 0: RETVAL = THIS->scrollbar_align( ); break;
                case 1: RETVAL = THIS->scrollbar_width( ); break;
            }
        OUTPUT:
            RETVAL
    CASE:
        CODE:
            switch ( ix ) {
                case 0: THIS->scrollbar_align( value ); break;
                case 1: THIS->scrollbar_width( value ); break;
            }
    ALIAS:
        scrollbar_width = 1

#ifndef DISABLE_ASSOCIATIONFUNCTOR

#include <fltk/WidgetAssociation.h>

void
fltk::Widget::add ( fltk::AssociationType ATYPE, SV * DATA = NO_INIT )
    CODE:
        THIS->add( ATYPE, (void *) DATA );

#endif // ifndef DISABLE_ASSOCIATIONFUNCTOR

#ifndef DISABLE_ASSOCIATIONFUNCTOR

bool
fltk::Widget::set ( fltk::AssociationType ATYPE = NO_INIT , SV * DATA = NO_INIT )
    CASE: items == 1
        CODE:
            RETVAL = THIS->set( );
        OUTPUT:
            RETVAL
    CASE: items
            CODE:
                THIS->set( ATYPE, (void *) DATA )

#else  // ifndef DISABLE_ASSOCIATIONFUNCTOR

bool
fltk::Widget::set ( )
    OUTPUT:
        RETVAL

#endif // ifndef DISABLE_ASSOCIATIONFUNCTOR

#ifndef DISABLE_ASSOCIATIONFUNCTOR

SV *
fltk::Widget::get( fltk::AssociationType ATYPE )
    CODE:
        RETVAL = THIS->get( ATYPE );
    OUTPUT:
        RETVAL

SV *
fltk::Widget::foreach( fltk::AssociationType at, fltk::AssociationFunctor fkt )

bool
fltk::Widget::remove( fltk::AssociationType at, SV * data )
    CODE:
        switch( ix ) {
            case 0: RETVAL = THIS->remove(at, (void *) data); break;
            case 1:   RETVAL = THIS->find(at, (void *) data); break;
        }
    OUTPUT:
        RETVAL
    ALIAS:
        find = 1

#endif // ifndef DISABLE_ASSOCIATIONFUNCTOR

    # Leave the documentation in FLTK/Widget.pod but...

BOOT:
    register_constant("WHEN_CHANGED", newSViv( fltk::WHEN_CHANGED ));
    export_tag( "WHEN_CHANGED", "when" );
    register_constant("WHEN_RELEASE", newSViv( fltk::WHEN_RELEASE ));
    export_tag( "WHEN_RELEASE", "when" );
    register_constant("WHEN_RELEASE_ALWAYS", newSViv( fltk::WHEN_RELEASE_ALWAYS ));
    export_tag( "WHEN_RELEASE_ALWAYS", "when" );
    register_constant("WHEN_ENTER_KEY", newSViv( fltk::WHEN_ENTER_KEY ));
    export_tag( "WHEN_ENTER_KEY", "when" );
    register_constant("WHEN_ENTER_KEY_ALWAYS", newSViv( fltk::WHEN_ENTER_KEY_ALWAYS ));
    export_tag( "WHEN_ENTER_KEY_ALWAYS", "when" );
    register_constant("WHEN_ENTER_KEY_CHANGED", newSViv( fltk::WHEN_ENTER_KEY_CHANGED ));
    export_tag( "WHEN_ENTER_KEY_CHANGED", "when" );
    register_constant("WHEN_NOT_CHANGED", newSViv( fltk::WHEN_NOT_CHANGED ));
    export_tag( "WHEN_NOT_CHANGED", "when" );














































void
fltk::Widget::relayout( uchar flags = NO_INIT )
    CASE: items == 1
        CODE:
            THIS->relayout( );
    CASE:
        C_ARGS: flags

uchar
fltk::Widget::layout_damage ( uchar flag = NO_INIT )
    CASE: items == 1
        CODE:
            RETVAL = THIS->layout_damage( );
        OUTPUT:
            RETVAL
    CASE:
        CODE:
            THIS->layout_damage( flag );

#include <fltk/damage.h>

BOOT:
    register_constant("DAMAGE_CHILD", newSViv( fltk::DAMAGE_CHILD ));
    export_tag( "DAMAGE_CHILD", "damage" );
    register_constant("DAMAGE_CHILD_LABEL", newSViv( fltk::DAMAGE_CHILD_LABEL ));
    export_tag( "DAMAGE_CHILD_LABEL", "damage" );
    register_constant("DAMAGE_EXPOSE", newSViv( fltk::DAMAGE_EXPOSE ));
    export_tag( "DAMAGE_EXPOSE", "damage" );
    register_constant("DAMAGE_ALL", newSViv( fltk::DAMAGE_ALL ));
    export_tag( "DAMAGE_ALL", "damage" );
    register_constant("DAMAGE_VALUE", newSViv( fltk::DAMAGE_VALUE ));
    export_tag( "DAMAGE_VALUE", "damage" );
    register_constant("DAMAGE_SCROLL", newSViv( fltk::DAMAGE_SCROLL ));
    export_tag( "DAMAGE_SCROLL", "damage" );
    register_constant("DAMAGE_OVERLAY", newSViv( fltk::DAMAGE_OVERLAY ));
    export_tag( "DAMAGE_OVERLAY", "damage" );
    register_constant("DAMAGE_HIGHLIGHT", newSViv( fltk::DAMAGE_HIGHLIGHT ));
    export_tag( "DAMAGE_HIGHLIGHT", "damage" );
    register_constant("DAMAGE_HIGHLIGHT", newSViv( fltk::DAMAGE_HIGHLIGHT ));
    export_tag( "DAMAGE_HIGHLIGHT", "damage" );
    register_constant("DAMAGE_CONTENTS", newSViv( fltk::DAMAGE_CONTENTS ));
    export_tag( "DAMAGE_CONTENTS", "damage" );

uchar
fltk::Widget::damage( )
    OUTPUT:
        RETVAL

void
fltk::Widget::set_damage( uchar c )

int
fltk::Widget::send( int event )

void
fltk::Widget::add_timeout( float time )
    CODE:
        switch ( ix ) {
            case 0: THIS->add_timeout( time );    break;
            case 1: THIS->repeat_timeout( time ); break;
        }
    ALIAS:
        repeat_timeout = 1

void
fltk::Widget::remove_timeout( )
    CODE:
        switch( ix ) {
            case 0: THIS->remove_timeout( ); break;
            case 2: THIS->deactivate( );      break;
            case 3: THIS->show( );            break;
            case 4: THIS->hide( );            break;
            case 5: THIS->setonly( );         break;
            case 6: THIS->set_visible( );     break;
            case 7: THIS->clear_visible( );   break;
        }
    ALIAS:
           deactivate = 2
                 show = 3
                 hide = 4
              setonly = 5
          set_visible = 6
        clear_visible = 7

bool
fltk::Widget::copy_style( fltk::Style * s )

fltk::NamedStyle *
fltk::Widget::default_style( fltk::NamedStyle * style = NO_INIT )
    CASE: items == 1
        CODE:
            RETVAL = THIS->default_style;
        OUTPUT:
            RETVAL
    CASE: items == 2
        CODE:
            THIS->default_style = style;

#INCLUDE: ccCellBox.xsi

#INCLUDE: ccHueBox.xsi

#INCLUDE: ccValueBox.xsi

#INCLUDE: ClockOutput.xsi

#INCLUDE: Group.xsi

#INCLUDE: ProgressBar.xsi

#INCLUDE: Valuator.xsi

#endif // ifndef DISABLE_WIDGET

BOOT:
    isa( "FLTK::Widget", "FLTK::Rectangle" );
