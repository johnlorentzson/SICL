(cl:in-package #:sicl-boot-phase-6)

(defun load-ctype (e5)
  (import-functions-from-host '(map substitute) e5)
  (load-source-file "Arithmetic/realp-defgeneric.lisp" e5)
  (load-source-file "Arithmetic/rationalp-defgeneric.lisp" e5)
  (load-source-file "Arithmetic/floatp-defgeneric.lisp" e5))
