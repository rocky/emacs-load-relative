AC_INIT(emacs-load-relative, 1.3.1,)
AC_CONFIG_SRCDIR(load-relative.el)
AM_INIT_AUTOMAKE([foreign])
AM_MAINTAINER_MODE
AM_MISSING_PROG(GIT2CL, git2cl, $missing_dir)

AC_PATH_PROG(EMACS, emacs, no)
AC_ARG_WITH(emacs, AC_HELP_STRING([--with-emacs],
                  [location of emacs program]), EMACS=$withval)
if test x$EMACS != xno ; then
  $EMACS -batch -q -no-site-file -eval \
  '(if (< emacs-major-version 23)
     (progn
       (error "You need GNU Emacs 23 or better for this package.")
       (kill-emacs 1)
     ))'
  if test $? -ne 0 ; then
    EMACS=no
  fi
fi


##
## Find out where to install the debugger emacs lisp files
##
AM_PATH_LISPDIR
AM_CONDITIONAL(INSTALL_EMACS_LISP, test "x$lispdir" != "x")

AC_CONFIG_FILES([Makefile test/Makefile])
AC_OUTPUT
