(cl:in-package #:asdf-user)

(defsystem sicl-arithmetic-defuns
  :serial t
  :components
  ((:file "ceiling-defun")
   (:file "convert-fixnum-to-bignum-defun")
   (:file "divide-by-defun")
   (:file "equal-defun")
   (:file "evenp-defun")
   (:file "floor-defun")
   (:file "gcd-defun")
   (:file "greater-defun")
   (:file "greater-or-equal-defun")
   (:file "integerp-defun")
   (:file "lcm-defun")
   (:file "less-defun")
   (:file "less-or-equal-defun")
   (:file "logandc1-defun")
   (:file "logandc2-defun")
   (:file "logand-defun")
   (:file "logior-defun")
   (:file "lognand-defun")
   (:file "lognor-defun")
   (:file "lognot-defun")
   (:file "logorc1-defun")
   (:file "logorc2-defun")
   (:file "logxor-defun")
   (:file "max-defun")
   (:file "min-defun")
   (:file "minus-defun")
   (:file "minusp-defun")
   (:file "mod-defun")
   (:file "multiply-defun")
   (:file "not-equal-defun")
   (:file "oddp-defun")
   (:file "one-minus-defun")
   (:file "one-plus-defun")
   (:file "plus-defun")
   (:file "plusp-defun")
   (:file "rem-defun")
   (:file "round-defun")
   (:file "times-defun")
   (:file "truncate-defun")
   (:file "upgraded-complex-part-type-defun")
   (:file "zerop-defun")))
