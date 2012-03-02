# compiler
#CC=
CFLAGS=-std=c99 -W -Wall -Wextra
CPPFLAGS=-I.
LDFLAGS=-std=c99

# targets
.PHONY: all
all: 

# clean
.PHONY: clean
clean:
	$(RM) *.o *.d *~

# make dependencies
SOURCES = $(wildcard *.c)
ifneq "$(MAKECMDGOALS)" "clean"
	-include $(subst .c,.d,$(SOURCES))
endif
GCC = gcc
%.d: %.c
	$(GCC) -MM -MD -MP $(CPPFLAGS) $(TARGET_ARCH) $<
quant:

# syntax check for flymake
.PHONY: check-syntax
check-syntax:
	$(GCC) $(CFLAGS) -fsyntax-only $(SOURCES)

