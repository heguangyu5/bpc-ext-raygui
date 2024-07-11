include extension.mk.config

SOURCE_FILES    := $(patsubst %,%.scm,$(SOURCE_LIST))
POPULATION      := $(patsubst %,%_$(SU).o,$(SOURCE_LIST))

C_SOURCE_FILES  := $(patsubst %,%.c,$(C_SOURCE_LIST))
C_POPULATION    := $(patsubst %,%_$(SU).o,$(C_SOURCE_LIST))

CLEFTOVERS      := $(patsubst %.o,%.c,$(POPULATION))

all: unsafe

debug: safe

unsafe:
	UNSAFE=t $(MAKE) all-run

safe:
	UNSAFE=f $(MAKE) all-run

optimize:
	OPTIMIZE=t $(MAKE) unsafe

all-run: mkbuild $(BUILD_DIR)/lib$(LIBNAME)_$(SUV).a $(BUILD_DIR)/lib$(LIBNAME)_$(SUV).so
	echo '(init-$(LIBNAME)-lib)' > $(BUILD_DIR)/$(LIBNAME).sch

mkbuild:
	mkdir -p $(BUILD_DIR)

#  make-lib.o is included because it has the dynamic-load entry point
$(BUILD_DIR)/lib$(LIBNAME)_$(SUV).so: $(BUILD_DIR)/$(LIBNAME).heap $(POPULATION) $(C_POPULATION) make-lib.o
	gcc -shared -o $(BUILD_DIR)/lib$(LIBNAME)_$(SUV).so $(POPULATION) $(C_POPULATION) make-lib.o -L $(BIGLOO_LIB_PATH) $(OTHERLIBS)

$(BUILD_DIR)/lib$(LIBNAME)_$(SUV).a: $(BUILD_DIR)/$(LIBNAME).heap $(POPULATION) $(C_POPULATION)
	ar rv $(BUILD_DIR)/lib$(LIBNAME)_$(SUV).a $(POPULATION) $(C_POPULATION)

$(BUILD_DIR)/$(LIBNAME).heap: $(SOURCE_FILES) .afile make-lib.scm
	$(BIGLOO) -unsafe -mkaddheap -mkaddlib -L $(BIGLOO_LIB_PATH) -heap-library $(LIBNAME) make-lib.scm -addheap $(BUILD_DIR)/$(LIBNAME).heap

make-lib.o: make-lib.scm
	$(BIGLOO) -L $(BIGLOO_LIB_PATH) $(BIGLOO_GLIB_CFLAGS) -copt -fPIC -rm $(BCFLAGS) -mkaddlib -dload-sym -c make-lib.scm

.afile: $(SOURCE_FILES)
	$(BGLAFILE) `realpath $(SOURCE_FILES)` -o $@

make-lib.scm: $(SOURCE_FILES)
	@echo 'generate make-lib.scm from SOURCE_LIST'
	@(echo "(module __make-$(LIBNAME)-lib";     \
	  echo '    (import';                       \
	  for i in $(SOURCE_LIST); do echo "        $$i"; done; \
	  echo '    ))';) > $@

install:
	install -m 644 $(BUILD_DIR)/*.sch         /usr/local/lib
	install -m 644 $(BUILD_DIR)/*.heap        /usr/local/lib
	install -m 644 $(BUILD_DIR)/*_[su]*.so    /usr/local/lib
	install -m 644 $(BUILD_DIR)/*_[su]*.a     /usr/local/lib

clean-run:
	rm -f .afile make-lib.* *.o $(CLEFTOVERS)

clean:
	UNSAFE=t $(MAKE) clean-run

clean-debug:
	UNSAFE=f $(MAKE) clean-run

clean-all: clean clean-debug
	rm -rf $(BUILD_DIR)

BCOMMONFLAGS = -mkaddlib -L $(BIGLOO_LIB_PATH) -I $(BIGLOO_LIB_PATH) -L /usr/local/lib -I /usr/local/lib $(BIGLOO_GLIB_CFLAGS) $(PROFILEFLAGS) $(OPTIMIZEFLAGS) -library php-runtime $(BCFLAGS) -copt -fPIC -rm
CCOMMONFLAGS = -L$(BIGLOO_LIB_PATH) -I$(BIGLOO_LIB_PATH) $(C_GLIB_CFLAGS) $(C_SOURCE_FLAGS) -fPIC

%_s.o : %.scm
	$(BIGLOO) $(BCOMMONFLAGS) -unsafev -gbdb3 -cg -c $< -o $@

%_u.o : %.scm
	$(BIGLOO) $(BCOMMONFLAGS) -unsafe -srfi unsafe -O6 -c $< -o $@

%_s.o : %.c
	$(CC) $(CCOMMONFLAGS) -g -c $< -o $@

%_u.o : %.c
	$(CC) $(CCOMMONFLAGS) -O3 -c $< -o $@
