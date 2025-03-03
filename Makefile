CC = cc
# -DNO_SHAPE would disable generation of code for 'shape' setting
# -DNO_ORDER would disable generation of code for 'order' setting
DEFINES=
CFLAGS = -Wall -O2 -Wstrict-prototypes -Wmissing-prototypes -Wno-unused-parameter -Wsign-compare $(DEFINES) #-Wextra
LDFLAGS =
DESTDIR = /usr/local/bin/

OBJS = vi.o ex.o lbuf.o mot.o sbuf.o ren.o dir.o syn.o reg.o led.o \
	uc.o term.o rset.o regex.o cmd.o conf.o

all: vi

conf.o: conf.h

%.o: %.c
	$(CC) -c $(CFLAGS) $<
vi: $(OBJS)
	$(CC) -o $@ $(OBJS) $(LDFLAGS)
clean:
	rm -f *.o vi
install:
	install -p vi $(DESTDIR)neatvi
