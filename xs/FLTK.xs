#include "include/FLTK_pm.h"

HV * FLTK_stash,  // For inserting stuff directly into FLTK's namespace
   * FLTK_export; // For inserting stuff directly into FLTK's exports

void register_constant( const char * name, SV * value ) {
    dTHX;
    newCONSTSUB( FLTK_stash, name, value );
}

void register_constant( const char * package, const char * name, SV * value ) {
    dTHX;
    HV * _stash  = gv_stashpv( package, TRUE );
    newCONSTSUB( _stash, name, value );
}

void _cb_w ( fltk::Widget * WIDGET, void * CODE ) {
    dTHX;
    if ( CODE == NULL )     return;
    HV * cb       = ( HV * ) CODE;
    if ( cb       == NULL ) return;
    SV ** cb_code  = hv_fetch( cb, "coderef", 7, FALSE );
    if ( cb_code  == ( SV ** ) NULL ) return;
    SV ** cb_args  = hv_fetch( cb, "args",    4, FALSE );
    SV ** cb_class = hv_fetch( cb, "class",   5, FALSE );
    dSP;
    ENTER;
        SAVETMPS;
            PUSHMARK( sp );
    SV * widget = sv_newmortal( );
    sv_setref_pv( widget, SvPV_nolen( * cb_class ), ( void * ) WIDGET );
    XPUSHs( widget );
    if ( cb_args != NULL ) XPUSHs( * cb_args );
            PUTBACK;
    call_sv( * cb_code, G_DISCARD );
        FREETMPS;
    LEAVE;
}

void _cb_t (void * CODE) { // Callbacks for timers, etc.
    dTHX;
    if ( CODE == NULL )     return;
    HV * cb       = ( HV * ) CODE;
    if ( cb       == NULL ) return;
    SV ** cb_code  = hv_fetch( cb, "coderef", 7, FALSE );
    if ( cb_code  == ( SV ** ) NULL ) return;
    SV ** cb_args  = hv_fetch( cb, "args",    4, FALSE );
    dSP;
    ENTER;
        SAVETMPS;
            PUSHMARK( sp );
    if ( cb_args != NULL ) XPUSHs( * cb_args );
            PUTBACK;
    call_sv( * cb_code, G_DISCARD );
        FREETMPS;
    LEAVE;
}

void _cb_u ( int position, void * CODE) { // Callback for TextDisplay->highlight_data( ... )
    dTHX;
    if ( CODE == NULL )     return;
    HV * cb       = ( HV * ) CODE;
    if ( cb       == NULL ) return;
    SV ** cb_code  = hv_fetch( cb, "coderef", 7, FALSE );
    if ( cb_code  == ( SV ** ) NULL ) return;
    SV ** cb_args  = hv_fetch( cb, "args",    4, FALSE );
    SV ** cb_class = hv_fetch( cb, "class",   5, FALSE );
    dSP;
    ENTER;
        SAVETMPS;
            PUSHMARK( sp );
    XPUSHs(sv_2mortal(newSViv(position)));
    if ( cb_args != NULL ) XPUSHs( * cb_args );
            PUTBACK;
    call_sv( * cb_code, G_DISCARD );
        FREETMPS;
    LEAVE;
}

void _cb_f ( int fd, void * CODE) { // Callback for add_fh( ... )
    dTHX;
    if ( CODE == NULL )     return;
    HV * cb         = ( HV * ) CODE;
    if ( cb        == NULL ) return;
    SV ** cb_code   = hv_fetch( cb, "coderef", 7, FALSE );
    if ( cb_code   == ( SV ** ) NULL ) return;
    SV ** cb_args   = hv_fetch( cb, "args",    4, FALSE );
    SV ** cb_class  = hv_fetch( cb, "class",   5, FALSE );
    SV ** cb_fileno = hv_fetch( cb, "fileno",  6, FALSE );
    PerlIO * _fh = PerlIO_fdopen( SvIV( *cb_fileno ), "rb" );
    SV * fh;
	fh = sv_newmortal();
	{   const char * _class = cb_class != NULL ? SvPV_nolen( * cb_class ) : "FLTK";
        GV *gv = newGVgen(_class);
        /* XXX - reopen fd to the correct mode */
	    if ( do_open(gv, "+<&", 3, FALSE, 0, 0, _fh) )
            sv_setsv(fh, sv_bless(newRV((SV*)gv), gv_stashpv(_class,1)));
	    else
            fh = &PL_sv_undef;
	}
    dSP;
    ENTER;
        SAVETMPS;
            PUSHMARK( sp );
    XPUSHs(sv_2mortal(newSVsv(fh)));
    if ( cb_args != NULL ) XPUSHs( * cb_args );
#if FLTK_DEBUG
    XPUSHs(sv_2mortal(newSViv(fd)));                 // The os fileno
    XPUSHs(sv_2mortal(newSViv(PerlIO_fileno(_fh)))); // Perl's fileno
#endif // FLTK_DEBUG
            PUTBACK;
    call_sv( * cb_code, G_DISCARD );
        FREETMPS;
    LEAVE;
}

void isa ( const char * package, const char * parent ) {
    dTHX;
    HV * parent_stash = gv_stashpv( parent, GV_ADD | GV_ADDMULTI );
    av_push( get_av( form( "%s::ISA", package ), TRUE ),
             newSVpv( parent, 0 ) );
    // TODO: make this spider up the list and make deeper connections?
}

void export_tag (const char * what, const char * _tag ) {
    dTHX;
    //warn("Exporting %s to %s", what, _tag);
    SV ** tag = hv_fetch( FLTK_export, _tag, strlen(_tag), TRUE );
    if (tag && SvOK(* tag) && SvROK(* tag ) && (SvTYPE(SvRV(*tag))) == SVt_PVAV)
        av_push((AV*)SvRV(*tag), newSVpv(what, 0));
    else {
        SV * av;
        av = (SV*) newAV( );
        av_push((AV*)av, newSVpv(what, 0));
        tag = hv_store( FLTK_export, _tag, strlen(_tag), newRV_noinc(av), 0 );
    }
}

I32 magic_ptr_get_int( pTHX_ IV iv, SV * sv ) {
    int * ptr = INT2PTR( int *, iv );
    sv_setiv( sv, (int) * ptr );
    return 1;
}

I32 magic_ptr_set_int( pTHX_ IV iv, SV * sv ) {
    int * ptr = INT2PTR( int *, iv );
    * ptr = SvIV( sv );
    return 1;
}

I32 magic_ptr_get_float ( pTHX_ IV iv, SV * sv ) {
    float * ptr = INT2PTR( float *, iv );
    sv_setnv( sv, (float) * ptr );
    return 1;
}

I32 magic_ptr_set_float ( pTHX_ IV iv, SV * sv ) {
    float * ptr = INT2PTR( float *, iv );
    * ptr = SvNV( sv );
    return 1;
}

I32 magic_ptr_get_bool ( pTHX_ IV iv, SV * sv ) {
    bool * ptr = INT2PTR( bool *, iv );
    sv_setiv( sv, (bool) * ptr );
    return 1;
}

I32 magic_ptr_set_bool ( pTHX_ IV iv, SV * sv ) {
    bool * ptr = INT2PTR( bool *, iv );
    * ptr = SvTRUE(sv) ? true : false;
    return 1;
}

I32 magic_ptr_get_char_ptr ( pTHX_ IV iv, SV * sv ) {
    const char ** ptr = INT2PTR( const char **, iv );
    sv_setpv( sv, (const char *) * ptr );
    return 1;
}

I32 magic_ptr_set_char_ptr ( pTHX_ IV iv, SV * sv ) {
    const char ** ptr = INT2PTR( const char **, iv );
    * ptr = SvPV_nolen( sv );
    return 1;
}

void magic_ptr_init( const char * var, int * ptr ) {
    dTHX;
    SV * sv;
    struct ufuncs ufuncs_int = { magic_ptr_get_int, magic_ptr_set_int, (long) ptr };
    sv = get_sv( var, GV_ADD|GV_ADDMULTI );
    sv_magic(sv, NULL, PERL_MAGIC_uvar, (char *)&ufuncs_int, sizeof(ufuncs_int));
    return;
}

void magic_ptr_init( const char * var, float * ptr ) {
    dTHX;
    SV * sv;
    struct ufuncs ufuncs_float = { magic_ptr_get_float, magic_ptr_set_float, (long) ptr };
    sv = get_sv( var, GV_ADD|GV_ADDMULTI );
    sv_magic(sv, NULL, PERL_MAGIC_uvar, (char *)&ufuncs_float, sizeof(ufuncs_float));
    return;
}

void magic_ptr_init( const char * var, bool * ptr ) {
    dTHX;
    SV * sv;
    struct ufuncs ufuncs_bool = { magic_ptr_get_bool, magic_ptr_set_bool, (long) ptr };
    sv = get_sv( var, GV_ADD|GV_ADDMULTI );
    sv_magic(sv, NULL, PERL_MAGIC_uvar, (char *)&ufuncs_bool, sizeof(ufuncs_bool));
    return;
}

void magic_ptr_init( const char * var, const char ** ptr ) {
    dTHX;
    SV * sv;
    struct ufuncs ufuncs_char_ptr = { magic_ptr_get_char_ptr, magic_ptr_set_char_ptr, (long) ptr };
    sv = get_sv( var, GV_ADD|GV_ADDMULTI );
    sv_magic(sv, NULL, PERL_MAGIC_uvar, (char *)&ufuncs_char_ptr, sizeof(ufuncs_char_ptr));
    return;
}


int call ( const char * code, const char * args ) {
    dTHX;
    int retval;
    dSP;
    ENTER;
        SAVETMPS;
            PUSHMARK( sp );
    XPUSHs( sv_2mortal( newSVpv( args, strlen( args ) ) ) );
            PUTBACK;
    retval = call_pv( code, G_SCALAR | G_EVAL );
        FREETMPS;
    LEAVE;
    return retval;
}


int call ( SV * code, const char * args ) {
    dTHX;
    int retval;
    dSP;
    ENTER;
        SAVETMPS;
            PUSHMARK( sp );
    XPUSHs( sv_2mortal( newSVpv( args, strlen( args ) ) ) );
            PUTBACK;
    retval = call_sv( code, G_SCALAR );
        FREETMPS;
    LEAVE;
    return retval;
}

/*
int get_c_func (const char * name) {
    dTHX;
    SV *result;
    int count;
    dSP;
    PUSHMARK(sp);
    XPUSHs (sv_2mortal (newSVpv (name, 0)));
    PUTBACK;
    count = call_pv("DynaLoader::dl_find_symbol_anywhere", G_SCALAR | G_EVAL );
    SPAGAIN;
    if (count != 1)
        croak ("FLTK::get_c_func returned %d items", count);
    result = POPs;
    if (!SvOK (result))
        croak ("Could not get C function for %s", name);
    PUTBACK;
    return SvIV(result);
}

int install_xsub (const char * package, int id) {
    dTHX;
    SV *result;
    int count;
    dSP;
    PUSHMARK(sp);
    XPUSHs (sv_2mortal (newSVpv (package, 0)));
    XPUSHs (sv_2mortal (newSViv ( id )));
    PUTBACK;
    count = call_pv("DynaLoader::dl_install_xsub", G_SCALAR | G_EVAL );
    SPAGAIN;
    if (count != 1)
        croak ("FLTK::install_xsub returned %d items", count);
    result = POPs;
    if (!SvOK (result))
        croak ("Could not install function for %s", package);
    PUTBACK;
    return SvIV(result);
}

void boot_subpackage( const char * package ) {
    install_xsub( "FLTK::Window::bootstrap", get_c_func("boot_FLTK__Window") );
    call("FLTK::Window::bootstrap", "");
    call("FLTK::Window::import", "");
}
*/

SV * cvrv;

#ifdef WIN32
#include <windows.h>
HINSTANCE _dllInstance;
HINSTANCE dllInstance( ) { return _dllInstance; }
extern "C" BOOL WINAPI DllMain (HINSTANCE hInst, DWORD reason, LPVOID lpRes) {
    switch ( reason ) {
        case DLL_PROCESS_ATTACH:
        case DLL_THREAD_ATTACH:
            _dllInstance = hInst;
            break;
    }
    return TRUE;
}
#endif // #ifdef WIN32

#include "include/FLTK_pm_boot.h"

/* Alright, let's get things started, shall we? */

MODULE = FLTK               PACKAGE = FLTK

BOOT:
    FLTK_stash  = gv_stashpv( "FLTK", TRUE );
    FLTK_export = get_hv( "FLTK::EXPORT_TAGS", TRUE );
    cvrv = eval_pv(
        "sub {"
        "    require DynaLoader;"
        "    my $package = shift;"
        "    my $symbol  = $package;"
        "    $symbol =~ s[\\W][_]g;"
        "    DynaLoader::dl_install_xsub($package . '::bootstrap',"
        "                                DynaLoader::dl_find_symbol_anywhere("
        "                                                             'boot_' . $symbol"
        "                                )"
        "    );"
        "    $package->bootstrap();"
        "    $package->import();"
        "}", TRUE );
    reboot();
