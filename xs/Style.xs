#include "include/FLTK_pm.h"

MODULE = FLTK::Style               PACKAGE = FLTK::Style

#ifndef DISABLE_STYLE

#include <fltk/Style.h>

#include <fltk/LabelType.h>

#include <fltk/Symbol.h>

fltk::Style *
fltk::Style::new( )

MODULE = FLTK::Style               PACKAGE = FLTK

#if 0 // These are also defined in Box.xs

fltk::Box *
UP_BOX ( )
    CODE:
        switch ( ix ) {
            case  0: RETVAL =             fltk::UP_BOX; break;
            case  1: RETVAL =           fltk::DOWN_BOX; break;
            case  2: RETVAL =        fltk::THIN_UP_BOX; break;
            case  3: RETVAL =      fltk::THIN_DOWN_BOX; break;
            case  4: RETVAL =       fltk::ENGRAVED_BOX; break;
            case  5: RETVAL =       fltk::EMBOSSED_BOX; break;
            case  6: RETVAL =         fltk::BORDER_BOX; break;
            case  7: RETVAL =           fltk::FLAT_BOX; break;
            case  8: RETVAL =   fltk::HIGHLIGHT_UP_BOX; break;
            case  9: RETVAL = fltk::HIGHLIGHT_DOWN_BOX; break;
            case 10: RETVAL =       fltk::ROUND_UP_BOX; break;
            case 11: RETVAL =     fltk::ROUND_DOWN_BOX; break;
            case 12: RETVAL =     fltk::DIAMOND_UP_BOX; break;
            case 13: RETVAL =   fltk::DIAMOND_DOWN_BOX; break;
            case 14: RETVAL =         fltk::SHADOW_BOX; break;
            case 15: RETVAL =        fltk::ROUNDED_BOX; break;
            case 16: RETVAL =        fltk::RSHADOW_BOX; break;
            case 17: RETVAL =          fltk::RFLAT_BOX; break;
            case 18: RETVAL =           fltk::OVAL_BOX; break;
            case 19: RETVAL =        fltk::OSHADOW_BOX; break;
            case 20: RETVAL =          fltk::OFLAT_BOX; break;
            case 21: RETVAL =       fltk::BORDER_FRAME; break;
            case 22: RETVAL =     fltk::PLASTIC_UP_BOX; break;
            case 23: RETVAL =   fltk::PLASTIC_DOWN_BOX; break;
        }
    OUTPUT:
        RETVAL
    ALIAS:
                  DOWN_BOX = 1
               THIN_UP_BOX = 2
             THIN_DOWN_BOX = 3
              ENGRAVED_BOX = 4
              EMBOSSED_BOX = 5
                BORDER_BOX = 6
                  FLAT_BOX = 7
          HIGHLIGHT_UP_BOX = 8
        HIGHLIGHT_DOWN_BOX = 9
              ROUND_UP_BOX = 10
            ROUND_DOWN_BOX = 11
            DIAMOND_UP_BOX = 12
          DIAMOND_DOWN_BOX = 13
                SHADOW_BOX = 14
               ROUNDED_BOX = 15
               RSHADOW_BOX = 16
                 RFLAT_BOX = 17
                  OVAL_BOX = 18
               OSHADOW_BOX = 19
                 OFLAT_BOX = 20
              BORDER_FRAME = 21
            PLASTIC_UP_BOX = 22
          PLASTIC_DOWN_BOX = 23

#endif // #if 0 // These are also defined in Box.xs

BOOT:
    export_tag("PLASTIC_DOWN_BOX","box" );
    export_tag("PLASTIC_UP_BOX","box" );
    export_tag("BORDER_FRAME","box" );
    export_tag("OFLAT_BOX","box" );
    export_tag("OSHADOW_BOX","box" );
    export_tag("OVAL_BOX","box" );
    export_tag("RFLAT_BOX","box" );
    export_tag("RSHADOW_BOX","box" );
    export_tag("ROUNDED_BOX","box" );
    export_tag("SHADOW_BOX","box" );
    export_tag("DIAMOND_DOWN_BOX","box" );
    export_tag("DIAMOND_UP_BOX","box" );
    export_tag("ROUND_DOWN_BOX","box" );
    export_tag("ROUND_UP_BOX","box" );
    export_tag("HIGHLIGHT_DOWN_BOX","box" );
    export_tag("HIGHLIGHT_UP_BOX","box" );
    export_tag("FLAT_BOX","box" );
    export_tag("BORDER_BOX","box" );
    export_tag("EMBOSSED_BOX","box" );
    export_tag("ENGRAVED_BOX","box" );
    export_tag("THIN_DOWN_BOX","box" );
    export_tag("THIN_UP_BOX","box" );
    export_tag("DOWN_BOX","box" );
    export_tag("BOX_UP","box" );

MODULE = FLTK::Style               PACKAGE = FLTK::Style

MODULE = FLTK::Style               PACKAGE = FLTK

fltk::Font *
HELVETICA ( )
    CODE:
        switch ( ix ) {
            case  0: RETVAL = fltk::HELVETICA;             break;
            case  1: RETVAL = fltk::HELVETICA_BOLD;        break;
            case  2: RETVAL = fltk::HELVETICA_ITALIC;      break;
            case  3: RETVAL = fltk::HELVETICA_BOLD_ITALIC; break;
            case  4: RETVAL = fltk::COURIER;               break;
            case  5: RETVAL = fltk::COURIER_BOLD;          break;
            case  6: RETVAL = fltk::COURIER_ITALIC;        break;
            case  7: RETVAL = fltk::COURIER_BOLD_ITALIC;   break;
            case  8: RETVAL = fltk::TIMES;                 break;
            case  9: RETVAL = fltk::TIMES_BOLD;            break;
            case 10: RETVAL = fltk::TIMES_ITALIC;          break;
            case 11: RETVAL = fltk::TIMES_BOLD_ITALIC;     break;
            case 12: RETVAL = fltk::SYMBOL_FONT;           break;
            case 13: RETVAL = fltk::SCREEN_FONT;           break;
            case 14: RETVAL = fltk::SCREEN_BOLD_FONT;      break;
            case 15: RETVAL = fltk::ZAPF_DINGBATS;         break;
        }
    OUTPUT:
        RETVAL
    ALIAS:
               HELVETICA_BOLD = 1
             HELVETICA_ITALIC = 2
        HELVETICA_BOLD_ITALIC = 3
                      COURIER = 4
                 COURIER_BOLD = 5
               COURIER_ITALIC = 6
          COURIER_BOLD_ITALIC = 7
                        TIMES = 8
                   TIMES_BOLD = 9
                 TIMES_ITALIC = 10
            TIMES_BOLD_ITALIC = 11
                  SYMBOL_FONT = 12
                  SCREEN_FONT = 13
             SCREEN_BOLD_FONT = 14
                ZAPF_DINGBATS = 15

BOOT:
    export_tag( "HELVETICA", "font" );
    export_tag( "HELVETICA_BOLD", "font" );
    export_tag( "HELVETICA_ITALIC", "font" );
    export_tag( "HELVETICA_BOLD_ITALIC", "font" );
    export_tag( "COURIER", "font" );
    export_tag( "COURIER_BOLD", "font" );
    export_tag( "COURIER_ITALIC", "font" );
    export_tag( "COURIER_BOLD_ITALIC", "font" );
    export_tag( "TIMES", "font" );
    export_tag( "TIMES_BOLD", "font" );
    export_tag( "TIMES_ITALIC", "font" );
    export_tag( "TIMES_BOLD_ITALIC", "font" );
    export_tag( "SYMBOL_FONT", "font" );
    export_tag( "SCREEN_FONT", "font" );
    export_tag( "SCREEN_BOLD_FONT", "font" );
    export_tag( "ZAPF_DINGBATS", "font" );

MODULE = FLTK::Style               PACKAGE = FLTK::Style

MODULE = FLTK::Style               PACKAGE = FLTK

fltk::LabelType *
NO_LABEL ( )
    CODE:
        switch ( ix ) {
            case 0: RETVAL = fltk::NO_LABEL;       break;
            case 1: RETVAL = fltk::NORMAL_LABEL;   break;
            case 2: RETVAL = fltk::SYMBOL_LABEL;   break; // same as NORMAL_LABEL
            case 3: RETVAL = fltk::SHADOW_LABEL;   break;
            case 4: RETVAL = fltk::ENGRAVED_LABEL; break;
            case 5: RETVAL = fltk::EMBOSSED_LABEL; break;
        }
    OUTPUT:
        RETVAL
    ALIAS:
          NORMAL_LABEL = 1
          SYMBOL_LABEL = 2
          SHADOW_LABEL = 3
        ENGRAVED_LABEL = 4
        EMBOSSED_LABEL = 5

BOOT:
    export_tag( "NO_LABEL", "label" );
    export_tag( "NORMAL_LABEL", "label" );
    export_tag( "SYMBOL_LABEL", "label" );
    export_tag( "SHADOW_LABEL", "label" );
    export_tag( "ENGRAVED_LABEL", "label" );
    export_tag( "EMBOSSED_LABEL", "label" );

MODULE = FLTK::Style               PACKAGE = FLTK::Style

bool
fltk::Style::dynamic( )

fltk::NamedStyle *
find ( char * name )
   CODE:
        RETVAL = (fltk::NamedStyle *) fltk::Style::find( name );
    OUTPUT:
        RETVAL

fltk::Box *
fltk::Style::box( fltk::Box * box = NO_INIT )
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
fltk::Style::glyph( fltk::Symbol * symbol = NO_INIT )
    CASE: items == 1
        CODE:
            RETVAL = THIS->glyph( );
        OUTPUT:
            RETVAL
    CASE:
        CODE:
            THIS->glyph( symbol );

fltk::Font *
fltk::Style::labelfont ( fltk::Font * font = NO_INIT )
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
fltk::Style::labeltype( fltk::LabelType * type = NO_INIT )
    CASE: items == 1
        CODE:
            RETVAL = THIS->labeltype( );
        OUTPUT:
            RETVAL
    CASE:
        CODE:
            THIS->labeltype( type );

fltk::Color
fltk::Style::color ( fltk::Color color = NO_INIT )
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
fltk::Style::labelsize( float size = NO_INIT )
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
fltk::Style::scrollbar_align ( unsigned char value = NO_INIT )
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

bool
fltk::Style::hide_underscore ( bool value = NO_INIT )
    CASE: items == 1
        CODE:
            switch ( ix ) {
                case 0: RETVAL = THIS->hide_underscore( ); break;
                case 1: RETVAL = THIS->draw_boxes_inactive( ); break;
            }
        OUTPUT:
            RETVAL
    CASE:
        CODE:
            switch( ix ) {
                case 0: THIS->hide_underscore( value ); break;
                case 1: THIS->draw_boxes_inactive( value ); break;
            }
    ALIAS:
        draw_boxes_inactive = 1

int
fltk::Style::wheel_scroll_lines ( int value = NO_INIT )
    CASE: items == 1
        CODE:
            RETVAL = THIS->wheel_scroll_lines( );
        OUTPUT:
            RETVAL
    CASE:
        CODE:
            THIS->wheel_scroll_lines( value );

    # Children

#INCLUDE: NamedStyle.xsi

#endif // #ifndef DISABLE_STYLE
