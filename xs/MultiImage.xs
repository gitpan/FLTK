#include "include/FLTK_pm.h"

MODULE = FLTK::MultiImage               PACKAGE = FLTK::MultiImage

#ifndef DISABLE_MULTIIMAGE

#include <fltk/MultiImage.h>

fltk::MultiImage *
fltk::MultiImage::new( )

void
fltk::MultiImage::_measure( OUTLIST int x, OUTLIST int y )
    C_ARGS: x, y

void
fltk::MultiImage::_draw( fltk::Rectangle * rect )
    C_ARGS: * rect

const fltk::Symbol *
fltk::MultiImage::current_image( )

void
fltk::MultiImage::inset( fltk::Rectangle * rect )
    C_ARGS: * rect

bool
fltk::MultiImage::fills_rectangle( )

bool
fltk::MultiImage::is_frame( )

void
fltk::MultiImage::add( fltk::Flags flags, fltk::Symbol * image )
    C_ARGS: flags, * image

void
fltk::MultiImage::release( )

#endif // ifndef DISABLE_MULTIIMAGE

BOOT:
    isa("FLTK::MultiImage", "FLTK::Symbol");
