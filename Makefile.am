lisp_files := $(wildcard *.el)
lisp_LISP = $(lisp_files)

PHONY=check check-short clean dist distclean test

EXTRA_DIST = $(lisp_files) $(test_files) README.md
GIT2CL ?= git2cl

#: Run all tests
check: $(test-files)
	$(MAKE) -C test check

#: Run all tests with minimum verbosity
check-short:
	$(MAKE) -C test check 2>&1  | ruby test/make-check-filter.rb


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

CR_EXCEPTIONS=copyright_exceptions
#: Check for GNU Copyrights.
check_copyrights:
	@echo "Compute exceptions >$(CR_EXCEPTIONS)~"
	@export LANG=C;							\
	find . -name '.git' -prune -o -name '*.el' -print0 |		\
	    xargs -0 grep -L 'Free Software Foundation, Inc' |		\
	    grep -v '\(\.dir-locals\|.-\(pkg\|autoloads\)\)\.el$$';	\
	find . -name '.git' -prune -o -name '*.el' -print |		\
	    while read f; do						\
	        fquoted="$$(echo $$f|tr '|' '_')";			\
	        sed -n -e '/[Cc]opyright.*, *[1-9][-0-9]*,\?$$/N'	\
	            -e '/Free Software Foundation/d'			\
	            -e "s|^\\(.*[Cc]opyright\\)|$$fquoted:\\1|p" 	\
	           "$$f";						\
	    done | sort >$(CR_EXCEPTIONS)~
	diff -u "$(CR_EXCEPTIONS)" "$(CR_EXCEPTIONS)~"
