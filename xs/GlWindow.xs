#include "include/FLTK_pm.h"

MODULE = FLTK::GlWindow               PACKAGE = FLTK::GlWindow

#ifndef DISABLE_GLWINDOW

#include <fltk/GlWindow.h>
#include "include/GlWindowSubclass.h"
#ifdef WIN32 // the following is needed for the window icon (WIN32 only)
#include <windows.h>
#include <fltk/x.h>
#endif // ifdef WIN32

fltk::GlWindow *
fltk::GlWindow::new( ... )
    CASE: ( items == 3 || items == 4 )
        CODE:
            char * label  = PL_origfilename;
            int w = (int)SvIV(ST(1));
            int h = (int)SvIV(ST(2));
            if (items == 4) label = (char *)SvPV_nolen(ST(3));
            RETVAL = new RectangleSubclass<fltk::GlWindow>(CLASS,w,h,label);
        OUTPUT:
            RETVAL
    CASE: (items == 5 || items == 6)
        CODE:
            char * label  = PL_origfilename;
            int x = (int)SvIV(ST(1));
            int y = (int)SvIV(ST(2));
            int w = (int)SvIV(ST(3));
            int h = (int)SvIV(ST(4));
            if (items == 6) label = (char *)SvPV_nolen(ST(5));
            RETVAL = new RectangleSubclass<fltk::GlWindow>(CLASS,x,y,w,h,label);
        OUTPUT:
            RETVAL
    CLEANUP:
        if (RETVAL != NULL) {
#ifdef WIN32
            RETVAL->icon((char *)LoadIcon (dllInstance(), "FLTK" ));
#endif // ifdef WIN32
        }

char
fltk::GlWindow::valid( char is_it = NO_INIT )
    CASE: items == 1
        C_ARGS:
        OUTPUT:
            RETVAL
    CASE:
        CODE:
            THIS->valid( is_it );

void
fltk::GlWindow::invalidate( )

int
fltk::GlWindow::mode( int newmode = NO_INIT )
    CASE: items == 1
        C_ARGS:
    CASE:
        C_ARGS: newmode

bool
fltk::GlWindow::can_do( int mode = NO_INIT )
    CASE: items == 1
        C_ARGS:
    CASE: items == 2
        C_ARGS: mode

fltk::GLContext
fltk::GlWindow::context( fltk::GLContext glc = NO_INIT, bool destroy_flag = false )
    CASE: items == 1
        CODE:
            RETVAL = THIS->context( );
            if ( ! RETVAL )
                XSRETURN_UNDEF;
    CASE:
        CODE:
            THIS->context( glc, destroy_flag );
            XSRETURN_UNDEF;

void
fltk::GlWindow::make_current( )

void
fltk::GlWindow::swap_buffers( )

void
fltk::GlWindow::ortho( )

bool
fltk::GlWindow::can_do_overlay( )

void
fltk::GlWindow::redraw_overlay( )

void
fltk::GlWindow::hide_overlay( )

void
fltk::GlWindow::make_overlay_current( )

#endif // ifndef DISABLE_GLWINDOW

BOOT:
    isa("FLTK::GlWindow", "FLTK::Window");
