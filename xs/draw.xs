#include "include/FLTK_pm.h"

MODULE = FLTK::draw               PACKAGE = FLTK::draw

#ifndef DISABLE_DRAW

#include <fltk/draw.h>

MODULE = FLTK::draw               PACKAGE = FLTK

void
push_matrix( )
    CODE:
        fltk::push_matrix( );

void
pop_matrix( )
    CODE:
        fltk::pop_matrix( );

BOOT:
    export_tag("push_matrix", "gsave");
    export_tag("push_matrix", "draw");
    export_tag("pop_matrix", "gsave");
    export_tag("pop_matrix", "draw");

MODULE = FLTK::draw               PACKAGE = FLTK::draw

MODULE = FLTK::draw               PACKAGE = FLTK

void
scale( float x, float y = NO_INIT )
    CASE: items == 1
        CODE:
            fltk::scale( x );
    CASE: items == 2
        CODE:
            fltk::scale( x, y );

BOOT:
    export_tag("scale", "draw");

MODULE = FLTK::draw               PACKAGE = FLTK::draw

MODULE = FLTK::draw               PACKAGE = FLTK

void
translate ( x, y )
    CASE: SvIOK(ST(0)) && SvIOK(ST(1))
        int x
        int y
        CODE:
            fltk::translate( (int) x, (int) y /* faster than the float version */ );
    CASE: (SvNOK(ST(0)) || SvIOK(ST(0))) && (SvNOK(ST(1)) || SvIOK(ST(1)))
        double x
        double y
        CODE:
            fltk::translate( (float) x, (float) y );
    CASE:
        CODE:
            Perl_croak(aTHX_ "Usage: %s(%s) # %s", "FLTK::translate", "x, y",
                "where 'x' and 'y' are both either floats or integers"
            );

BOOT:
    export_tag("translate", "draw");

MODULE = FLTK::draw               PACKAGE = FLTK::draw

MODULE = FLTK::draw               PACKAGE = FLTK

void
rotate( float d )
    CODE:
        fltk::rotate( d );

BOOT:
    export_tag("rotate", "draw");

MODULE = FLTK::draw               PACKAGE = FLTK::draw

MODULE = FLTK::draw               PACKAGE = FLTK

void
concat( float a, float b, float c, float d, float x, float y )
    CODE:
        fltk::concat( a, b, c, d, x, y );

BOOT:
    export_tag("concat", "draw");

MODULE = FLTK::draw               PACKAGE = FLTK::draw

MODULE = FLTK::draw               PACKAGE = FLTK

void
load_identity( )
    CODE:
        fltk::load_identity( );

BOOT:
    export_tag("load_identity", "draw");

MODULE = FLTK::draw               PACKAGE = FLTK::draw

MODULE = FLTK::draw               PACKAGE = FLTK

void
transform ( x, y, int w = NO_INIT, int h = NO_INIT )
    CASE: (items == 4) && SvIOK(ST(0)) && SvIOK(ST(1))
        int x
        int y
        CODE:
            fltk::transform( x, y );
        OUTPUT:
            x
            y
    CASE: (items == 4) && SvIOK(ST(0)) && SvIOK(ST(1))
        int x
        int y
        CODE:
            fltk::transform( x, y, w, h );
        OUTPUT:
            x
            y
            w
            h
    CASE: (items == 2) && (SvNOK(ST(0)) || SvIOK(ST(0))) && (SvNOK(ST(1)) || SvIOK(ST(1)))
        float x
        float y
        CODE:
            fltk::transform( x, y );
        OUTPUT:
            x
            y
    CASE: items == 2 /* from, to */
        fltk::Rectangle * x
        fltk::Rectangle * y
        CODE:
            fltk::transform( * x, * y );
        OUTPUT:
            y

BOOT:
    export_tag("transform", "draw");

MODULE = FLTK::draw               PACKAGE = FLTK::draw

MODULE = FLTK::draw               PACKAGE = FLTK

void
transform_distance( IN_OUTLIST float x, IN_OUTLIST float y)
    CODE:
        fltk::transform_distance( x, y );
    OUTPUT:
        x
        y

BOOT:
    export_tag("transform_distance", "draw");

MODULE = FLTK::draw               PACKAGE = FLTK::draw

MODULE = FLTK::draw               PACKAGE = FLTK

void
push_clip( x, int y = NO_INIT, int w = NO_INIT, int h = NO_INIT )
    CASE: items == 4 && SvIOK(ST(0))
        int x
        CODE:
            fltk::push_clip( x, y, w, h );
    CASE: items == 1
        fltk::Rectangle * x
        CODE:
            fltk::push_clip( * x );
    CASE:
        CODE:
            Perl_croak(aTHX_ "Usage: %s(%s)", "FLTK::push_clip", "x, [y, w, h]");

BOOT:
    export_tag("push_clip", "draw");

MODULE = FLTK::draw               PACKAGE = FLTK::draw

MODULE = FLTK::draw               PACKAGE = FLTK

void
clipout( fltk::Rectangle * rectangle )
    CODE:
        fltk::clipout( * rectangle );

BOOT:
    export_tag("clipout", "draw");

MODULE = FLTK::draw               PACKAGE = FLTK::draw

MODULE = FLTK::draw               PACKAGE = FLTK

void
pop_clip( )
    CODE:
        fltk::pop_clip( );

void
push_no_clip( )
    CODE:
        fltk::push_no_clip( );

BOOT:
    export_tag("pop_clip", "draw");
    export_tag("push_no_clip", "draw");

MODULE = FLTK::draw               PACKAGE = FLTK::draw

MODULE = FLTK::draw               PACKAGE = FLTK

bool
not_clipped( fltk::Rectangle * rectangle )
    CODE:
        RETVAL = fltk::not_clipped( * rectangle );
    OUTPUT:
        RETVAL

BOOT:
    export_tag("not_clipped", "draw");

MODULE = FLTK::draw               PACKAGE = FLTK::draw

MODULE = FLTK::draw               PACKAGE = FLTK

int
intersect_with_clip( fltk::Rectangle * rectangle )
    CODE:
        RETVAL = fltk::intersect_with_clip( * rectangle );
    OUTPUT:
        RETVAL

BOOT:
    export_tag("intersect_with_clip", "draw");

MODULE = FLTK::draw               PACKAGE = FLTK::draw

MODULE = FLTK::draw               PACKAGE = FLTK

void
setcolor( fltk::Color color )
    CODE:
        fltk::setcolor( color );

void
setbgcolor( fltk::Color color )
    CODE:
        fltk::setbgcolor( color );

BOOT:
    export_tag("setcolor", "draw");
    export_tag("setbgcolor", "draw");

MODULE = FLTK::draw               PACKAGE = FLTK::draw

MODULE = FLTK::draw               PACKAGE = FLTK

void
setcolor_alpha( fltk::Color color, float alpha )
    CODE:
        fltk::setcolor_alpha( color, alpha );

BOOT:
    export_tag("setcolor_alpha", "draw");

MODULE = FLTK::draw               PACKAGE = FLTK::draw

MODULE = FLTK::draw               PACKAGE = FLTK

fltk::Color
getcolor( )
    CODE:
        RETVAL = fltk::getcolor( );
    OUTPUT:
        RETVAL

fltk::Color
getbgcolor( )
    CODE:
        RETVAL = fltk::getbgcolor( );
    OUTPUT:
        RETVAL

BOOT:
    export_tag("getcolor", "draw");
    export_tag("getbgcolor", "draw");

MODULE = FLTK::draw               PACKAGE = FLTK::draw

MODULE = FLTK::draw               PACKAGE = FLTK

fltk::Style *
drawstyle( fltk::Style * style = NO_INIT, fltk::Flags flags = NO_INIT )
    CASE: items == 0
        CODE:
            RETVAL = (fltk::Style *) fltk::drawstyle( );
        OUTPUT:
            RETVAL
    CASE: items == 2
        CODE:
            fltk::drawstyle( style, flags );

BOOT:
    export_tag("drawstyle", "draw");

MODULE = FLTK::draw               PACKAGE = FLTK::draw

MODULE = FLTK::draw               PACKAGE = FLTK

void
setdrawflags( fltk::Flags flags )
    CODE:
        fltk::setdrawflags( flags );

BOOT:
    export_tag("setdrawflags", "draw");

MODULE = FLTK::draw               PACKAGE = FLTK::draw

MODULE = FLTK::draw               PACKAGE = FLTK

fltk::Flags
drawflags( fltk::Flags flags )
    CASE: items == 0
        CODE:
            RETVAL = fltk::drawflags( );
        OUTPUT:
            RETVAL
    CASE:
        CODE:
            RETVAL = fltk::drawflags( flags );

BOOT:
    export_tag("drawflags", "draw");

MODULE = FLTK::draw               PACKAGE = FLTK::draw

MODULE = FLTK::draw               PACKAGE = FLTK

int
line_style( int style = NO_INIT , float width = 0, int dashes = NO_INIT, ...)
    CASE: items == 0
        CODE:
            RETVAL = fltk::line_style( );
        OUTPUT:
            RETVAL
    CASE:
        CODE:
            char c_dashes[items - 2];
            for (int i = 2; i < items; i++ )
                c_dashes[i - 2] = (char) SvIV(ST(i));
            c_dashes[items - 2] = '\0';
            fltk::line_style( style, width, c_dashes );

BOOT:
    export_tag("line_style", "draw");
    register_constant( "SOLID", newSViv( fltk::SOLID ));
    export_tag("SOLID", "draw");
    register_constant( "DASH", newSViv( fltk::DASH ));
    export_tag("DASH", "draw");
    register_constant( "DOT", newSViv( fltk::DOT ));
    export_tag("DOT", "draw");
    register_constant( "DASHDOT", newSViv( fltk::DASHDOT ));
    export_tag("DASHDOT", "draw");
    register_constant( "DASHDOTDOT", newSViv( fltk::DASHDOTDOT ));
    export_tag("DASHDOTDOT", "draw");
    register_constant( "CAP_FLAT", newSViv( fltk::CAP_FLAT ));
    export_tag("CAP_FLAT", "draw");
    register_constant( "CAP_ROUND", newSViv( fltk::CAP_ROUND ));
    export_tag("CAP_ROUND", "draw");
    register_constant( "CAP_SQUARE", newSViv( fltk::CAP_SQUARE ));
    export_tag("CAP_SQUARE", "draw");
    register_constant( "JOIN_MITER", newSViv( fltk::JOIN_MITER ));
    export_tag("JOIN_MITER", "draw");
    register_constant( "JOIN_ROUND", newSViv( fltk::JOIN_ROUND ));
    export_tag("JOIN_ROUND", "draw");
    register_constant( "JOIN_BEVEL", newSViv( fltk::JOIN_BEVEL ));
    export_tag("JOIN_BEVEL", "draw");

MODULE = FLTK::draw               PACKAGE = FLTK::draw

MODULE = FLTK::draw               PACKAGE = FLTK

float
line_width( )
    CODE:
        RETVAL = fltk::line_width( );
    OUTPUT:
        RETVAL

BOOT:
    export_tag("line_width", "draw");

MODULE = FLTK::draw               PACKAGE = FLTK::draw

MODULE = FLTK::draw               PACKAGE = FLTK

AV *
line_dashes( )
    CODE:
        RETVAL = newAV( );
        sv_2mortal((SV*)RETVAL);
        const char * ret = fltk::line_dashes( );
        int i = 0;
        while ( ret[ i ] )
            av_push( RETVAL, newSViv( (int) ret[ i++ ] ) );
    OUTPUT:
        RETVAL

BOOT:
    export_tag("line_dashes", "draw");

MODULE = FLTK::draw               PACKAGE = FLTK::draw

MODULE = FLTK::draw               PACKAGE = FLTK

void
newpath( )
    CODE:
        fltk::newpath( );

BOOT:
    export_tag("newpath", "draw");

MODULE = FLTK::draw               PACKAGE = FLTK::draw

MODULE = FLTK::draw               PACKAGE = FLTK

void
addvertex( x, y )
    CASE: SvIOK(ST(0)) && SvIOK(ST(1))
        int x
        int y
        CODE:
            fltk::addvertex( (int) x, (int) y /* faster than the float version */ );
    CASE: (SvNOK(ST(0)) || SvIOK(ST(0))) && (SvNOK(ST(1)) || SvIOK(ST(1)))
        double x
        double y
        CODE:
            fltk::addvertex( (float) x, (float) y );
    CASE:
        CODE:
            Perl_croak(aTHX_ "Usage: %s(%s) # %s", "FLTK::addvertex", "x, y",
                "where 'x' and 'y' are both either floats or integers"
            );

BOOT:
    export_tag("addvertex", "draw");

MODULE = FLTK::draw               PACKAGE = FLTK::draw

MODULE = FLTK::draw               PACKAGE = FLTK

void
addvertices( AV * xy1, AV * xy2 = NO_INIT, ... )
    CODE:
        float array [items][2];
        int count = 0;
        for ( int i = 0; i < items; i++ ) {
            AV * xy = (AV*) SvRV(ST(i));
            if ( (xy == NULL) || (av_len(xy) != 1 ) )
                continue;
            if (
                    ((SvIOK(*av_fetch( xy, 0, false ))) || (SvNOK(*av_fetch( xy, 0, false )))) &&
                    ((SvIOK(*av_fetch( xy, 1, false ))) || (SvNOK(*av_fetch( xy, 1, false ))))
            ) {
                array[count][0] = SvNV(*av_fetch( xy, 0, false ));
                array[count][1] = SvNV(*av_fetch( xy, 1, false ));
                count++;
            }
        }
        if ( count ) {
            switch( ix ) {
                case 0: fltk::addvertices(count, array); break;
                case 1: fltk::addvertices_transformed(count, array); break;
            }
        }
        /* TODO: I'd like to say... return the number of vertices added or
                 something.*/
    ALIAS:
        addvertices_transformed = 1

BOOT:
    export_tag("addvertices", "draw");
    export_tag("addvertices_transformed", "draw");

MODULE = FLTK::draw               PACKAGE = FLTK::draw

MODULE = FLTK::draw               PACKAGE = FLTK

void
addcurve( float x0, float y0, float x1, float y1, float x2, float y2, float x3, float y3 )
    CODE:
        fltk::addcurve( x0, y0, x1, y1, x2, y2, x3, y3 );

BOOT:
    export_tag("addcurve", "draw");

MODULE = FLTK::draw               PACKAGE = FLTK::draw

MODULE = FLTK::draw               PACKAGE = FLTK

void
addarc( float l, float t, float w, float h, float start, float end )
    CODE:
        fltk::addarc( l, t, w, h, start, end );

BOOT:
    export_tag("addarc", "draw");

MODULE = FLTK::draw               PACKAGE = FLTK::draw

MODULE = FLTK::draw               PACKAGE = FLTK

void
addpie( fltk::Rectangle * rect, float start, float end )
    CODE:
        switch( ix ) {
            case 0:   fltk::addpie( * rect, start, end ); break;
            case 1: fltk::addchord( * rect, start, end ); break;
        }
    ALIAS:
        addchord = 1

BOOT:
    export_tag("addpie", "draw");
    export_tag("addchord", "draw");

MODULE = FLTK::draw               PACKAGE = FLTK::draw

MODULE = FLTK::draw               PACKAGE = FLTK

void
closepath( )
    CODE:
        fltk::closepath( );

void
strokepath( )
    CODE:
        fltk::strokepath( );

void
fillpath( )
    CODE:
        fltk::fillpath( );

BOOT:
    export_tag("closepath", "draw");
    export_tag("strokepath", "draw");
    export_tag("fillpath", "draw");

MODULE = FLTK::draw               PACKAGE = FLTK::draw

MODULE = FLTK::draw               PACKAGE = FLTK

void
fillstrokepath( fltk::Color color )
    CODE:
        fltk::fillstrokepath( color );

BOOT:
    export_tag("fillstrokepath", "draw");

MODULE = FLTK::draw               PACKAGE = FLTK::draw

MODULE = FLTK::draw               PACKAGE = FLTK

void
fillrect( x, int y = NO_INIT, int w = NO_INIT, int h = NO_INIT )
    CASE: items == 1
        fltk::Rectangle * x
        CODE:
            switch( ix ) {
                case 0:   fltk::fillrect( * x ); break;
                case 1: fltk::strokerect( * x ); break;
            }
    CASE: items == 4
        int x
        CODE:
            switch( ix ) {
                case 0:   fltk::fillrect( x, y, w, h ); break;
                case 1: fltk::strokerect( x, y, w, h ); break;
            }
    ALIAS:
        strokerect = 1

BOOT:
    export_tag("fillrect", "draw");
    export_tag("strokerect", "draw");

MODULE = FLTK::draw               PACKAGE = FLTK::draw

MODULE = FLTK::draw               PACKAGE = FLTK

void
drawline( double x0, double y0, double x1, double y1 )
    CODE:
        if ( SvIOK(ST(0)) && SvIOK(ST(1)) && SvIOK(ST(2)) && SvIOK(ST(3)) )
            fltk::drawline( (int) x0, (int) y0, (int) x1, (int) y1 );
        else
            fltk::drawline( (float) x0, (float) y0, (float) x1, (float) y1 );

BOOT:
    export_tag("drawline", "draw");

MODULE = FLTK::draw               PACKAGE = FLTK::draw

MODULE = FLTK::draw               PACKAGE = FLTK

void
drawpoint( double x, double y)
    CODE:
        if ( SvIOK(ST(0)) && SvIOK(ST(1)) )
            fltk::drawpoint( (int) x, (int) y /* faster than the float version? */ );
        else
            fltk::drawpoint( (float) x, (float) y );

BOOT:
    export_tag("drawpoint", "draw");

MODULE = FLTK::draw               PACKAGE = FLTK::draw

MODULE = FLTK::draw               PACKAGE = FLTK

void
setfont( fltk::Font * font, float size )
    CODE:
        fltk::setfont( font, size );

BOOT:
    export_tag("setfont", "draw");

MODULE = FLTK::draw               PACKAGE = FLTK::draw

MODULE = FLTK::draw               PACKAGE = FLTK

fltk::Font *
getfont( )
    CODE:
        RETVAL = fltk::getfont( );
    OUTPUT:
        RETVAL

BOOT:
    export_tag("getfont", "draw");

MODULE = FLTK::draw               PACKAGE = FLTK::draw

MODULE = FLTK::draw               PACKAGE = FLTK

double
getsize( )
    CODE:
        RETVAL = fltk::getsize( );
    OUTPUT:
        RETVAL

BOOT:
    export_tag("getsize", "draw");

MODULE = FLTK::draw               PACKAGE = FLTK::draw

MODULE = FLTK::draw               PACKAGE = FLTK

double
getwidth( char * text, int n = strlen( text ) )
    CODE:
        RETVAL = fltk::getwidth( text, n );
    OUTPUT:
        RETVAL

BOOT:
    export_tag("getwidth", "draw");

MODULE = FLTK::draw               PACKAGE = FLTK::draw

MODULE = FLTK::draw               PACKAGE = FLTK

double
getascent( )
    CODE:
        RETVAL = fltk::getascent( );
    OUTPUT:
        RETVAL

double
getdescent( )
    CODE:
        RETVAL = fltk::getdescent( );
    OUTPUT:
        RETVAL

BOOT:
    export_tag("getascent", "draw");
    export_tag("getdescent", "draw");

MODULE = FLTK::draw               PACKAGE = FLTK::draw

MODULE = FLTK::draw               PACKAGE = FLTK

void
drawtext_transformed( char * text, int n, float x, float y )
    CODE:
        fltk::drawtext_transformed( text, n, x, y );

BOOT:
    export_tag("drawtext_transformed", "draw");

MODULE = FLTK::draw               PACKAGE = FLTK::draw

MODULE = FLTK::draw               PACKAGE = FLTK

void
drawtext( char * text, x, y, int length = NO_INIT )
    CASE: items == 3 && sv_isobject(ST(1)) && sv_derived_from(ST(1), "FLTK::Rectangle")
        fltk::Rectangle * x
        fltk::Flags       y
        CODE:
            fltk::drawtext( text, * x, y );
    CASE: items == 3
        float x
        float y
        CODE:
            fltk::drawtext( text, x, y );
    CASE:
        float x
        float y
        CODE:
            fltk::drawtext( text, length, x, y /* Note order of arguments */ );

BOOT:
    export_tag("drawtext", "draw");

MODULE = FLTK::draw               PACKAGE = FLTK::draw

MODULE = FLTK::draw               PACKAGE = FLTK

void
measure( char * string, OUTLIST int w, OUTLIST int h, fltk::Flags flags = 0 )
    CODE:
        fltk::measure( string, w, h, flags );

BOOT:
    export_tag("measure", "draw");

MODULE = FLTK::draw               PACKAGE = FLTK::draw

MODULE = FLTK::draw               PACKAGE = FLTK

AV *
column_widths( ... )
    CASE: items != 0
        CODE:
            RETVAL = newAV( );
            sv_2mortal((SV*)RETVAL);
            int widths[ items ];
            for ( int i = 0; i < items; i++ )
                widths[ i ] = SvIV( ST( i ) );
            fltk::column_widths( widths );
        OUTPUT:
    CASE:
        CODE:
            RETVAL = newAV( );
            sv_2mortal((SV*)RETVAL);
            const int * ret = fltk::column_widths( );
            int i = 0;
            while ( ret[ i ] )
                av_push( RETVAL, newSViv( ret[ i++ ] ) );
        OUTPUT:
            RETVAL

BOOT:
    export_tag("column_widths", "draw");

MODULE = FLTK::draw               PACKAGE = FLTK::draw

MODULE = FLTK::draw               PACKAGE = FLTK

void
drawimage( uchar * pointer, fltk::PixelType type, fltk::Rectangle * rect, int line_delta = NO_INIT )
    CASE: items == 3
        CODE:
            fltk::drawimage( pointer, type, * rect );
    CASE: items == 4
        CODE:
            fltk::drawimage( pointer, type, * rect, line_delta );

BOOT:
    export_tag("drawimage", "draw");

MODULE = FLTK::draw               PACKAGE = FLTK::draw

MODULE = FLTK::draw               PACKAGE = FLTK

const char *
readimage( uchar * pointer, fltk::PixelType type, fltk::Rectangle * rect, int line_delta = NO_INIT )
    CODE:
        if ( items == 3 )
            RETVAL = ( const char * ) fltk::readimage( pointer, type, * rect );
        else if ( items == 4 )
            RETVAL = ( const char * ) fltk::readimage( pointer, type, * rect, line_delta );
    OUTPUT:
        RETVAL

BOOT:
    export_tag("readimage", "draw");

MODULE = FLTK::draw               PACKAGE = FLTK::draw

MODULE = FLTK::draw               PACKAGE = FLTK

void
scrollrect( fltk::Rectangle * rect, int dx, int dy, CV * code, SV * data )
    CODE:
        croak( "FLTK::scrollrect( ... ) is incomplete" );
        /* TODO: */

BOOT:
    //export_tag("scrollrect", "draw"); /* TODO */

#endif // ifndef DISABLE_DRAW
