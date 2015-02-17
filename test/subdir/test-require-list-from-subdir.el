;; Copyright (C) 2015 Free Software Foundation, Inc

;; Author: Rocky Bernstein <rocky@gnu.org>

;; This program is free software; you can redistribute it and/or modify
;; it under the terms of the GNU General Public License as published by
;; the Free Software Foundation, either version 3 of the License, or
;; (at your option) any later version.

;; This program is distributed in the hope that it will be useful,
;; but WITHOUT ANY WARRANTY; without even the implied warranty of
;; MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
;; GNU General Public License for more details.

;; You should have received a copy of the GNU General Public License
;; along with this program.  If not, see <http://www.gnu.org/licenses/>.
(require 'cl)
(require 'test-unit)
(load-file "../../load-relative.el")

(test-unit-clear-contexts)

(context "load-relative-list-from-subdir"
	 (tag load-relative-list-from-subdir)
	 (if (featurep 'require-file1)
	     (unload-feature 'require-file1))
	 (specify "relative-relative-list"
		  (require-relative-list '("../require-file1"))
		  (assert-t (featurep 'require-file1))
		  )

)

(test-unit "load-relative-list-from-subdir")
