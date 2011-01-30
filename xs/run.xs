#include "include/FLTK_pm.h"

#ifndef PerlIO
#define PerlIO_fileno(f) fileno(f)
#endif
#ifndef _WIN32
#define _get_osfhandle(f) f // converts perl fd into a winsock fd on win32
#endif

MODULE = FLTK::run               PACKAGE = FLTK::run

#ifndef DISABLE_RUN

#include <fltk/run.h>

MODULE = FLTK::run               PACKAGE = FLTK

void
display ( char * d )
    CODE:
        fltk::display( d );

BOOT:
    export_tag("display", "run");

MODULE = FLTK::run               PACKAGE = FLTK::run

MODULE = FLTK::run               PACKAGE = FLTK

bool
enable_tablet_events( )
    CODE:
        RETVAL = fltk::enable_tablet_events( );
    OUTPUT:
        RETVAL

BOOT:
    export_tag("enable_tablet_events", "run");

MODULE = FLTK::run               PACKAGE = FLTK::run

MODULE = FLTK::run               PACKAGE = FLTK

int
wait ( double time_to_wait = NO_INIT )
    CODE:
        if ( items == 0 )
            RETVAL = fltk::wait( );
        else
            RETVAL = fltk::wait( time_to_wait );
    OUTPUT:
        RETVAL

BOOT:
    export_tag("wait", "run");

MODULE = FLTK::run               PACKAGE = FLTK::run

MODULE = FLTK::run               PACKAGE = FLTK

int
run ( )
    CODE:
        RETVAL = fltk::run( );
    OUTPUT:
        RETVAL

int
check ( )
    CODE:
        RETVAL = fltk::check( );
    OUTPUT:
        RETVAL

int
ready ( )
    CODE:
        RETVAL = fltk::ready( );
    OUTPUT:
        RETVAL

BOOT:
    export_tag("run",   "run");
    export_tag("run",   "default");
    export_tag("check", "run");
    export_tag("ready", "run");

MODULE = FLTK::run               PACKAGE = FLTK::run

MODULE = FLTK::run               PACKAGE = FLTK

void
redraw( )
    CODE:
        fltk::redraw( );

void
flush( )
    CODE:
        fltk::flush( );

BOOT:
    export_tag("redraw", "run");
    export_tag("flush", "run");

MODULE = FLTK::run               PACKAGE = FLTK::run

MODULE = FLTK::run               PACKAGE = FLTK

int
damage( int d = NO_INIT )
    CASE: items == 0
        CODE:
            fltk::damage ( );
        OUTPUT:
            RETVAL
    CASE:
        CODE:
            fltk::damage( d );

BOOT:
    export_tag("damage", "run");

MODULE = FLTK::run               PACKAGE = FLTK::run

MODULE = FLTK::run               PACKAGE = FLTK

double
get_time_secs( )
    CODE:
        RETVAL = fltk::get_time_secs( );

BOOT:
    export_tag("get_time_secs", "run");

MODULE = FLTK::run               PACKAGE = FLTK::run

MODULE = FLTK::run               PACKAGE = FLTK

void
add_timeout( double time, CV * callback, SV * args = NO_INIT )
    CODE:
        HV   * cb    = newHV( );
        hv_store( cb, "coderef",  7, newSVsv( ST( 1 ) ), 0 );
        if ( items == 3 ) /* Callbacks can be called without arguments */
            hv_store( cb, "args", 4, newSVsv( args ),    0 );
        fltk::add_timeout( time, _cb_t, ( void * ) cb );

void
repeat_timeout( double time, CV * callback, SV * args = NO_INIT )
    CODE:
        HV   * cb    = newHV( );
        hv_store( cb, "coderef",  7, newSVsv( ST( 1 ) ), 0 );
        if ( items == 3 ) /* Callbacks can be called without arguments */
            hv_store( cb, "args", 4, newSVsv( args ),    0 );
        fltk::repeat_timeout( time, _cb_t, ( void * ) cb );

BOOT:
    export_tag("add_timeout",    "run");
    export_tag("repeat_timeout", "run");

MODULE = FLTK::run               PACKAGE = FLTK::run

MODULE = FLTK::run               PACKAGE = FLTK

bool
has_timeout( CV * coderef, SV * args = NO_INIT )
    CODE:
        HV   * cb    = newHV( );
        hv_store( cb, "coderef",  7, newSVsv( ST( 1 ) ), 0 );
        if ( items == 2 ) /* Timeout callbacks can be called without arguments */
            hv_store( cb, "args", 4, newSVsv( args ),    0 );
        /* for (Timeout* t = first_timeout; t; t = t->next)
            if (t->cb == _cb &&
                av_fetch(*(AV*)t->arg, 0, 0) == newSVsv((SV*)ST(0))
            ) {RETVAL = true; break; }
        }*/
        RETVAL = fltk::has_timeout( _cb_t, ( void * ) cb ); // XXX
    OUTPUT:
        RETVAL

bool
has_check( CV * coderef, SV * args = NO_INIT )
    CODE:
        HV   * cb    = newHV( );
        hv_store( cb, "coderef",  7, newSVsv( ST( 1 ) ), 0 );
        if ( items == 2 ) /* Timeout callbacks can be called without arguments */
            hv_store( cb, "args", 4, newSVsv( args ),    0 );
        /* for (Timeout* t = first_timeout; t; t = t->next)
            if (t->cb == _cb &&
                av_fetch(*(AV*)t->arg, 0, 0) == newSVsv((SV*)ST(0))
            ) {RETVAL = true; break; }
        }*/
        RETVAL =   fltk::has_check( _cb_t, ( void * ) cb ); // XXX
    OUTPUT:
        RETVAL

bool
has_idle( CV * coderef, SV * args = NO_INIT )
    CODE:
        HV   * cb    = newHV( );
        hv_store( cb, "coderef",  7, newSVsv( ST( 1 ) ), 0 );
        if ( items == 2 ) /* Timeout callbacks can be called without arguments */
            hv_store( cb, "args", 4, newSVsv( args ),    0 );
        /* for (Timeout* t = first_timeout; t; t = t->next)
            if (t->cb == _cb &&
                av_fetch(*(AV*)t->arg, 0, 0) == newSVsv((SV*)ST(0))
            ) {RETVAL = true; break; }
        }*/
        RETVAL =    fltk::has_idle( _cb_t, ( void * ) cb ); // XXX
    OUTPUT:
        RETVAL

BOOT:
    export_tag("has_timeout", "run");
    export_tag("has_check", "run");
    export_tag("has_idle", "run");

MODULE = FLTK::run               PACKAGE = FLTK::run

MODULE = FLTK::run               PACKAGE = FLTK

void
remove_timeout( CV * callback, SV * args = NO_INIT )
    CODE:
        HV   * cb    = newHV( );
        hv_store( cb, "coderef",  7, newSVsv( ST( 1 ) ), 0 );
        if ( items == 2 ) /* Callbacks can be called without arguments */
            hv_store( cb, "args", 4, newSVsv( args ),    0 );
        fltk::remove_timeout( _cb_t, ( void * ) cb ); // XXX - meh

void
add_check( CV * callback, SV * args = NO_INIT )
    CODE:
        HV   * cb    = newHV( );
        hv_store( cb, "coderef",  7, newSVsv( ST( 1 ) ), 0 );
        if ( items == 2 ) /* Callbacks can be called without arguments */
            hv_store( cb, "args", 4, newSVsv( args ),    0 );
        fltk::add_check( _cb_t, ( void * ) cb );

void
remove_check( CV * callback, SV * args = NO_INIT )
    CODE:
        HV   * cb    = newHV( );
        hv_store( cb, "coderef",  7, newSVsv( ST( 1 ) ), 0 );
        if ( items == 2 ) /* Callbacks can be called without arguments */
            hv_store( cb, "args", 4, newSVsv( args ),    0 );
        fltk::remove_check( _cb_t, ( void * ) cb ); // XXX - meh

void
add_idle( CV * callback, SV * args = NO_INIT )
    CODE:
        HV   * cb    = newHV( );
        hv_store( cb, "coderef",  7, newSVsv( ST( 1 ) ), 0 );
        if ( items == 2 ) /* Callbacks can be called without arguments */
            hv_store( cb, "args", 4, newSVsv( args ),    0 );
        fltk::add_idle( _cb_t, ( void * ) cb );

void
remove_idle( CV * callback, SV * args = NO_INIT )
    CODE:
        HV   * cb    = newHV( );
        hv_store( cb, "coderef",  7, newSVsv( ST( 1 ) ), 0 );
        if ( items == 2 ) /* Callbacks can be called without arguments */
            hv_store( cb, "args", 4, newSVsv( args ),    0 );
        fltk::remove_idle( _cb_t, ( void * ) cb ); // XXX - meh

BOOT:
    export_tag("remove_timeout", "run");
    export_tag("add_check",      "run");
    export_tag("remove_check",   "run");
    export_tag("add_idle",       "run");
    export_tag("remove_idle",    "run");

MODULE = FLTK::run               PACKAGE = FLTK::run

BOOT:
    register_constant("READ",   newSViv( fltk::READ   ));
    export_tag("READ", "fd");
    register_constant("WRITE",  newSViv( fltk::WRITE  ));
    export_tag("WRITE", "fd");
    register_constant("EXCEPT", newSViv( fltk::EXCEPT ));
    export_tag("EXCEPT", "fd");

MODULE = FLTK::run               PACKAGE = FLTK

bool
add_fd( fh, int events, CV * callback, SV * args = NO_INIT )
    CASE: SvIOK( ST(0) )
        int fh
        CODE:
            RETVAL = true;
            HV * cb = newHV( );
            hv_store( cb, "coderef", 7, newSVsv( ST( 2 ) ), 0 );
            if ( items == 3 ) /* Callbacks can be called without arguments */
                hv_store( cb, "args", 4, newSVsv( args ),   0 );
            hv_store( cb, "fileno", 6, newSViv( fh ),   0 );
            PerlIO * _fh;
            int fd = PerlLIO_dup( fh );
            /* XXX: user should check errno on undef returns */
            if (fd < 0)
                RETVAL = false;
            else if ( !( _fh = PerlIO_fdopen( fd, "rb" ) ) )
                RETVAL = false;
            else {
                //hv_store( cb, "fh",     2, newSVsv( (SV *) _fh ),  0 );
                fltk::add_fd(
                    _get_osfhandle( fh ), events, _cb_f, ( void * ) cb
                );
            }
        OUTPUT:
            RETVAL
    CASE:
        PerlIO * fh
        CODE:
            RETVAL = true;
            HV * cb = newHV( );
            hv_store( cb, "coderef", 7, newSVsv( ST( 2 ) ), 0 );
            if ( items == 3 ) /* Callbacks can be called without arguments */
                hv_store( cb, "args", 4, newSVsv( args ),  0 );
            int fileno = PerlIO_fileno( fh );
            hv_store( cb, "fileno", 6, newSViv( fileno ),  0 );
            //hv_store( cb, "fh",     2, newSVsv( (SV *) fh ),  0 );
            fltk::add_fd(
                _get_osfhandle( fileno ), events, _cb_f, ( void * ) cb
            );
        OUTPUT:
            RETVAL

BOOT:
    export_tag("add_fd", "fd");

MODULE = FLTK::run               PACKAGE = FLTK::run

MODULE = FLTK::run               PACKAGE = FLTK

bool
remove_fd( fh, int when = -1 )
    CASE: SvIOK( ST(0) )
        int fh
        CODE:
            fltk::remove_fd( _get_osfhandle( fh ), when );
            RETVAL = 1;
        OUTPUT:
            RETVAL
    CASE:
        PerlIO * fh
        CODE:
            fltk::remove_fd( _get_osfhandle( PerlIO_fileno( fh ) ), when );
            RETVAL = 1;
        OUTPUT:
            RETVAL

BOOT:
    export_tag("remove_fd", "fd");

#endif // ifndef DISABLE_RUN
