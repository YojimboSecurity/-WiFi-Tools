.PHONY: build install clean

default: build

help:
	@echo "make build"
	@echo "       Build the project"
	@echo "make clean"
	@echo "       Clean the project"

build:
	@echo "Building wifitools"
	cp wifitools AppDir/usr/bin/wifitools
	cp -r lib AppDir/usr/lib/yojimbosecurity
	sed -i "s/.\/lib\/logging.sh/\/usr\/lib\/yojimbosecurity\/logging.sh/g" AppDir/usr/bin/wifitools
	cp -r lib/* AppDir/usr/lib/yojimbosecurity/
	sed -i "s/.\/lib\/color.sh/\/usr\/lib\/yojimbosecurity\/color.sh/g" AppDir/usr/lib/yojimbosecurity/logging.sh
	ARCH=x86_64 appimagetool AppDir
	@echo "Done"

install:
	@echo "Installing wifitools"
	./wifitools-x86_64.AppImage

clean:
	@echo "Cleaning the project"
	rm -rf *.AppImage
	rm -rf AppDir/usr/lib/yojimbosecurity
	rm AppDir/usr/bin/wifitools
	@echo "Done"
