#include "include/FLTK_pm.h"

MODULE = FLTK::Input               PACKAGE = FLTK::Input

#ifndef DISABLE_INPUT

#ifdef NORMAL // from perl, probably
#define PERL_NORMAL NORMAL
#undef NORMAL
#endif // ifdef NORMAL

#include <fltk/Input.h>

#ifdef PERL_NORMAL // Undo our workaround
#define NORMAL PERL_NORMAL
#endif // ifdef PERL_NORMAL

#include "include/RectangleSubclass.h"

fltk::Input *
fltk::Input::new( int x, int y, int w, int h, char * label = 0 )
    CODE:
        RETVAL = new RectangleSubclass<fltk::Input>(CLASS,x,y,w,h,label);
    OUTPUT:
        RETVAL

SV *
fltk::Input::text( char * string = NO_INIT, int length = NO_INIT )
    CASE: items == 1
        CODE:
            ST( 0 ) = newSVpv( (char *) THIS->text( ), 0 );
            sv_2mortal( ST( 0 ) );
            XSRETURN( 1 );
    CASE: items == 2
        CODE:
            ST( 0 ) = boolSV( THIS->text( string ) );
            sv_2mortal( ST( 0 ) );
            XSRETURN( 1 );
    CASE: items == 3
        CODE:
            ST( 0 ) = boolSV( THIS->text( string, length ) );
            sv_2mortal( ST( 0 ) );
            XSRETURN( 1 );

bool
fltk::Input::static_text( char * string, int length = NO_INIT )
    CASE: items == 2
        C_ARGS: string
    CASE: items == 3
        C_ARGS: string, length

char
fltk::Input::at( int index )

int
fltk::Input::size( )

void
fltk::Input::reserve( int newsize )

int
fltk::Input::position( int new_position = NO_INIT, int new_mark = NO_INIT )
    CASE: items == 1
        C_ARGS:
    CASE: items == 2
        CODE:
            THIS->position( new_position );
            XSRETURN_EMPTY;
    CASE: items == 3
        CODE:
            THIS->position( new_position, new_mark );
            XSRETURN_EMPTY;

int
fltk::Input::mark( int new_mark = NO_INIT )
    CASE: items == 1
        C_ARGS:
    CASE: items == 2
        CODE:
            THIS->mark( new_mark );
            XSRETURN_EMPTY;

void
fltk::Input::up_down_position( int position, bool keepmark )

bool
fltk::Input::replace( int begin, int end, char * text, int length = strlen( text ) )

bool
fltk::Input::cut( int begin = NO_INIT, int end = NO_INIT )
    CASE: items == 1
        C_ARGS:
    CASE: items == 2
        C_ARGS: begin
    CASE: items == 3
        C_ARGS: begin, end

bool
fltk::Input::insert( char * text, int length = strlen( text ) )
    CASE: items == 2
        C_ARGS: text
    CASE: items == 3
        C_ARGS: text, length

bool
fltk::Input::copy( bool to_clipboard = true )

bool
fltk::Input::undo( )

int
fltk::Input::word_start( int position )

int
fltk::Input::word_end( int position )

int
fltk::Input::line_start( int position )

int
fltk::Input::line_end( int position )

int
fltk::Input::mouse_position( fltk::Rectangle * rectangle )
    C_ARGS: * rectangle

int
fltk::Input::xscroll( )

int
fltk::Input::yscroll( )

int
NORMAL( )
    CODE:
        switch ( ix ) {
            case 0: RETVAL = fltk::Input::NORMAL;      break;
            case 1: RETVAL = fltk::Input::FLOAT_INPUT; break;
            case 2: RETVAL = fltk::Input::INT_INPUT;   break;
            case 3: RETVAL = fltk::Input::SECRET;      break;
            case 5: RETVAL = fltk::Input::WORDWRAP;    break;
        }
    OUTPUT:
        RETVAL
    ALIAS:
        FLOAT_INPUT = 1
          INT_INPUT = 2
             SECRET = 3
           WORDWRAP = 5

#INCLUDE: MultiLineInput.xsi

#INCLUDE: NumericInput.xsi

#INCLUDE: Output.xsi

#INCLUDE: SecretInput.xsi

#endif // ifndef DISABLE_INPUT

BOOT:
    isa("FLTK::Input", "FLTK::Widget");
