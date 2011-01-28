#include "include/FLTK_pm.h"

MODULE = FLTK::ShapedWindow               PACKAGE = FLTK::ShapedWindow

#ifndef DISABLE_SHAPEDWINDOW

#include <fltk/ShapedWindow.h>

#include "include/WidgetSubclass.h"

void
fltk::ShapedWindow::new( ... )
    PPCODE:
        void * RETVAL = NULL;
        char * label  = PL_origfilename;
        if ( items == 3 || items == 4 ) {
            int w = (int)SvIV(ST(1));
            int h = (int)SvIV(ST(2));
            if (items == 4) label = (char *)SvPV_nolen(ST(3));
            RETVAL = (void *) new WidgetSubclass<fltk::ShapedWindow>(CLASS,w,h,label);
        }
        else if (items == 5 || items == 6) {
            int x = (int)SvIV(ST(1));
            int y = (int)SvIV(ST(2));
            int w = (int)SvIV(ST(3));
            int h = (int)SvIV(ST(4));
            if (items == 6) label = (char *)SvPV_nolen(ST(5));
            RETVAL = (void *) new WidgetSubclass<fltk::ShapedWindow>(CLASS,x,y,w,h,label);
        }
        if (RETVAL != NULL) {
#ifdef WIN32
            ((fltk::Window *)RETVAL)->icon((char *)LoadIcon (dllInstance( ), "FLTK" ));
#endif // ifdef WIN32
            ST(0) = sv_newmortal();
            sv_setref_pv(ST(0), CLASS, RETVAL); /* -- hand rolled -- */
            XSRETURN(1);
        }

void
fltk::ShapedWindow::shape( fltk::xbmImage * img )

#endif // ifndef DISABLE_SHAPEDWINDOW

BOOT:
    isa( "FLTK::ShapedWindow", "FLTK::Window" );
