package inc::MBX::FLTK;
{
    use strict;
    use warnings;
    $|++;
    use Config qw[%Config];
    use ExtUtils::ParseXS qw[];
    use File::Spec::Functions qw[catdir rel2abs abs2rel canonpath];
    use File::Find qw[find];
    use File::Path qw[make_path];
    use base 'Module::Build';
    our %dl_funcs;
    {

        package My::ExtUtils::CBuilder;
        use base 'ExtUtils::CBuilder';

        sub do_system {
            my ($self, @cmd) = @_;
            @cmd = grep { defined && length } @cmd;
            @cmd = map { s[\s+$][]; s[^\s+][]; $_ } @cmd;
            print "@cmd\n" if !$self->{'quiet'};
            my $cmd = join ' ', @cmd;
            `$cmd`;
            return 1;

            #(my( $program), @cmd) = @cmd;
            #return !system ($program, @cmd);
        }

        sub prelink {
            my ($self, %args) = @_;
            ($args{dl_file} = $args{dl_name}) =~ s/.*:://
                unless $args{dl_file};
            $args{'dl_funcs'} = \%inc::MBX::FLTK::dl_funcs; # Frakin' CBuilder
            require ExtUtils::Mksymlists;
            ExtUtils::Mksymlists::Mksymlists( # dl. abbrev for dynamic library
                DL_VARS  => $args{dl_vars}      || [],
                DL_FUNCS => $args{dl_funcs}     || {},
                FUNCLIST => $args{dl_func_list} || [],
                IMPORTS  => $args{dl_imports}   || {},
                NAME   => $args{dl_name},     # Name of the Perl module
                DLBASE => $args{dl_base},     # Basename of DLL file
                FILE   => $args{dl_file},     # Dir + Basename of symlist file
                VERSION =>
                    (defined $args{dl_version} ? $args{dl_version} : '0.0'),
            );

            # Mksymlists will create one of these files
            return grep -e, map "$args{dl_file}.$_", qw(ext def opt);
        }
    }
    {

        sub ACTION_code {
            require Alien::FLTK2;             # Should be installed by now
            my ($self, $args) = @_;
            my $AF = Alien::FLTK2->new();
            my $CC = My::ExtUtils::CBuilder->new();
            my (@xs, @rc, @pl, @obj);
            find(sub { push @xs, $File::Find::name if m[.+\.xs$]; }, 'xs');
            find(sub { push @pl, $File::Find::name if m[.+\.pl$]i; },
                 'xs/rc');
            if ($self->is_windowsish) {
                $self->do_system($^X, $_) for @pl;
                find(sub { push @rc, $File::Find::name if m[.+\.rc$]; },
                     'xs/rc');
                my @dot_rc = grep defined,
                    map { m[\.(rc)$] ? rel2abs($_) : () } @rc;
                for my $dot_rc (@dot_rc) {
                    my $dot_o = $dot_rc =~ m[^(.*)\.] ? $1 . '.res' : next;
                    push @obj, $dot_o;
                    next if $self->up_to_date($dot_rc, $dot_o);
                    printf 'Building Win32 resource: %s... ',
                        abs2rel($dot_rc);
                    chdir $self->base_dir . '/xs/rc';
                    require Config;
                    my $cc = $Config{'ccname'} || $Config{'cc'};
                    if ($cc eq 'cl') {    # MSVC
                        print $self->do_system(
                                      sprintf 'rc.exe /l 0x409 /fo"%s" %s',
                                      $dot_o, $dot_rc) ? "okay\n" : "fail!\n";
                    }
                    else {                # GCC
                        print $self->do_system(
                                      sprintf 'windres -O coff -i %s -o %s',
                                      $dot_rc, $dot_o) ? "okay\n" : "fail!\n";
                    }
                    chdir rel2abs($self->base_dir);
                }
                map { abs2rel($_) if -f } @obj;
            }
            my @cpp;
        XS: for my $XS ((sort { lc $a cmp lc $b } @xs)) {
                push @cpp, _xs_to_cpp($self, $XS)
                    or exit !printf 'Cannot Parse %s', $XS;
                {
                    open(my ($FH), '<', $XS) || return;
                    sysread($FH, my ($content), -s $FH) == -s $FH or return;
                    my @packages = $content =~ m[^MODULE\s*?=\s*?(\S+).+?$]mg;
                    close $FH;
                    for my $package (@packages) { $dl_funcs{$package} = []; }
                }
            }
            if (!$self->up_to_date(\@xs, 'xs/include/FLTK_pm_boot.h')) {

                # Generate xs/includes/boot.h
                print q[Generating 'xs/include/FLTK_pm_boot.h'... ];
                open(my ($BOOT_H), '>', 'xs/include/FLTK_pm_boot.h')
                    || die 'Failed to create boot header: ' . $!;
                my @lines = sprintf "/* Autogenerated by %s:%d at %s */;",
                    __FILE__, __LINE__, scalar gmtime;
                push @lines, 'void reboot() {';
                push @lines, qq[    call( cvrv, "$_" );]
                    for sort { uc $a cmp uc $b }
                    grep     {m[^FLTK::]} keys %dl_funcs;
                push @lines, '}';
                syswrite($BOOT_H, join "\r\n", @lines);
                close $BOOT_H;
                $self->add_to_cleanup('xs/include/FLTK_pm_boot.h');
                print "okay\n";
            }
        CPP: for my $cpp (@cpp) {
                if ($self->up_to_date($cpp, $CC->object_file($cpp))) {
                    push @obj, $CC->object_file($cpp);
                    next CPP;
                }
                local $CC->{'quiet'} = 1;
                printf q[Building '%s'... ], $cpp;
                my $obj = $CC->compile(
                                     'C++'        => 1,
                                     source       => $cpp,
                                     include_dirs => [$AF->include_dirs()],
                                     extra_compiler_flags => [$AF->cxxflags()]
                );
                printf "%s\n", $obj ? 'okay' : 'failed';    # XXX - exit?
                push @obj, $obj;
            }
            make_path(catdir(qw[blib arch auto FLTK]),
                      {verbose => !$self->quiet(), mode => 0777});
            @obj = map { canonpath abs2rel($_) } @obj;
            if (!$self->up_to_date([@obj],
                                   catdir(qw[blib arch auto FLTK],
                                          'FLTK.' . $Config{'so'}
                                   )
                )
                )
            {   my ($dll, @cleanup)
                    = $CC->link(
                              objects => \@obj,
                              lib_file =>
                                  catdir(qw[blib arch auto FLTK],
                                         'FLTK.' . $Config{'so'}
                                  ),
                              module_name => 'FLTK',
                              extra_linker_flags =>
                                  [$AF->ldflags('images', $AF->capabilities)],
                    );
                @cleanup = map { s["][]g; rel2abs($_); } @cleanup;
                $self->add_to_cleanup(@cleanup);
                $self->add_to_cleanup(@obj);
            }
            $self->SUPER::ACTION_code;
        }

        sub _xs_to_cpp {
            my ($self, $xs) = @_;
            my ($cpp, $typemap) = ($xs, $xs);
            $cpp     =~ s[\.xs$][\.cxx];
            $typemap =~ s[\.xs$][\.tm];
            $typemap = 'type.map' if !-e $typemap;
            my @xsi;
            find sub { push @xsi, $File::Find::name if m[\.xsi$] },
                catdir('xs');
            $self->add_to_cleanup($cpp);
            return $cpp
                if $self->up_to_date([@xsi, $xs,
                                      rel2abs(catdir('xs', $typemap))
                                     ],
                                     $cpp
                );
            printf q"Parsing '%s' into '%s' w/ '%s'... ", $xs, $cpp, $typemap;
            local @ExtUtils::ParseXS::BootCode = ();

            if (ExtUtils::ParseXS->process_file(
                                   filename => $xs,
                                   output   => $cpp,
                                   'C++'    => 1,
                                   hiertype => 1,
                                   typemap => rel2abs(catdir('xs', $typemap)),
                                   prototypes  => 1,
                                   linenumbers => 1
                )
                )
            {   print "okay\n";
                return $cpp;
            }
            print "FAIL!\n";
            return;
        }
    }
    1;
}

=pod

=for $Rev: 0eccecd $

=for $Revision: 0eccecdb90f40ba44af05a50fe819598edfbcef3 $

=for $Date: 2011-01-29 05:18:37Z (Sat, 29 Jan 2011) $ | Last $Modified: 5 months ago $

=for $URL: git://github.com/sanko/perl-fltk.git/raw/master/inc/MBX/FLTK.pm $

=for $ID: FLTK.pm 0eccecd 2011-01-29 05:18:37Z sanko@cpan.org $

=for author Sanko Robinson <sanko@cpan.org> - http://sankorobinson.com/

=cut

sub LICENSE {
    <<'ARTISTIC_TWO' }
Copyright (C) 2008-2010 by Sanko Robinson <sanko@cpan.org>

This program is free software; you can redistribute it and/or modify it under
the terms of
L<The Artistic License 2.0|http://www.perlfoundation.org/artistic_license_2_0>.
See the F<LICENSE> file included with this distribution or
L<notes on the Artistic License 2.0|http://www.perlfoundation.org/artistic_2_0_notes>
for clarification.

When separated from the distribution, all original POD documentation is
covered by the
L<Creative Commons Attribution-Share Alike 3.0 License|http://creativecommons.org/licenses/by-sa/3.0/us/legalcode>.
See the
L<clarification of the CCA-SA3.0|http://creativecommons.org/licenses/by-sa/3.0/us/>.
ARTISTIC_TWO
