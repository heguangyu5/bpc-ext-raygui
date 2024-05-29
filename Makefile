# library name
# this will be the name used in bpc.conf or -u on the commandline
LIBNAME = php-raygui

BUILD_DIR = ./build

# this should list all scheme files to be included in the library
# leave off .scm, however, since the list is used to generate other
# file names as well.
SOURCE_LIST     = php-raygui

# C source files
C_SOURCE_LIST   = raygui

# libraries that should be in the dependency list for the shared lib
# for this extension, so that dlopen() loads them
OTHERLIBS = -lraylib

# these flags are C flags passed to bigloo, and should be in the form "-copt CFLAGS"
# bigloo will pass them on to the C compiler
BCFLAGS =

# these flags are passed directly to the C compiler
C_SOURCE_FLAGS  = -DRAYGUI_IMPLEMENTATION -Wno-unused-result

# include common extension makefile
include extension.mk
