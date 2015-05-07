# Makefile for PDCurses library for SDL

O = o

ifndef PDCURSES_SRCDIR
	PDCURSES_SRCDIR	= ..
endif

include $(PDCURSES_SRCDIR)/libobjs.mif

osdir		= $(PDCURSES_SRCDIR)/sdl1

PDCURSES_SDL_H	= $(osdir)/pdcsdl.h

SFLAGS		= $(shell sdl-config --cflags) -Os -Werror
SLIBS		= $(shell sdl-config --libs)

# If your system doesn't have these, remove the defines here
SFLAGS		+= -DHAVE_VSNPRINTF -DHAVE_VSSCANF

BUILD		= $(CC) $(CFLAGS) -I$(PDCURSES_SRCDIR)

LINK		= $(CC)
LDFLAGS		= $(LIBCURSES) $(SLIBS)
RANLIB		= ranlib
LIBCURSES	= libpdcurses.a

.PHONY: all libs clean

all:	libs

libs:	$(LIBCURSES)

clean:
	-rm -rf ../pdcurses/*.o *.o trace $(LIBCURSES) $(DEMOS)

$(LIBCURSES) : $(LIBOBJS) $(PDCOBJS)
	ar rv $@ $?
	-$(RANLIB) $@

$(LIBOBJS) $(PDCOBJS) : $(PDCURSES_HEADERS)
$(PDCOBJS) : $(PDCURSES_SDL_H)
$(DEMOS) : $(PDCURSES_CURSES_H) $(LIBCURSES)
tui.o tuidemo.o : $(PDCURSES_CURSES_H)
terminfo.o: $(TERM_HEADER)
panel.o ptest: $(PANEL_HEADER)

$(LIBOBJS) : %.o: $(srcdir)/%.c
	$(BUILD) $(SFLAGS) -c $<

$(PDCOBJS) : %.o: $(osdir)/%.c
	$(BUILD) $(SFLAGS) -c $<
