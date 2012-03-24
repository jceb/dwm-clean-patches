include config.mk
VVERSION=$(shell echo $(VERSION)|sed -e 's/-tip$$//')

.PHONY: all build clean cleanconfigh

all: build

build: .hg/patches .hg/patches/README ./clean.sh
	mkdir -p $(VVERSION)
	./clean.sh $(VVERSION) $(args)

clean:
	-rm -rf $(VVERSION)
	-rm -f *.rej *.orig
