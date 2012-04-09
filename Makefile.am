lisp_files := $(wildcard *.el)
test_files := $(wildcard test/test-*.el)

EXTRA_DIST = $(lisp_files) $(test_files) README.textile COPYING

CHECK_FILES = $(notdir $(test_files:.el=.run))

lisp_LISP = $(lisp_files)

check: $(CHECK_FILES) test-require-list-from-subdir.run


#: Read this first.
README: README.textile
	cp README.textile README

# FIGURE out how to DRY the run rules.
#: Run test-load test
test-load.run:
	(cd $(srcdir)/test && $(EMACS) -batch -Q -l $(@:.run=.el) )

#: Run test-require-list test
test-require-list.run:
	(cd $(srcdir)/test && $(EMACS) -batch -Q -l $(@:.run=.el) )

#: Run test-require-list-from-subdur test
test-require-list-from-subdir.run:
	(cd $(srcdir)/test/subdir && $(EMACS) -batch -Q -l $(@:.run=.el) )

.PHONY: $(CHECK_FILES)

if MAINTAINER_MODE

CL = ChangeLog
#:Create a log file from the individual commits via git2cl
ChangeLog:
	git log --pretty --numstat --summary | $(GIT2CL) > $@

ACLOCAL_AMFLAGS=-I .

endif

#: same thing as "check"
test: check
