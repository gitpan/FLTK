#include "include/FLTK_pm.h"

MODULE = FLTK::ComboBox               PACKAGE = FLTK::ComboBox

#ifndef DISABLE_COMBOBOX

#ifdef NORMAL // from perl, probably
#define PERL_NORMAL NORMAL
#undef NORMAL
#endif // ifdef NORMAL

#include <fltk/ComboBox.h>

#include "include/WidgetSubclass.h"

void
fltk::ComboBox::new( int x, int y, int w, int h, char * label = 0 )
    PPCODE:
        void * RETVAL = NULL;
        RETVAL = (void *) new WidgetSubclass<fltk::ComboBox>(CLASS,x,y,w,h,label);
        if (RETVAL != NULL) {
            ST(0) = sv_newmortal();
            sv_setref_pv(ST(0), CLASS, RETVAL); /* -- hand rolled -- */
            XSRETURN(1);
        }

void
fltk::ComboBox::layout( )

int
fltk::ComboBox::popup( fltk::Rectangle * rect, char * title = 0, bool menubar = false )
    C_ARGS: * rect, title, menubar

int
fltk::ComboBox::choice( int value = NO_INIT )
    CASE: items == 1
        C_ARGS:
    CASE:
        C_ARGS: value

int
fltk::ComboBox::find_choice( )

int
fltk::ComboBox::text( char * string = NO_INIT, int n = NO_INIT )
    PPCODE:
        if ( items == 1 ) {
            const char * RETVAL = THIS->text( );
            XSprePUSH; PUSHi((IV)RETVAL);
        }
        else if ( items == 2 ) {
            bool RETVAL = THIS->text ( string );
            ST(0) = boolSV(RETVAL);
            sv_2mortal(ST(0));
        }
        else if ( items == 3 ) {
            bool RETVAL = THIS->text ( string, n );
            ST(0) = boolSV(RETVAL);
            sv_2mortal(ST(0));
        }
        XSRETURN(1);

bool
fltk::ComboBox::static_text( const char * string, int n = NO_INIT )
    CASE: items == 2
        C_ARGS: string
    CASE: items == 3
        C_ARGS: string, n

char
fltk::ComboBox::at( int index )

int
fltk::ComboBox::size( bool ofText )

int
fltk::ComboBox::position( int p = NO_INIT, int m = NO_INIT )
    CASE: items == 1
        C_ARGS:
    CASE: items == 2
        CODE:
            THIS->position( p );
    CASE: items == 3
        CODE:
            THIS->position( p, m );

int
fltk::ComboBox::mark( int m = NO_INIT )
    CASE: items == 1
        C_ARGS:
    CASE: items == 2
        CODE:
            THIS->mark( m );

void
fltk::ComboBox::up_down_position( int p, bool b )

bool
fltk::ComboBox::replace ( int a, int b, c, int d = NO_INIT )
    CASE: items == 4
        char c;
        C_ARGS: a, b, c
        OUTPUT:
            RETVAL
    CASE: items == 5
        char * c;
        C_ARGS: a, b, ( const char * ) c, d
        OUTPUT:
            RETVAL

bool
fltk::ComboBox::cut( int n = NO_INIT, int b = NO_INIT )
    CASE: items == 1
        C_ARGS:
    CASE: items == 2
        C_ARGS: n
    CASE: items == 3
        C_ARGS: n, b

bool
fltk::ComboBox::insert( const char * text, int l = 0 )

bool
fltk::ComboBox::copy( bool clipboard = true )

bool
fltk::ComboBox::undo( )

int
fltk::ComboBox::word_start( int index )
    CODE:
        switch ( ix ) {
            case 0: RETVAL = THIS->word_start( index ); break;
            case 1: RETVAL = THIS->word_end( index );   break;
            case 2: RETVAL = THIS->line_start( index ); break;
            case 3: RETVAL = THIS->line_end( index );   break;
        }
    OUTPUT:
        RETVAL
    ALIAS:
          word_end = 1
        line_start = 2
          line_end = 3

int
fltk::ComboBox::mouse_position( fltk::Rectangle * rectangle )
    C_ARGS: * rectangle

int
fltk::ComboBox::xscroll( )

int
fltk::ComboBox::yscroll( )

#ifdef WIN32

void
fltk::ComboBox::input_callback_( fltk::Widget * widget, fltk::ComboBox * d )
    C_ARGS: widget, (void *) d

#endif // #ifdef WIN32

#ifdef PERL_NORMAL // Undo our workaround
#define NORMAL PERL_NORMAL
#endif // ifdef PERL_NORMAL

#endif // #ifndef DISABLE_COMBOBOX

BOOT:
    isa("FLTK::ComboBox", "FLTK::Choice");
