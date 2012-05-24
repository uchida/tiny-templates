# compiler
#CC :=
CFLAGS := -std=c99 -W -Wall -Wextra
CPPFLAGS := 
LDFLAGS := -std=c99

sources := $(wildcard *.c)
programs := 
libraries :=

objects = $(sources:.c=.o)
dependencies = $(sources:.c=.d)

modules :=
include_dirs := $(modules)
CPPFLAGS += $(addprefix -I,$(include_dirs))

# default target
default: all

# include config.mk for modules
-include $(addsuffix /config.mk,$(modules))

# targets
#programs +=

.PHONY: all
all: $(programs)

.PHONY: libraries
libraries: $(libraries)

# clean
.PHONY: clean
clean:
	$(RM) $(objects)
	$(RM) $(dependencies)
	find . -name '*~' -delete
	@find . -name '.AppleDouble' -delete

# make dependencies
ifneq "$(MAKECMDGOALS)" "clean"
 -include $(dependencies)
endif
GCC := gcc
%.d: %.c
	$(GCC) -MM -MD -MP $(CPPFLAGS) $< -o $@

# syntax check for flymake
.PHONY: check-syntax
check-syntax:
	$(GCC) $(CFLAGS) -fsyntax-only $(SOURCES)
