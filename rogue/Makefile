###############################################################################
#
# Makefile for rogue
#
# Rogue: Exploring the Dungeons of Doom
# Copyright (C) 1980-1983, 1985, 1999 Michael Toy, Ken Arnold and Glenn Wichman
# All rights reserved.
#       
# See the file LICENSE.TXT for full copyright and licensing information.
#
###############################################################################
        
###############################################################################
# Site configuration occurs beneath this comment
# Typically ./configure (autoconf tools) configures this section
# This section could be manually configured if autoconf/configure fails
###############################################################################

DISTNAME=rogue5.4.4
PACKAGE_TARNAME = rogue-5.4.4
PROGRAM=rogue

O=o

#CC=gcc
CC    = /Users/roman/WORK/emsdk_portable/emscripten/1.30.0/emcc

#CFLAGS=-O2
CFLAGS= -I../pdcurses/ -s ASYNCIFY=1

#LIBS=-lcurses
LIBS = -L../build/ -lpdcurses

#RM=rm -f
RM    = rm -f

#GROFF=groff
GROFF = groff

#NROFF=nroff
NROFF = nroff

#TBL=tbl
TBL   = tbl

#COLCRT=colcrt
COLCRT = colcrt

#SED=sed
SED   = sed

#SCOREFILE=rogue54.scr
SCOREFILE = rogue.scr

#LOCKFILE=rogue54.lck
LOCKFILE = rogue.lck

#GROUPOWNER=games
GROUPOWNER = 

#CPPFLAGS=-DHAVE_CONFIG_H
CPPFLAGS =-DHAVE_CONFIG_H 

#DISTFILE = $(PROGRAM)
DISTFILE = $(DISTNAME)-i386-apple-darwin14.3.0

INSTALL=./install-sh

#INSTGROUP=-g games
INSTGROUP=
#INSTOWNER=-u root
INSTOWNER=

CHGRP=chgrp

MKDIR=mkdir

TOUCH=touch

RMDIR=rmdir

CHMOD=chmod

DESTDIR=

prefix=/usr/local
exec_prefix=${prefix}
datarootdir=${prefix}/share
datadir=${datarootdir}
bindir=${exec_prefix}/bin
mandir=${datarootdir}/man
docdir=${datarootdir}/doc/${PACKAGE_TARNAME}
man6dir = $(mandir)/man6

###############################################################################
# Site configuration occurs above this comment
# It should not be necessary to change anything below this comment
############################################################################### 

HDRS     = rogue.h extern.h score.h
OBJS1    = vers.$(O) extern.$(O) armor.$(O) chase.$(O) command.$(O) \
           daemon.$(O) daemons.$(O) fight.$(O) init.$(O) io.$(O) list.$(O) \
           mach_dep.$(O) main.$(O) mdport.$(O) misc.$(O) monsters.$(O) \
           move.$(O) new_level.$(O)
OBJS2    = options.$(O) pack.$(O) passages.$(O) potions.$(O) rings.$(O) \
           rip.$(O) rooms.$(O) save.$(O) scrolls.$(O) state.$(O) sticks.$(O) \
           things.$(O) weapons.$(O) wizard.$(O) xcrypt.$(O)
OBJS     = $(OBJS1) $(OBJS2)
CFILES   = vers.c extern.c armor.c chase.c command.c daemon.c \
           daemons.c fight.c init.c io.c list.c mach_dep.c \
           main.c  mdport.c misc.c monsters.c move.c new_level.c \
           options.c pack.c passages.c potions.c rings.c rip.c \
           rooms.c save.c scrolls.c state.c sticks.c things.c \
           weapons.c wizard.c xcrypt.c

.SUFFIXES: .obj

.c.obj:
	$(CC) $(CFLAGS) $(CPPFLAGS) /c $*.c
    
.c.o:
	$(CC) $(CFLAGS) $(CPPFLAGS) -c $*.c
    
$(PROGRAM): $(HDRS) $(OBJS)
	$(CC) $(CFLAGS) $(LDFLAGS) $(OBJS) $(LIBS) -O2 -o $@.bc
    
clean:
	$(RM) $(OBJS1)
	$(RM) $(OBJS2)
	$(RM) $(PROGRAM).bc
