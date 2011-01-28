#include "include/FLTK_pm.h"

MODULE = FLTK::TextBuffer               PACKAGE = FLTK::TextBuffer

#ifndef DISABLE_TEXTBUFFER

#include <fltk/TextBuffer.h>

#include "include/WidgetSubclass.h"

void
fltk::TextBuffer::new( int requested_size = 0 )
    PPCODE:
        void * RETVAL = NULL;
        RETVAL = (void *) new fltk::TextBuffer( requested_size );
        if (RETVAL != NULL) {
            ST(0) = sv_newmortal();
            sv_setref_pv(ST(0), CLASS, RETVAL); /* -- hand rolled -- */
            XSRETURN(1);
        }

int
fltk::TextBuffer::length( )

const char *
fltk::TextBuffer::text ( const char * txt = NO_INIT )
    CASE: items == 1
        CODE:
            RETVAL = THIS->text( );
        OUTPUT:
            RETVAL
    CASE:
        CODE:
            THIS->text( txt );

char
fltk::TextBuffer::character( int pos )

char *
fltk::TextBuffer::text_range( int start, int end )

char *
fltk::TextBuffer::text_in_rectangle( int start, int end, int rectStart, int rectEnd )

void
fltk::TextBuffer::insert( int pos, const char * text )

void
fltk::TextBuffer::append( const char * text )

void
fltk::TextBuffer::remove( int start, int end )

void
fltk::TextBuffer::replace( int start, int end, const char * text )

void
fltk::TextBuffer::copy( fltk::TextBuffer * from_buffer, int from_start, int from_end, int to_pos )

int
fltk::TextBuffer::undo( OUTLIST int cursorPosition )

void
fltk::TextBuffer::canUndo( char flag = 1 )

int
fltk::TextBuffer::insertfile( const char * file, int position, int bufferlen = 128*1024 )

int
fltk::TextBuffer::appendfile( const char * file, int bufferlen = 128*1024 )

int
fltk::TextBuffer::loadfile( const char * file, int bufferlen = 128*1024 )

int
fltk::TextBuffer::outputfile( const char * file, int start, int end, int bufferlen = 128*1024 )

int
fltk::TextBuffer::savefile( const char * file, int bufferlen = 128*1024 )

SV *
fltk::TextBuffer::expand_character( character, int indent, int tabDist = NO_INIT, char nullSubsChar = NO_INIT )
    CASE: items == 5
        char character
        CODE:
            char * ret;
            warn("Y");
            int len = THIS->expand_character( character, indent, ret, tabDist, nullSubsChar );
            warn("YY | %d | %s", len, ret);
            ST( 0 ) = newSVpv( ret, len );
            warn("YYY");
            sv_2mortal( ST( 0 ) );
            warn("YYYY");
            XSRETURN( 1 );
    CASE:
        int character
        CODE:
            char * ret = 0;
            warn("X");
            int len = THIS->expand_character( character, indent, ret );
            warn("XX | %d | %s", len, ret);
            ST( 0 ) = newSVpv( ret, len );
            warn("XXX");
            sv_2mortal( ST( 0 ) );
            warn("XXXX");
            XSRETURN( 1 );

int
fltk::TextBuffer::character_width( char character, int indent = 0, int tabDist = 8, char nullSubsChar = 0 )

int
fltk::TextBuffer::count_displayed_characters( int lineStartPos, int targetPos )

int
fltk::TextBuffer::count_displayed_characters_utf( int lineStartPos, int targetPos )

int
fltk::TextBuffer::skip_displayed_characters( int startPos, int targetPos )

int
fltk::TextBuffer::skip_displayed_characters_utf( int startPos, int targetPos )

int
fltk::TextBuffer::count_lines( int startPos, int endPos )

int
fltk::TextBuffer::skip_lines( int startPos, int nLines )

int
fltk::TextBuffer::rewind_lines( int startPos, int nLines )

#INCLUDE: TextSelection.xsi

#endif // ifndef DISABLE_TEXTBUFFER
