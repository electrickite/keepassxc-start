.POSIX:

NAME=keepassxc-start

INSTALL=install
RM=rm -f
SED=sed

PREFIX=/usr/local

.PHONY: all install uninstall clean

all: $(NAME).policy

$(NAME).policy: $(NAME).policy.in
	$(SED) "s|PREFIX|$(PREFIX)|g" < $< | $(SED) "s|NAME|$(NAME)|g" > $@

install:
	@echo Installing in $(DESTDIR)$(PREFIX)
	$(INSTALL) -d $(DESTDIR)/etc/default
	$(INSTALL) -d $(DESTDIR)$(PREFIX)/bin
	$(INSTALL) -d $(DESTDIR)/usr/share/polkit-1/actions
	$(INSTALL) -m 0644 default $(DESTDIR)/etc/default/$(NAME)
	$(INSTALL) -m 0755 $(NAME) $(DESTDIR)$(PREFIX)/bin/
	$(INSTALL) -m 0644 $(NAME).policy $(DESTDIR)/usr/share/polkit-1/actions/

uninstall:
	@echo Removing files from $(DESTDIR)$(PREFIX)
	$(RM) $(DESTDIR)/etc/default/$(NAME)
	$(RM) $(DESTDIR)$(PREFIX)/bin/$(NAME)
	$(RM) $(DESTDIR)/usr/share/polkit-1/actions/$(NAME).policy

clean:
	@echo Cleaning build files
	$(RM) $(NAME).policy
