;;; test-file.el --- Simple test for load-relative

;; Copyright (C) 2015  Free Software Foundation, Inc.

;; This program is free software: you can redistribute it and/or modify
;; it under the terms of the GNU General Public License as published by
;; the Free Software Foundation, either version 3 of the License, or
;; (at your option) any later version.

;; This program is distributed in the hope that it will be useful,
;; but WITHOUT ANY WARRANTY; without even the implied warranty of
;; MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
;; GNU General Public License for more details.

;; You should have received a copy of the GNU General Public License
;; along with GNU Emacs.  If not, see <http://www.gnu.org/licenses/>.

;;; Commentary:

;;; Code:

(load-file "../load-relative.el")

(require 'ert)


(ert-deftest test-name ()
  (should
   ;; not sure how I can test the full path here because, well, I need to
   ;; resolve a relative path to do so...
   (equal
    "simple.txt"
    (let ((bf
           (find-file-noselect-relative "simple.txt")))
      (kill-buffer bf)
      (file-name-nondirectory
       (buffer-file-name bf))))))

(ert-deftest test-contents ()
  (should
   (equal
    "simple\n"
    (let* ((bf
            (find-file-noselect-relative "simple.txt"))
           (ct
            (with-current-buffer
                bf
              (buffer-string))))
      (kill-buffer bf)
      ct))))

(ert-deftest test-contents-with-relative-file ()
  (should
   (equal
    "simple\n"
    (with-relative-file
        "simple.txt"
      (buffer-string)))))

(provide 'test-file)

;;; test-file.el ends here
