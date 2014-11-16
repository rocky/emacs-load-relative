lisp_files := $(wildcard *.el)
lisp_LISP = $(lisp_files)

PHONY=check check-short clean dist distclean test

EXTRA_DIST = $(lisp_files) $(test_files) README.md THANKS COPYING
GIT2CL ?= git2cl

#: Run all tests
check: $(test-files)
	$(MAKE) -C test check

#: Run all tests with minimum verbosity
check-short:
	$(MAKE) -C test check 2>&1  | ruby make-check-filter.rb


#: same as check
test: check

#: same as check-short
test-short: check-short

#: Read this first.
README: README.md
	ln -s README.md README

if MAINTAINER_MODE

CL = ChangeLog
#: Create a log file from the individual commits via git2cl
ChangeLog:
	git log --pretty --numstat --summary | $(GIT2CL) > $@

ACLOCAL_AMFLAGS=-I .

endif
