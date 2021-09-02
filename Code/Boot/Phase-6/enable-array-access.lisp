(cl:in-package #:sicl-boot-phase-6)

(defun enable-array-access (e5)
  (load-source-file "Array/array-limits-defconstants.lisp" e5)
  (load-source-file "Array/array-dimension-defun.lisp" e5)
  (load-source-file "Array/array-total-size-defun.lisp" e5)
  (load-source-file "Array/fill-pointer.lisp" e5)
  (load-source-file "Array/array-row-major-index-defgeneric.lisp" e5)
  (load-source-file "Array/array-row-major-index-defmethods.lisp" e5)
  (load-source-file "Array/row-major-aref-defgenerics.lisp" e5)
  (load-source-file "Array/row-major-aref-defmethods.lisp" e5)
  (load-source-file "Array/aref-defuns.lisp" e5)
  (load-source-file "Array/array-rank-defun.lisp" e5)
  (load-source-file "Array/adjustable-array-p.lisp" e5))
