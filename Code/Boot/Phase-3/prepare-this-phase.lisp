(cl:in-package #:sicl-boot-phase-3)

(defun prepare-this-phase (e1 e2 e3)
  (enable-class-initialization e3)
  (enable-defclass e1 e2 e3)
  (enable-defmethod e1 e2 e3))
