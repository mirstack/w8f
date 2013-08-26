PROJECT=w8f
VERSION_MAJOR=0
VERSION_MINOR=1
VERSION_PATCH=0
VERSION=$(VERSION_MAJOR).$(VERSION_MINOR).$(VERSION_PATCH)
MACHINE=unix-noarch

-include config.mk

all:
	@echo Nothing to do...

install: BIN_DIR=$(PREFIX)/bin
install:
	install -d $(BIN_DIR)
	install -m 0755 bin/* $(BIN_DIR)/

install-man: MAN1_DIR=$(PREFIX)/share/man/man1
install-man: install man
	install -d $(MAN1_DIR)
	install -m 0644 man/*.1 $(MAN1_DIR)/

pack: PREFIX=tmp
pack: test version install-man
	mkdir -p pkg
	cd tmp/ && $(ZIP) -r ../pkg/$(PROJECT)-$(VERSION)-$(MACHINE).zip bin share
	rm -r tmp

man:
ifdef RONN
	$(RONN) --manual="Mir's $(PROJECT) manual" --organization='Mir' man/*.ronn
else
	@echo "Package providing 'ronn' is not installed. Skipping man page docs."
endif

version:
	sed -i 's/^VERSION=.*$$/VERSION="$(VERSION)"/' bin/w8f

test:
	$(BASH) ./test/test.sh

.PHONY: all deps install install-man test version pack man
