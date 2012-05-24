lib_dir := $(dir $(lastword $(MAKEFILE_LIST)))
lib := $(lib_dir)lib{name}.a
lib_sources := $(wildcard $(lib_dir)*.c)
lib_objects := $(lib_sources:.c=.o)
$(lib): $(lib_objects)
	libtool -o $@ -static $^

libraries += $(lib)
sources += $(lib_sources)

objects += $(lib_objects)
dependencies += $(lib_sources:.c=.d)
