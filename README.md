# Emacs relative-file load, require __FILE__ and a _provide-me_ macro.

The rational behind module is to be able to write small Emacs
functions or modules in a larger multi-file Emacs package and
facilitate running from the source tree without having to "install"
the code. See my [NYC Lisp talk](https://github.com/rocky/emacs-load-relative/wiki/NYC-Lisp-talk) for more background on this.


## Contents ##

* [\__FILE__](https://github.com/rocky/emacs-load-relative#file)
* [load-relative](https://github.com/rocky/emacs-load-relative#load-relative)
* [require-relative](https://github.com/rocky/emacs-load-relative#require-relative-require-relative-list)
* [provide-me](https://github.com/rocky/emacs-load-relative#provide-me)

The latest version is at http://github.com/rocky/emacs-load-relative

## \__FILE__

\__FILE__ returns the file name that that the calling program is
running.  If you are *eval*'ing a buffer then the file name of that
buffer is used. The name was selected to be analogous to the name used
in C, Perl, and Ruby.

For an common example of using this, see [How to Insert Demo Code into an Emacs Lisp Module](How-to-Insert-Demo-Code-into-an-Emacs-Lisp-Module).

## load-relative

*load-relative* loads an Emacs Lisp file relative to another
 (presumably currently running) Emacs Lisp file. For example suppose
 you have Emacs Lisp files `foo.el` and `bar.el` in the same directory.
 To load Emacs Lisp file `bar.el` from inside Emacs lisp file `foo.el`:

```lisp
    (require 'load-relative)
    (load-relative "baz")
```

That *load-relative* line could above have also been written as:

```lisp
   (load-relative "./baz")
```

or:

```lisp
   (load-relative "baz.el")  # if you want to exclude any byte-compiled files
```

## require-relative, require-relative-list

Use *require-relative* if you want to *require* the file instead of
*load*'ing it:

```lisp
   (require-relative "baz")
```

or:

```lisp
   (require-relative "./baz")
```

The above not only does a *require* on `'baz`, but makes sure you get
that from the same file as you would have if you had issued
*load_relative*.

Use *require-relative-list* when you have a list of files you want to
*require*. To *require-relative* them in one shot:

```lisp
   (require-relative-list '("dbgr-init" "dbgr-fringe"))
```

## provide-me

Finally, macro *provide-me* saves you the trouble of adding a symbol
after *provide*, by using the file basename (without directory or file
extension) as the name of the thing you want to provide. Using this
forces the *provide* names to be the same as the filename, but I
consider that a good thing. 

*provide-me* also takes an optional string which will be prepended to the provide name. This is useful if you have a multi-file package and want the files to bue prefaced with the name of the package.

Assume your package *foo* and contains simply file `foo.el`. Then
adding:

```lisp
   (provide-me)
```

inside that file is the same thing as writing:

```lisp
   (provide 'foo)
```

Now suppose `foo.el` is part of a larger package called *bar*. Then if
you write: 

```lisp
   (provide-me "bar-")
```

this is the same as writing: 

```lisp
   (provide 'bar-foo)
```
