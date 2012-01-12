# MAKEFILE
# ACDT

PKG = acdt
LIB = $(DESTDIR)/usr/share/$(PKG)
BIN = $(DESTDIR)/usr/bin
CONF = $(DESTDIR)/etc/$(PKG)

all:
	echo "Available methods :"
	echo "  install"
	echo "  uninstall"
	echo "  deb"
	echo "  deb-clean"

clean:

install:
	install -o root -g root -m 2775 -d $(CONF) $(BIN) $(LIB)
	install -o root -g root -m 775 bin/* $(BIN)
	install -o root -g root -m 664 lib/* $(LIB)
	install -o root -g root -m 2775 -d $(CONF)/projects $(CONF)/templates $(CONF)/work
	install -o root -g root -m 664 files/template-project.conf $(CONF)/templates/
	install -o root -g root -m 775 -d $(DESTDIR)/usr/share/doc/acdt
	install -o root -g root -m 664 docs/* $(DESTDIR)/usr/share/doc/acdt

uninstall:
	rm -f /usr/bin/acdt-*
	rm -rf /usr/share/acdt
	rm -rf /usr/share/doc/acdt

deb:
	debuild -uc -us
#	debuild -sa

deb-clean:
	fakeroot debian/rules clean
	#rm -f ../$(PKG)_*
