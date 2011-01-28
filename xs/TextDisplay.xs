#include "include/FLTK_pm.h"

MODULE = FLTK::TextDisplay               PACKAGE = FLTK::TextDisplay

#ifndef DISABLE_TEXTDISPLAY

#include <fltk/TextDisplay.h>

#include "include/WidgetSubclass.h"

void
fltk::TextDisplay::new( int x, int y, int w, int h, const char * label = 0 )
    PPCODE:
        void * RETVAL = NULL;
        RETVAL = (void *) new WidgetSubclass<fltk::TextDisplay>(CLASS,x,y,w,h,label);
        if (RETVAL != NULL) {
            ST(0) = sv_newmortal();
            sv_setref_pv(ST(0), CLASS, RETVAL); /* -- hand rolled -- */
            XSRETURN(1);
        }

int
fltk::TextDisplay::size( )

SV *
fltk::TextDisplay::text( char * string = NO_INIT )
    CASE: items == 1
        CODE:
            ST( 0 ) = newSVpv( (char *) THIS->text( ), 0 );
            sv_2mortal( ST( 0 ) );
            XSRETURN( 1 );
    CASE: items == 2
        CODE:
            THIS->text( string );
            XSRETURN_EMPTY;

void
fltk::TextDisplay::static_text( char * string )
    CASE: items == 2
        C_ARGS: string

char
fltk::TextDisplay::at( int index )

fltk::TextBuffer *
fltk::TextDisplay::buffer( fltk::TextBuffer * buffer )
    CASE: items == 2
        CODE:
            THIS->buffer( buffer );
        OUTPUT:
    CASE:
        C_ARGS:
        OUTPUT:
            RETVAL

void
fltk::TextDisplay::append( const char * text )

void
fltk::TextDisplay::insert( const char * text )

void
fltk::TextDisplay::overstrike( const char * text )

int
fltk::TextDisplay::insert_position( int newPos )
    CASE: items == 2
        CODE:
            THIS->insert_position( newPos );
        OUTPUT:
    CASE:
        C_ARGS:

void
fltk::TextDisplay::show_insert_position( )

void
fltk::TextDisplay::show_cursor( bool b = true )

void
fltk::TextDisplay::hide_cursor( )

bool
fltk::TextDisplay::cursor_on( )

void
fltk::TextDisplay::cursor_style( int style )

fltk::Color
fltk::TextDisplay::cursor_color( fltk::Color color = NO_INIT )
    CASE: items == 2
        CODE:
            THIS->cursor_color( color );
        OUTPUT:
    CASE:
        C_ARGS:

int
fltk::TextDisplay::word_start( int pos )

int
fltk::TextDisplay::word_end( int pos )

void
fltk::TextDisplay::next_word( )

void
fltk::TextDisplay::previous_word( )

void
fltk::TextDisplay::wrap_mode( bool wrap, int wrap_margin = 0 )

int
fltk::TextDisplay::linenumber_width( int width = NO_INIT )
    CASE: items == 2
        CODE:
            THIS->linenumber_width( width );
        OUTPUT:
    CASE:
        C_ARGS:

void
fltk::TextDisplay::highlight_data( fltk::TextBuffer * styleBuffer, fltk::TextDisplay::StyleTableEntry * styleTable, int nStyles, char unfinishedStyle, CV * unfinishedHighlightCB, SV * cbArg = NO_INIT)
    CODE:
        HV   * cb    = newHV( );
        hv_store( cb, "coderef",  7, newSVsv( ST( 5 ) ), 0 );
        if ( items == 6 ) /* Timeout callbacks can be called without arguments */
            hv_store( cb, "args", 4, newSVsv( cbArg ),    0 );
        /* for (Timeout* t = first_timeout; t; t = t->next)
            if (t->cb == _cb &&
                av_fetch(*(AV*)t->arg, 0, 0) == newSVsv((SV*)ST(0))
            ) {RETVAL = true; break; }
        }*/
        THIS->highlight_data( styleBuffer, styleTable, nStyles, unfinishedStyle, _cb_u, ( void * ) cb );

bool
fltk::TextDisplay::move_right( )

bool
fltk::TextDisplay::move_left( )

bool
fltk::TextDisplay::move_up( )

bool
fltk::TextDisplay::move_down( )

void
fltk::TextDisplay::redisplay_range( int start, int end )

void
fltk::TextDisplay::scroll( int topLineNum, int horizOffset )

bool
fltk::TextDisplay::in_selection( int X, int Y )

int
fltk::TextDisplay::line_start( int position )

int
fltk::TextDisplay::line_end( int position, bool start_pos_is_line_start = false )

int
fltk::TextDisplay::visible_lines( )

int
fltk::TextDisplay::top_line( )

int
fltk::TextDisplay::hor_offset( )

int
fltk::TextDisplay::find_next_char( int position )

int
fltk::TextDisplay::find_prev_char( int position )

int
fltk::TextDisplay::xy_to_position( int X, int Y, int PosType = fltk::TextDisplay::CHARACTER_POS )

void
fltk::TextDisplay::xy_to_rowcol( int X, int Y, OUTLIST int row, OUTLIST int column, int PosType )

bool
fltk::TextDisplay::position_to_xy( int position, IN_OUTLIST int X, IN_OUTLIST int Y )

int
fltk::TextDisplay::total_lines( )

int
NORMAL_CURSOR ( )
    CODE:
        switch ( ix ) {
            case 0: RETVAL = fltk::TextDisplay::NORMAL_CURSOR; break;
            case 1: RETVAL = fltk::TextDisplay::CARET_CURSOR;  break;
            case 2: RETVAL = fltk::TextDisplay::DIM_CURSOR;    break;
            case 3: RETVAL = fltk::TextDisplay::BLOCK_CURSOR;  break;
            case 4: RETVAL = fltk::TextDisplay::HEAVY_CURSOR;  break;
         }
    OUTPUT:
        RETVAL
    ALIAS:
          CARET_CURSOR = 1
            DIM_CURSOR = 2
          BLOCK_CURSOR = 3
          HEAVY_CURSOR = 4

int
CURSOR_POS ( )
    CODE:
        switch ( ix ) {
            case 0: RETVAL = fltk::TextDisplay::CURSOR_POS;    break;
            case 1: RETVAL = fltk::TextDisplay::CHARACTER_POS; break;
        }
    OUTPUT:
        RETVAL
    ALIAS:
        CHARACTER_POS = 1

int
DRAG_CHAR ( )
    CODE:
        switch ( ix ) {
            case 0: RETVAL = fltk::TextDisplay::DRAG_CHAR; break;
            case 1: RETVAL = fltk::TextDisplay::DRAG_WORD; break;
            case 2: RETVAL = fltk::TextDisplay::DRAG_LINE; break;
        }
    OUTPUT:
        RETVAL
    ALIAS:
        DRAG_WORD = 1
        DRAG_LINE = 2


int
ATTR_NONE ( )
    CODE:
        switch ( ix ) {
            case 0: RETVAL = fltk::TextDisplay::ATTR_NONE;      break;
            case 1: RETVAL = fltk::TextDisplay::ATTR_UNDERLINE; break;
            case 2: RETVAL = fltk::TextDisplay::ATTR_HIDDEN;    break;
        }
    OUTPUT:
        RETVAL
    ALIAS:
        ATTR_UNDERLINE = 1
           ATTR_HIDDEN = 2

#INCLUDE: TextDisplay/StyleTableEntry.xsi

#endif // #ifndef DISABLE_TEXTDISPLAY
