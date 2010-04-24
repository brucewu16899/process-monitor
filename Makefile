
CFLAGS = -Wall -Werror -g
LDFLAGS = -lutil
PROG = child-monitor
PROG_MAN = $(PROG).1

%.1: %.pod
	pod2man \
		--center="User Commands" \
		--release="User Commands" \
		$< $@

.PHONY: default
default: $(PROG) $(PROG_MAN)

install: default
	cp $(PROG) /usr/local/bin/
	cp $(PROG_MAN) /usr/local/share/man/man1/

.PHONY: clean
clean:
	rm -f $(PROG) $(PROG_MAN)
