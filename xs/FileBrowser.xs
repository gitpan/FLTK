#include "include/FLTK_pm.h"

MODULE = FLTK::FileBrowser               PACKAGE = FLTK::FileBrowser

#ifndef DISABLE_FILEBROWSER

#ifdef NORMAL // from perl, probably
#define PERL_NORMAL NORMAL
#undef NORMAL
#endif // ifdef NORMAL

#ifndef dirent
#define dirent direct
#endif // #ifndef dirent

#include <fltk/FileBrowser.h>

#ifdef PERL_NORMAL // Undo our workaround
#define NORMAL PERL_NORMAL
#endif // ifdef PERL_NORMAL

#include "include/RectangleSubclass.h"

fltk::FileBrowser *
fltk::FileBrowser::new( int x, int y, int w, int h, char * label = 0 )
    CODE:
        RETVAL = new RectangleSubclass<fltk::FileBrowser>(CLASS,x,y,w,h,label);
    OUTPUT:
        RETVAL

double
fltk::FileBrowser::icon_size( float size = NO_INIT )
    CASE: items == 1
        C_ARGS:
    CASE:
        CODE:
            THIS->icon_size( size );

const char *
fltk::FileBrowser::filter( char * pattern = NO_INIT )
    CASE: items == 1
        C_ARGS:
    CASE:
        CODE:
            THIS->filter( pattern );

double
fltk::FileBrowser::textsize( float size = NO_INIT )
    CASE: items == 1
        C_ARGS:
    CASE:
        CODE:
            THIS->textsize( size );

double
fltk::FileBrowser::filetype( int type = NO_INIT )
    CASE: items == 1
        C_ARGS:
    CASE:
        CODE:
            THIS->filetype( type );

const char *
fltk::FileBrowser::directory( )

void
fltk::FileBrowser::insert( int n, char * label, data )
    CASE: sv_isobject(ST(3)) && sv_derived_from(ST(3), "FLTK::FileIcon")
        fltk::FileIcon * data
    CASE:
        void           * data

void
fltk::FileBrowser::add( char * line, fltk::FileIcon * icon )

bool
fltk::FileBrowser::show_hidden( bool show = NO_INIT )
    CASE: items == 1
        C_ARGS:
    CASE:
        CODE:
            THIS->show_hidden( show );

#endif // ifndef DISABLE_FILEBROWSER

BOOT:
    isa("FLTK::FileBrowser", "FLTK::Browser");
