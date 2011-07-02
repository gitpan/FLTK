#include "include/FLTK_pm.h"

MODULE = FLTK::AnsiWidget               PACKAGE = FLTK::AnsiWidget

#ifndef DISABLE_ANSIWIDGET

#include <fltk/AnsiWidget.h>

#include "include/RectangleSubclass.h"

AnsiWidget *
AnsiWidget::new( int x, int y, int w, int h, int defsize )
    CODE:
        RETVAL = new RectangleSubclass<AnsiWidget>(CLASS,x,y,w,h,defsize);
    OUTPUT:
        RETVAL

void
AnsiWidget::layout( )

void
AnsiWidget::clearScreen ( )
    CODE:
        switch ( ix ) {
            case 0: THIS->clearScreen( );
            case 1: THIS->beep( );
        }
    ALIAS:
        beep = 1

void
AnsiWidget::print( const char * str )

void
AnsiWidget::drawLine( int x1, int y1, int x2, int y2 )
    CODE:
        switch( ix ) {
            case 0: THIS->drawLine( x1, y1, x2, y2); break;
            case 1: THIS->drawRectFilled( x1, y1, x2, y2); break;
            case 2: THIS->drawRect( x1, y1, x2, y2); break;
        }
    ALIAS:
        drawRectFilled = 1
        drawRect = 2

void
AnsiWidget::drawImage( fltk::Image * img, int x, int y, int sx, int sy, int w, int h )

void
AnsiWidget::saveImage( char * filename, int x, int y, int w, int h )

void
AnsiWidget::setTextColor( long fore, long back )

void
AnsiWidget::setColor( long color )

int
AnsiWidget::getX ( )
    CODE:
        switch( ix ) {
            case 0: RETVAL = THIS->getX( ); break;
            case 1: RETVAL = THIS->getY( ); break;
            case 2: RETVAL = THIS->getWidth( );  break;
            case 3: RETVAL = THIS->getHeight( ); break;
        }
    OUTPUT:
        RETVAL
    ALIAS:
             getY = 1
         getWidth = 2
        getHeight = 3

void
AnsiWidget::setPixel( int X, int Y, int color )

int
AnsiWidget::getPixel ( int x, int y )

void
AnsiWidget::setXY( int x, int y )

int
AnsiWidget::textWidth( char * string )

int
AnsiWidget::textHeight( )

void
AnsiWidget::setFontSize( double i )

int
AnsiWidget::getFontSize( )

fltk::Color
AnsiWidget::ansiToFltk( long color )

#endif // ifndef DISABLE_ANSIWIDGET

BOOT:
    isa("FLTK::AnsiWidget", "FLTK::Widget");
