#include "include/FLTK_pm.h"

MODULE = FLTK::MenuBar               PACKAGE = FLTK::MenuBar

#ifndef DISABLE_MENUBAR

=pod

=for license Artistic License 2.0 | Copyright (C) 2009,2010 by Sanko Robinson

=for author Sanko Robinson <sanko@cpan.org> - http://sankorobinson.com/

=for version 0.532006

=for git $Id: MenuBar.xs c629eeb 2010-09-27 04:12:30Z sanko@cpan.org $

=head1 NAME

FLTK::MenuBar - Typical Window Menu

=head1 Description

Subclass of L<FLTK::Menu|FLTK::Menu>. The top level menu items are visible and
drawn in a horizontal row. Put this at the top edge of your window and you get
a typical menubar.

You can call L<C<popup( )>|FLTK::Menu/"popup"> on this same widget in response
to a right-click in your work area and you will get the exact same menu as a
vertical pop up menu.

=cut

#include <fltk/MenuBar.h>

=begin apidoc

=for apidoc ||FLTK::MenuBar menu|new|int x|int y|int w|int h|char * label = ''|



=cut

#include "include/WidgetSubclass.h"

void
fltk::MenuBar::new( int x, int y, int w, int h, char * label = 0 )
    PPCODE:
        void * RETVAL = NULL;
        RETVAL = (void *) new WidgetSubclass<fltk::MenuBar>(CLASS,x,y,w,h,label);
        if (RETVAL != NULL) {
            ST(0) = sv_newmortal();
            sv_setref_pv(ST(0), CLASS, RETVAL); /* -- hand rolled -- */
            XSRETURN(1);
        }

=for apidoc ||FLTK::NamedStyle * style|default_style||

Get the style

=for apidoc |||default_style|FLTK::NamedStyle * style|

Set the style.

=cut

fltk::NamedStyle *
fltk::MenuBar::default_style( fltk::NamedStyle * style = NO_INIT )
    CASE: items == 1
        CODE:
            RETVAL = THIS->default_style;
        OUTPUT:
            RETVAL
    CASE: items == 2
        CODE:
            THIS->default_style = style;

#endif // ifndef DISABLE_MENUBAR

BOOT:
    isa("FLTK::MenuBar", "FLTK::Menu");
