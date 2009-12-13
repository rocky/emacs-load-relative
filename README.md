# Emacs relative-file load, require __FILE__ and a _provide-me_ macro.

Here we add functions: *load-relative*, *require-relative*,
*require-relative-list*, *==__FILE__==*, and macro *provide-me*.

The latest version is at "http://github.com/rocky/emacs-load-relative/"://github.com/rocky/emacs-load-relative/

## __FILE__

__FILE__ returns the file name that that the calling program is
running.  If you are _eval_'ing a buffer then the file name of that
buffer is used. The name was selected to be analogous to the name its use in C or Ruby.

## load-relative

load-relative loads an Emacs Lisp file relative to another (presumably currently running) Emacs Lisp file. For example if you have files foo.el and bar.el in the same directory, then to load Emacs Lisp file bar.el from inside Emacs lisp file foo.el:

 (require 'load-relative)
 (load-relative "baz")

That _load-relative_ line could above have also been written as:

 (load-relative "./baz")

or:

 (load-relative "baz.el")  # if you want to exclude any byte-compiled files

## require-relative, require-relative-list

If instead of loading file _baz_, you want to _require_ it:

 (require-relative "baz")

or 

 (require-relative "./baz")

The above not only does a _require_ on 'baz, but makes sure you get
that from the same file as you would have if you had issued load_relative.

If you have a list of files you want to _require_, you can require
them one shot using _require-relative-list_ like this:

 (require-relative-list '("dbgr-init" "dbgr-fringe"))

## provide-me

Finally, macro provide-me saves you the trouble of adding a symbol
after provide, by using the file basename (without directory or file
extension) as the name of the thing you want to provide. Using this
forces the provide names to be the same as the filename, but I
consider that a good thing.
