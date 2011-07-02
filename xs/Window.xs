#include "include/FLTK_pm.h"

//#define DISABLE_WINDOW_ICON 1

MODULE = FLTK::Window               PACKAGE = FLTK::Window

#ifndef DISABLE_WINDOW

#include <fltk/Window.h>
#include "include/RectangleSubclass.h"
#ifdef WIN32 // the following is needed for the window icon (WIN32 only)
#ifndef DISABLE_WINDOW_ICON
#include <windows.h>
#include <fltk/x.h>
#endif // #ifndef DISABLE_WINDOW_ICON
#endif // ifdef WIN32

fltk::Window *
fltk::Window::new( ... )
    CASE: ( items == 3 || items == 4 )
        CODE:
            char * label = PL_origfilename;
            int w = (int)SvIV(ST(1));
            int h = (int)SvIV(ST(2));
            if (items == 4) label = (char *)SvPV_nolen(ST(3));
            RETVAL = new RectangleSubclass<fltk::Window>(CLASS,w,h,label);
        OUTPUT:
            RETVAL
    CASE: (items == 5 || items == 6)
        CODE:
            char * label = PL_origfilename;
            int x = (int)SvIV(ST(1));
            int y = (int)SvIV(ST(2));
            int w = (int)SvIV(ST(3));
            int h = (int)SvIV(ST(4));
            if (items == 6) label = (char *)SvPV_nolen(ST(5));
            RETVAL = new RectangleSubclass<fltk::Window>(CLASS,x,y,w,h,label);
        OUTPUT:
            RETVAL
    POSTCALL:
        if (RETVAL != NULL) {
#ifdef WIN32
#ifndef DISABLE_WINDOW_ICON
            RETVAL->icon((char *)LoadIcon (dllInstance( ), "FLTK" ));
#endif // #ifndef DISABLE_WINDOW_ICON
#endif // ifdef WIN32
        }

bool
fltk::Window::border( bool set = NO_INIT )
    CASE: items == 1
        CODE:
            RETVAL = THIS->border( );
        OUTPUT:
            RETVAL
    CASE:
        CODE:
            THIS->border( set );

void
fltk::Window::borders( fltk::Rectangle * rect )

void
fltk::Window::child_of( const fltk::Window * parent )
    ALIAS:
        show_inside = 1
    CODE:
        switch ( ix )  {
            case 0: THIS->child_of( parent );    break;
            case 1: THIS->show_inside( parent ); break;
        }

void
fltk::Window::clear_double_buffer( )

void
fltk::Window::erase_overlay( )

void
fltk::Window::free_backbuffer( )

void
fltk::Window::iconize( )

void
fltk::Window::redraw_overlay( )

void
fltk::Window::set_double_buffer( )

void
fltk::Window::system_layout( )


bool
fltk::Window::double_buffer( )

const fltk::Window *
fltk::Window::drawing_window( )

bool
fltk::Window::exec( const fltk::Window * parent = 0, bool grab = 0 )


#include <fltk/Monitor.h>

void
fltk::Window::fullscreen( monitor = 0 )
    CASE: items == 1
        int monitor;
        CODE:
            THIS->fullscreen( );
    CASE: items == 2
        const fltk::Monitor * monitor;
        CODE:
           THIS->fullscreen( *monitor );

void
fltk::Window::fullscreen_off ( int X, int Y, int Width, int Height )
    ALIAS:
        resize = 1
    CODE:
        switch( ix ) {
            case 0: THIS->fullscreen_off( X, Y, Width, Height ); break;
            case 1:         THIS->resize( X, Y, Width, Height ); break;
        }

void
fltk::Window::hotspot ( A, B = false, C = false )
    CASE: items <= 2 && sv_isobject(ST(1)) && sv_derived_from(ST(1), "FLTK::Widget")
        fltk::Widget * A
        bool B;
        C_ARGS: (const fltk::Widget *) A, B
    CASE:
        int A;
        int B;
        bool C;
        C_ARGS: A, B, C

bool
fltk::Window::iconic( )
    ALIAS:
        shown = 1
    CODE:
        switch (ix) {
            case 0: RETVAL = THIS->iconic(); break;
            case 1: RETVAL = THIS->shown();  break;
        }
    OUTPUT:
        RETVAL

const char *
fltk::Window::iconlabel( char * iname = NO_INIT )
    CASE: items == 1
        CODE:
            RETVAL = THIS->iconlabel();
        OUTPUT:
            RETVAL
    CASE:
        CODE:
            THIS->iconlabel( iname );

const char *
fltk::Window::label( char * name = NO_INIT, char * iname = 0 )
    CASE: items == 1
        CODE:
            RETVAL = THIS->label();
        OUTPUT:
            RETVAL
    CASE: items == 2
        CODE:
            THIS->label( name );
    CASE: items == 3
        CODE:
            THIS->label( name, iname );

void
fltk::Window::make_exec_return ( bool return_value )

void
fltk::Window::show( arga = NO_INIT, argb = NO_INIT )
    CASE: items == 1
        CODE:
            THIS->show( );
    CASE: items == 3 && SvROK(ST(2)) && SvTYPE(SvRV(ST(2))) == SVt_PVAV
        int arga
        AV * argb
        CODE:
            char ** _argb = new char * [ av_len( argb ) ];
            for ( int n = 0; n < av_len( argb ); n++ ) {
                SV ** item  = av_fetch(argb, n, 0);
                if ( item && SvOK( * item ) )
                    _argb[ n ] = (char *) SvPV_nolen( * item );
            }
            _argb[ av_len( argb ) ] = 0;
            THIS->show(arga, _argb );
    CASE: items == 2
        fltk::Window * arga
        CODE:
            THIS->show((const fltk::Window *) arga);

void
fltk::Window::size_range ( int minW, int minH, int maxW = 0, int maxH = 0, int dw = 0, int dh = 0 )

fltk::NamedStyle *
fltk::Window::default_style( fltk::NamedStyle * style = NO_INIT )
    CASE: items == 1
        CODE:
            RETVAL = THIS->default_style;
        OUTPUT:
            RETVAL
    CASE: items == 2
        CODE:
            THIS->default_style = style;

fltk::Window *
first( fltk::Window * window = NO_INIT )
    PROTOTYPE: DISABLE
    CODE:
        if( items == 0 )
            RETVAL = fltk::Window::first( );
        else
            fltk::Window::first( window );

fltk::Window *
fltk::Window::next( )

void
fltk::Window::icon( char * path )
    CODE:
#ifdef WIN32
#ifndef DISABLE_WINDOW_ICON
        fltk::CreatedWindow * x = fltk::CreatedWindow::find((fltk::Window *) THIS);
        if (x == NULL)
            return;
        HICON s_icon = (HICON)LoadImage(NULL, path, IMAGE_ICON, 16, 16, LR_LOADFROMFILE|LR_DEFAULTCOLOR|LR_SHARED);
        HICON b_icon = (HICON)LoadImage(NULL, path, IMAGE_ICON, 32, 32, LR_LOADFROMFILE|LR_DEFAULTCOLOR|LR_SHARED);
        if (b_icon == NULL)
            b_icon = s_icon;
        if( b_icon )
            SendMessage( x->xid, WM_SETICON, ICON_BIG, (LPARAM) b_icon);
        if ( s_icon )
            SendMessage( x->xid, WM_SETICON, ICON_SMALL, (LPARAM)s_icon);
#endif // #ifndef DISABLE_WINDOW_ICON
#else
        warn("Loading icons on non-Win32 systems is on my TODO list");
#endif // #ifdef WIN32

void
fltk::Window::_icon_resource_example( char * iconID )
    CODE:
#ifdef WIN32
#ifndef DISABLE_WINDOW_ICON
        HICON b_icon = (HICON)LoadImage(fltk::xdisplay, iconID, IMAGE_ICON, 32, 32, LR_DEFAULTCOLOR|LR_SHARED );
        HICON s_icon = (HICON)LoadImage(fltk::xdisplay, iconID, IMAGE_ICON, 16, 16, LR_DEFAULTCOLOR|LR_SHARED );
        HICON t_icon  =       LoadIcon (fltk::xdisplay, iconID);
        if (!t_icon)
            t_icon  = LoadIcon (fltk::xdisplay, iconID );
        //warn ("A b_icon is %s", ( b_icon == NULL? "borked": "okay"));
        //warn ("B s_icon is %s", ( s_icon == NULL? "borked": "okay"));
        //warn ("C t_icon is %s", ( t_icon == NULL? "borked": "okay"));
        //warn ("%s | %s", fltk::xdisplay, GetModuleHandle(0));
        fltk::CreatedWindow* x = fltk::CreatedWindow::find(THIS);

        if ( ! ( x && fltk::xdisplay ) )
            return;
        if ( b_icon )
            SendMessage( x->xid, WM_SETICON, ICON_BIG, (LPARAM) b_icon);
        if ( s_icon )
            SendMessage( x->xid, WM_SETICON, ICON_SMALL, (LPARAM)s_icon);
#endif // #ifndef DISABLE_WINDOW_ICON
#endif // #ifdef WIN32

#INCLUDE: GlWindow.xsi

#INCLUDE: MenuWindow.xsi

#INCLUDE: ShapedWindow.xsi

#endif // ifndef DISABLE_WINDOW

BOOT:
    isa("FLTK::Window", "FLTK::Group");
