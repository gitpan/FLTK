
=pod

=for abstract Basic FLTK::MenuBar Example

=for license Artistic License 2.0 | Copyright (C) 2009,2010 by Sanko Robinson

=for author Sanko Robinson <sanko@cpan.org> - http://sankorobinson.com/

=for git $Id: menubar.pl 4d25a1c 2010-09-17 21:36:13Z sanko@cpan.org $

=for todo expand into a full text editor

=cut

use strict;
use warnings;
use FLTK;
use Data::Dumper;
$|++;

#
my $win = new FLTK::Window(500, 21, 'Test');
$win->begin;
my $m = FLTK::MenuBar->new(0, 0, 660, 21, 'Test');
{

    package FLTKx::MyItem;
    our @ISA = qw[FLTK::Item];
}
build_menus($m, $win);
{
    sub test { warn 'Click 2'; warn Dumper \@_ }
    my $XXXXX = 100;
    $m->add('This/is/a/te\/st', 0,
            sub { warn 'Click 1'; warn Dumper \@_; },
            [qw'X fsaf', $XXXXX]);
    $m->add('This/is/a/test', 0, \&test);

    #$m->add('This/is/another/test', 0, 'test');
    $m->add_many('This|is|n/o/t/h|er|test');
    $XXXXX = 2;
}
$win->end();
$win->show();
FLTK::run;

sub build_menus {
    my ($menu) = @_;
    my $g = FLTK::ItemGroup->new();
    $menu->begin();
    $g = FLTK::ItemGroup->new("&File");
    $g->begin();
    FLTKx::MyItem->new(
        "&New File",
        0,
        sub {
            warn 'New File';
            warn Dumper \@_;
            $m->item(@_);
            warn Dumper $m->item;
        }
    );
    FLTK::Item->new(
        "&Open File...",
        FLTK::COMMAND + ord 'o',
        sub {
            warn 'Open File...';
            warn $m->value;
            warn $m->value($m->value);
            warn $m->value(5);
            warn $m->value;
        }
    );
    FLTK::Item->new("&Insert File...",
                    FLTK::COMMAND + ord 'i',
                    sub { warn 'insert_cb' }
    );
    FLTK::Divider->new();
    FLTK::Item->new("&Save File",
                    FLTK::COMMAND + ord 's',
                    sub { warn 'save_cb' });
    FLTK::Item->new("Save File &As...",
                    FLTK::COMMAND + FLTK::SHIFT + ord 's',
                    sub { warn 'saveas_cb' });
    new FLTK::Divider();
    FLTK::Item->new("New &View",
                    FLTK::ACCELERATOR + ord 'v',
                    sub { warn 'view_cb' }, 0);
    my $item = FLTK::Item->new("&Close View");
    $item->callback(sub { warn 'close_cb'; warn Dumper \@_ });
    new FLTK::Divider();
    {
        my $x = FLTK::ItemGroup->new('Submenu');
        $x->begin();
        my $btn = FLTK::Button->new(0, 0, 250, 20, 'Button');
        $btn->callback(sub { warn 'button'; warn ref shift });
        $btn->labelfont(FLTK::HELVETICA_BOLD);
        $x->end();
    }
    new FLTK::Divider();
    FLTK::Item->new("E&xit", FLTK::COMMAND + ord 'X', sub {exit}, 0);
    $g->end();
    $g = FLTK::ItemGroup->new("&Edit");
    $g->begin();
    FLTK::Item->new("Cu&t",  FLTK::COMMAND + ord 'x', sub { warn 'cut_cb' });
    FLTK::Item->new("&Copy", FLTK::COMMAND + ord 'c', sub { warn 'copy_cb' });
    FLTK::Item->new("&Paste",
                    FLTK::COMMAND + ord 'v',
                    sub { warn 'paste_cb' });
    FLTK::Item->new("&Delete", 0, sub { warn 'delete_cb' });
    $g->end();
    $g = FLTK::ItemGroup->new("&Search");
    $g->begin();
    FLTK::Item->new("&Find...",
                    FLTK::COMMAND + ord 'f',
                    sub { warn 'find_cb' });
    FLTK::Item->new("F&ind Again",
                    FLTK::COMMAND + ord 'g',
                    sub { warn 'find2_cb' }
    );
    FLTK::Item->new("&Replace...",
                    FLTK::COMMAND + ord 'r',
                    sub { warn 'replace_cb' });
    FLTK::Item->new("Re&place Again",
                    FLTK::COMMAND + ord 't',
                    sub { warn 'replace2_cb' });
    { package FLTK::My::Item; our @ISA = qw[FLTK::Item]; }
    $g->end();
    FLTK::My::Item->new("HERE!!!",
                        FLTK::COMMAND + ord 't',
                        sub { warn 'YAY'; warn ref shift });
    $menu->end();
}
