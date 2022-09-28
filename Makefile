.PHONY: build clean

default: build

help:
	@echo "make build"
	@echo "       Build the project"
	@echo "make clean"
	@echo "       Clean the project"

build:
	@echo "Building the project"
	appimage-builder --recipe AppImageBuilderReciept.yml
	@echo "Done"

clean:
	@echo "Cleaning the project"
	rm -rf AppDir
	@echo "Done"
