# This Makefile has only been tested on linux.  It uses
# MinGW32 to cross-compile for windows.  To install and
# configure MinGW32 on linux, see
# http://www.mingw.org/MinGWiki/index.php/BuildMingwCross
#
# Marty Lamb
VERSION = `git tag | sort -r| head -n1`

CC=gcc
WIN32_CC=/usr/local/mingw32/bin/mingw32-gcc
CFLAGS=-Wall -pedantic -s -O3

ng: ngclient/ng.c
	@echo "Building ng client.  To build a Windows binary, type 'make ng.exe'"
	${CC} ${CFLAGS} -o ng ngclient/ng.c

ng.exe: ngclient/ng.c
	# any idea why the command line is so sensitive to the order of
	# the arguments?  If CFLAGS is at the beginning, it won't link.
	${WIN32_CC} -o ng.exe ngclient/ng.c -lwsock32 -O3 ${CFLAGS}
	
clean:
	@echo "If you have a Windows binary, 'make clean' won't delete it."
	@echo "You must remove this manually.  Most users won't have MinGW"
	@echo "installed - so I'd rather not delete something they can't rebuild."
	rm ng
#	rm ng.exe
zip:
	git archive --format=zip HEAD plugin/* syntax/* > vim-rspec-$(VERSION).zip
install:
	cp -v plugin/* ~/.vim/plugin/
	cp -v syntax/* ~/.vim/syntax/
