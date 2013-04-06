lisp_files := $(wildcard *.el)
lisp_LISP = $(lisp_files)

EXTRA_DIST = $(lisp_files) $(test_files) README.textile THANKS COPYING

#: Run all tests
check: $(test-files)
	$(MAKE) -C test check

#: Run all tests with minimum verbosity
check-short:
	$(MAKE) -C test check 2>&1  | ruby make-check-filter.rb


#: Read this first.
README: README.textile
	cp README.textile README

if MAINTAINER_MODE

CL = ChangeLog
#: Create a log file from the individual commits via git2cl
ChangeLog:
	git log --pretty --numstat --summary | $(GIT2CL) > $@

ACLOCAL_AMFLAGS=-I .

endif
