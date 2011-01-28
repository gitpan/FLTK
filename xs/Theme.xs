#include "include/FLTK_pm.h"

#ifndef DISABLE_THEME

SV * fltk_theme_CV;
fltk::Theme * original_theme = &fltk::theme_;

bool _fltk_theme( ) {
    dTHX;
    warn ("Here");
    if ( fltk_theme_CV && SvOK( fltk_theme_CV ) ) {
        warn ("Trying to call fltk_theme sub...");
        int count, ret_val;
    dSP;
    ENTER;
        SAVETMPS;
            PUSHMARK( sp );
            PUTBACK;
    count = call_sv( fltk_theme_CV, G_SCALAR );
            SPAGAIN;
    ret_val = ( bool ) ( ( count != 1 ) ? 0 : POPi );
        FREETMPS;
    LEAVE;
        return ret_val;
    }
    return (*original_theme)();
}

#endif // #ifndef DISABLE_THEME

MODULE = FLTK::theme               PACKAGE = FLTK::theme

#ifndef DISABLE_THEME

#include <fltk/Style.h>

MODULE = FLTK::theme               PACKAGE = FLTK

SV *
theme( theme = NO_INIT )
    CASE: items == 0
        CODE:
            RETVAL = SvOK( fltk_theme_CV ) ? newSVsv( fltk_theme_CV ) : &PL_sv_undef;
        OUTPUT:
            RETVAL
    CASE: items == 1 && (SvROK( ST( 0 ) ) ) && ( SvTYPE(SvRV(ST(0))) == SVt_PVCV )
        CV * theme
        CODE:
            fltk_theme_CV = newSVsv( ST( 0 ) );
            fltk::theme( _fltk_theme );
    CASE: items == 1
        const char * theme
        CODE:
            warn ("#include <win32/fltk_theme.cxx>  ...or something." );

void
load_theme( )
    CODE:
        fltk::load_theme( );

void
reload_theme( )
    CODE:
        fltk::reload_theme( );

bool
reset_theme( )
    CODE:
        RETVAL = fltk::reset_theme( );
    OUTPUT:
        RETVAL

BOOT:
    export_tag( "load_theme", "theme" );
    export_tag( "reload_theme", "theme" );
    export_tag( "reset_theme", "theme" );

#endif // ifndef DISABLE_THEME
