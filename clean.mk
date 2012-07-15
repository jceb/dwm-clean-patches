include config.mk
VVERSION=$(shell hg identify -r $(shell hg qpop -a &> /dev/null; hg identify -i) | awk '{print $$2}')

.PHONY: all build clean cleanconfigh

all: build

build: .hg/patches .hg/patches/README clean.sh
	./clean.sh $(VVERSION) $(args)

clean:
	-rm -rf $(VVERSION)
	-rm -f *.rej *.orig
