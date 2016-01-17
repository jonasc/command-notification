# command-notification Makefile
# Simo Mattila <simo.h.mattila at gmail dot com>

GTK_PIDGIN_INCLUDES= `pkg-config --cflags gtk+-2.0 pidgin`

GTK_PREFIX=/usr/local
GTK_PREFIX2=/usr

CFLAGS= -O2 -Wall -fpic -g
LDFLAGS= -shared

INCLUDES = \
      -I$(GTK_PREFIX)/include \
      -I$(GTK_PREFIX)/include/gtk-2.0 \
      -I$(GTK_PREFIX)/include/glib-2.0 \
      -I$(GTK_PREFIX)/include/pango-1.0 \
      -I$(GTK_PREFIX)/include/atk-1.0 \
      -I$(GTK_PREFIX)/lib/glib-2.0/include \
      -I$(GTK_PREFIX)/lib/gtk-2.0/include \
      -I$(GTK_PREFIX2)/include \
      -I$(GTK_PREFIX2)/include/gtk-2.0 \
      -I$(GTK_PREFIX2)/include/glib-2.0 \
      -I$(GTK_PREFIX2)/include/pango-1.0 \
      -I$(GTK_PREFIX2)/include/atk-1.0 \
      -I$(GTK_PREFIX2)/lib/glib-2.0/include \
      -I$(GTK_PREFIX2)/lib/gtk-2.0/include \
      $(GTK_PIDGIN_INCLUDES)

command-notification.so: command-notification.c
	gcc command-notification.c $(CFLAGS) $(INCLUDES) $(LDFLAGS) -o command-notification.so

install: command-notification.so
	cp command-notification.so ~/.purple/plugins/

uninstall:
	rm -f ~/.purple/plugins/command-notification.so

clean:
	rm -f command-notification.so

