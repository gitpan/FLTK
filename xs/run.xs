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

SV *
add_timeout( double time, CV * callback, SV * args = NO_INIT )
    CODE:
        AV *seg_av;
        seg_av = newAV();
        av_push(seg_av, newSVsv(ST(1)));
        if ( items == 3 ) av_push(seg_av, newSVsv(args));
        RETVAL = sv_bless(newRV_noinc((SV *)seg_av), gv_stashpv("FLTK::timeout", 1));
        fltk::add_timeout( time, _cb_t, ( void * ) seg_av );
    OUTPUT:
        RETVAL

MODULE = FLTK::run               PACKAGE = FLTK::timeout

void
DESTROY( SV * timeout )
    CODE:
        if (fltk::has_timeout( _cb_t, ( void * ) SvRV(ST(0) )) )
            fltk::remove_timeout( _cb_t, ( void * ) SvRV(ST(0) ));

MODULE = FLTK::run               PACKAGE = FLTK

void
repeat_timeout( double time, SV * timeout )
    CODE:
        fltk::repeat_timeout( time, _cb_t, ( void * ) SvRV(ST(1) ));

BOOT:
    export_tag("add_timeout",    "run");
    export_tag("repeat_timeout", "run");

MODULE = FLTK::run               PACKAGE = FLTK::run

MODULE = FLTK::run               PACKAGE = FLTK

bool
has_timeout( SV * timeout )
    CODE:
         RETVAL = fltk::has_timeout( _cb_t, ( void * ) SvRV(ST(0) )) ? 1 : 0;
    OUTPUT:
        RETVAL

bool
has_check( SV * check )
    CODE:
         RETVAL = fltk::has_check( _cb_t, ( void * ) SvRV(ST(0) )) ? 1 : 0;
    OUTPUT:
        RETVAL

bool
has_idle( SV * idle )
    CODE:
         RETVAL = fltk::has_idle( _cb_t, ( void * ) SvRV(ST(0) )) ? 1 : 0;
    OUTPUT:
        RETVAL

BOOT:
    export_tag("has_timeout", "run");
    export_tag("has_check", "run");
    export_tag("has_idle", "run");

MODULE = FLTK::run               PACKAGE = FLTK::run

MODULE = FLTK::run               PACKAGE = FLTK

void
remove_timeout( SV * timeout )
    CODE:
        if (fltk::has_timeout( _cb_t, ( void * ) SvRV(ST(0) )) )
            fltk::remove_timeout( _cb_t, ( void * ) SvRV(ST(0) ));
        sv_setsv(ST(0), &PL_sv_undef);

SV *
add_check( CV * callback, SV * args = NO_INIT )
    CODE:
        AV *seg_av;
        seg_av = newAV();
        av_push(seg_av, newSVsv(ST(0)));
        if ( items == 2 ) av_push(seg_av, newSVsv(args));
        RETVAL = sv_bless(newRV_noinc((SV *)seg_av), gv_stashpv("FLTK::check", 1));
        fltk::add_check( _cb_t, ( void * ) seg_av );
    OUTPUT:
        RETVAL

MODULE = FLTK::run               PACKAGE = FLTK::check

void
DESTROY( SV * check )
    CODE:
        if (fltk::has_check( _cb_t, ( void * ) SvRV(ST(0) )) )
            fltk::remove_check( _cb_t, ( void * ) SvRV(ST(0) ));

MODULE = FLTK::run               PACKAGE = FLTK

void
remove_check( SV * timeout )
    CODE:
        if (fltk::has_check( _cb_t, ( void * ) SvRV(ST(0) )) )
            fltk::remove_check( _cb_t, ( void * ) SvRV(ST(0) ));
        sv_setsv(ST(0), &PL_sv_undef);

SV *
add_idle( CV * callback, SV * args = NO_INIT )
    CODE:
        AV *seg_av;
        seg_av = newAV();
        av_push(seg_av, newSVsv(ST(0)));
        if ( items == 2 ) av_push(seg_av, newSVsv(args));
        RETVAL = sv_bless(newRV_noinc((SV *)seg_av), gv_stashpv("FLTK::idle", 1));
        fltk::add_idle( _cb_t, ( void * ) seg_av );
    OUTPUT:
        RETVAL

void
remove_idle( SV * idle )
    CODE:
        if (fltk::has_idle( _cb_t, ( void * ) SvRV(ST(0) )) )
            fltk::remove_idle( _cb_t, ( void * ) SvRV(ST(0) ));
        sv_setsv(ST(0), &PL_sv_undef);

MODULE = FLTK::run               PACKAGE = FLTK::idle

void
DESTROY( SV * idle )
    CODE:
        if (fltk::has_idle( _cb_t, ( void * ) SvRV(ST(0) )) )
            fltk::remove_idle( _cb_t, ( void * ) SvRV(ST(0) ));

MODULE = FLTK::run               PACKAGE = FLTK

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

SV *
add_fd( fh, int events, CV * callback, SV * args = NO_INIT )
    CASE: SvROK( ST(0) ) && ( SvTYPE( SvRV( ST( 0 ) ) ) == SVt_PVGV )
        PerlIO * fh
        CODE:
            int fileno = PerlIO_fileno( fh );
            AV *seg_av;
            seg_av = newAV();
            // cb, fileno, events, [, args]
            av_push(seg_av, newSVsv(ST(2)));
            av_push(seg_av, newRV_inc(ST(0)));
            av_push(seg_av, newSViv( events ));
            if ( items == 2 ) av_push(seg_av, newSVsv(args));
            RETVAL = sv_bless(newRV_noinc((SV *)seg_av), gv_stashpv("FLTK::fd", 1));
            fltk::add_fd(_get_osfhandle( fileno ), events, _cb_f, ( void * ) seg_av );
        OUTPUT:
            RETVAL
    CASE: SvIOK( ST(0) )
        int fh
        CODE:
            AV *seg_av;
            seg_av = newAV();
            // cb, fileno, events, [, args]
            av_push( seg_av, newSVsv( ST(2) ) );
            PerlIO * _fh = PerlIO_fdopen( fh, "rb" );
            SV * svfh;
            svfh = sv_newmortal();
            {   const char * _class = "FLTK";
                GV *gv = newGVgen(_class);
                /* XXX - reopen fd to the correct mode */
                if ( do_open(gv, "+<&", 3, FALSE, 0, 0, _fh) )
                    sv_setsv(svfh, sv_bless(newRV((SV*)gv), gv_stashpv(_class,1)));
                else
                    svfh = &PL_sv_undef;
            }
            av_push(seg_av,  newSVsv(svfh) );
            av_push(seg_av, newSViv( events ));
            if ( items == 2 ) av_push(seg_av, newSVsv(args));
            RETVAL = sv_bless(newRV_noinc((SV *)seg_av), gv_stashpv("FLTK::fd", 1));
            fltk::add_fd(_get_osfhandle( fh ), events, _cb_f, ( void * ) seg_av );
        OUTPUT:
            RETVAL

MODULE = FLTK::run               PACKAGE = FLTK

BOOT:
    export_tag("add_fd", "fd");

MODULE = FLTK::run               PACKAGE = FLTK::run

MODULE = FLTK::run               PACKAGE = FLTK

void
remove_fd( fh, int when = -1 )
    CASE: SvROK( ST(0) ) && ( SvTYPE( SvRV( ST( 0 ) ) ) == SVt_PVGV )
        PerlIO * fh
        CODE:
            int fileno = PerlIO_fileno( fh );
            fltk::remove_fd( _get_osfhandle( fileno ), when );
    CASE:
        AV * fh
        CODE:
            // cb, fileno, fh, events, [, args]
            AV  * ref = MUTABLE_AV( fh );
            SV ** fileref = av_fetch(ref, 1, FALSE);
            if ( fileref == NULL ) XSRETURN_UNDEF;
            SV ** moderef = av_fetch(ref, 2, FALSE);
            PerlIO * pio_file = IoIFP( sv_2io( SvRV( * fileref ) ) );
            fltk::remove_fd( _get_osfhandle( PerlIO_fileno( pio_file ) ), SvIV( * moderef ) );
            if ( ix != 100 )
                sv_setsv(ST(0), &PL_sv_undef);
    ALIAS:
        FLTK::fd::DESTROY = 100

BOOT:
    export_tag("remove_fd", "fd");

#endif // ifndef DISABLE_RUN
