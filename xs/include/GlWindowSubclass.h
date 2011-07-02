#ifndef fltk_GlWindowSubclass_h
#define fltk_GlWindowSubclass_h

/*

=pod

=for license Artistic License 2.0 |Copyright (C) 2009 by Sanko Robinson

=for author Sanko Robinson <sanko@cpan.org> - http://sankorobinson.com/

=for abstract draw() function Subclass of GlWidget

=for seealso xs/GlWindow.xsi

=for seealso xs/include/RectangleSubclass.h

=for git $Id: GlWindowSubclass.h 7483df2 2011-04-09 05:42:22Z sanko@cpan.org $

=cut

*/

#ifndef fltk_GlWindow_h
#include <fltk/GlWindow.h> // Minimum.
#endif

#ifndef fltk_RectangleSubclass_h
#include <include/RectangleSubclass.h>
#endif

template<>
void RectangleSubclass<fltk::GlWindow>::draw ( ) {
	int handled = 1; /* safe to assume for now */
	dTHX;
	AV * args = newAV();
	handled = _call_method( "draw", args );
	/* GlWindow::draw( ) is a pure virtual function */
}

#endif // #ifndef fltk_GlWindowSubclass_h
