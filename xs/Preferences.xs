#include "include/FLTK_pm.h"

MODULE = FLTK::Preferences               PACKAGE = FLTK::Preferences

#ifndef DISABLE_PREFERENCES

#include <fltk/Preferences.h>

fltk::Preferences::Root
SYSTEM( )
    CODE:
        RETVAL = fltk::Preferences::SYSTEM;
    OUTPUT: RETVAL

fltk::Preferences::Root
USER( )
    CODE:
        RETVAL = fltk::Preferences::USER;
    OUTPUT: RETVAL

fltk::Preferences *
fltk::Preferences::new( ... )
    CASE: ( items == 4 && SvIOK(ST(1)) && SvPOK(ST(2)) && SvPOK(ST(3)) )
        CODE:
            /* Root root, const char * vendor, const char * application */
            fltk::Preferences::Root root = (fltk::Preferences::Root) SvIV(ST(1));
            const char * vendor          = (const char *)            SvPV_nolen(ST(2));
            const char * application     = (const char *)            SvPV_nolen(ST(3));
            RETVAL = new fltk::Preferences( root, vendor, application );
        OUTPUT:
            RETVAL
    CASE: ( items == 4 /* && SvPOK(ST(1)) && SvPOK(ST(2)) && SvPOK(ST(3)) */ )
        CODE:
            /* const char * path, const char * vendor, const char * application */
            const char * path   = (const char *) SvPV_nolen(ST(1));
            const char * vendor = (const char *) SvPV_nolen(ST(2));
            const char * app    = (const char *) SvPV_nolen(ST(3));
            RETVAL = new fltk::Preferences( path, vendor, app );
        OUTPUT:
            RETVAL
    CASE: ( items == 3 && sv_isobject(ST(1)) && sv_derived_from(ST(1), "FLTK::Preferences") && SvPOK(ST(2)) )
        CODE:
            /* Preferences * prefs, const char *group */
            fltk::Preferences * prefs = INT2PTR( fltk::Preferences *, SvIV( ( SV * ) SvRV( ST(1) ) ) );
            const char        * group = (const char *) SvPV_nolen(ST(2));
            RETVAL = new fltk::Preferences( prefs, group );
        OUTPUT:
            RETVAL

void
fltk::Preferences::DESTROY(  )

void
fltk::Preferences::destroy( )
    CODE:
        //delete THIS;
        sv_setsv(ST(0), &PL_sv_undef);

int
fltk::Preferences::groups( )

const char *
fltk::Preferences::group( int index )

bool
fltk::Preferences::groupExists( const char * group )

bool
fltk::Preferences::deleteGroup( const char * group )

int
fltk::Preferences::entries( )

const char *
fltk::Preferences::entry( int index )

bool
fltk::Preferences::entryExists( const char * group )

bool
fltk::Preferences::deleteEntry( const char * group )

bool
fltk::Preferences::set( const char * entry, const char * value )

void
fltk::Preferences::get( const char * entry, OUTLIST char * value, char * defaultValue = 0 )
    C_ARGS: entry, value, (const char *) defaultValue

int
fltk::Preferences::size( const char * entry )

char *
fltk::Preferences::getUserdataPath( )
    PREINIT:
        char path[MAX_PATH];
        int length = MAX_PATH;
    CODE:
        if ( ! THIS->getUserdataPath( path, length ) )
            XSRETURN_UNDEF;
        RETVAL = path;
    OUTPUT:
        RETVAL

void
fltk::Preferences::flush( )

#endif // ifndef DISABLE_PREFERENCES
