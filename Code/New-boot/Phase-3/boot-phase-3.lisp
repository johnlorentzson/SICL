(cl:in-package #:sicl-new-boot-phase-3)

(defclass environment (sicl-minimal-extrinsic-environment:environment)
  ())

(defclass header (closer-mop:funcallable-standard-object)
  ((%class :initarg :class)
   (%rack :initarg :rack))
  (:metaclass closer-mop:funcallable-standard-class))

(defun activate-class-finalization (boot)
  (with-accessors ((e1 sicl-new-boot:e1)
                   (e2 sicl-new-boot:e2)) boot
    (setf (sicl-genv:special-variable
           'sicl-clos::*standard-direct-slot-definition* e2 t)
          (sicl-genv:find-class 'sicl-clos:standard-direct-slot-definition e1))
    (setf (sicl-genv:special-variable
           'sicl-clos::*standard-effective-slot-definition* e2 t)
          (sicl-genv:find-class 'sicl-clos:standard-effective-slot-definition e1))
    (sicl-genv:fmakunbound 'sicl-clos:direct-slot-definition-class e2)
    (import-functions-from-host
     '(find reverse last remove-duplicates reduce
       mapcar union find-if-not eql count)
     e2)
    (load-file "CLOS/slot-definition-class-support.lisp" e2)
    (load-file "CLOS/slot-definition-class-defgenerics.lisp" e2)
    (load-file "CLOS/slot-definition-class-defmethods.lisp" e2)
    (load-file "CLOS/class-finalization-defgenerics.lisp" e2)
    (load-file "CLOS/class-finalization-support.lisp" e2)
    (load-file "CLOS/class-finalization-defmethods.lisp" e2)))

(defun activate-allocate-instance (boot)
  (with-accessors ((e2 sicl-new-boot:e2)) boot
    (setf (sicl-genv:fdefinition 'sicl-clos::allocate-general-instance e2)
          (lambda (class size)
            (make-instance 'header
              :class class
              :rack (make-array size :initial-element 1000))))
    (setf (sicl-genv:fdefinition 'sicl-clos::general-instance-access e2)
          (lambda (object location)
            (aref (slot-value object '%rack) location)))
    (setf (sicl-genv:fdefinition '(setf sicl-clos::general-instance-access) e2)
          (lambda (value object location)
            (setf (aref (slot-value object '%rack) location) value)))
    (import-functions-from-host
     '((setf sicl-genv:constant-variable) assert sort assoc list* every
       mapc 1+ 1- subseq butlast position identity nthcdr equal
       remove-if-not)
     e2)
    (load-file "CLOS/class-unique-number-offset-defconstant.lisp" e2)
    (load-file "CLOS/allocate-instance-defgenerics.lisp" e2)
    (load-file "CLOS/allocate-instance-support.lisp" e2)
    (load-file "CLOS/allocate-instance-defmethods.lisp" e2)))

(defun boot-phase-3 (boot)
  (format *trace-output* "Start of phase 3~%")
  (with-accessors ((e1 sicl-new-boot:e1)
                   (e2 sicl-new-boot:e2)
                   (e3 sicl-new-boot:e3)) boot
    (change-class e3 'environment)
    (activate-class-finalization boot)
    (activate-allocate-instance boot)
    (load-file "CLOS/discriminating-automaton.lisp" e2)
    (load-file-protected "CLOS/discriminating-tagbody.lisp" e2)
    (setf (sicl-genv:fdefinition 'sicl-clos::general-instance-p e2)
          (lambda (object)
            (typep object 'standard-object)))
    (setf (sicl-genv:fdefinition 'typep e2)
          (lambda (object type-specifier)
            (sicl-genv:typep object type-specifier e2)))
    (load-file "CLOS/classp-defgeneric.lisp" e2)
    (load-file "CLOS/classp-defmethods.lisp" e2)
    (setf (sicl-genv:fdefinition 'class-of e2)
          #'class-of)
    (setf (sicl-genv:fdefinition 'find-class e2)
          (lambda (name)
            (sicl-genv:find-class name e1)))
    (setf (sicl-genv:fdefinition 'sicl-clos:set-funcallable-instance-function e2)
          #'closer-mop:set-funcallable-instance-function)
    (load-file-protected "CLOS/list-utilities.lisp" e2)
    (load-file "CLOS/compute-applicable-methods-support.lisp" e2)
    (load-file "CLOS/compute-applicable-methods-defgenerics.lisp" e2)
    (load-file "CLOS/compute-applicable-methods-defmethods.lisp" e2)
    (load-file "CLOS/compute-effective-method-defgenerics.lisp" e2)
    (load-file "CLOS/compute-effective-method-support.lisp" e2)
    (load-file "CLOS/compute-effective-method-support-a.lisp" e2)
    (define-error-function
        'sicl-clos::method-combination-compute-effective-method e2)
    (load-file "CLOS/compute-effective-method-defmethods.lisp" e2)
    (load-file "CLOS/no-applicable-method-defgenerics.lisp" e2)
    (load-file "CLOS/no-applicable-method.lisp" e2)
    (load-file "CLOS/compute-discriminating-function-defgenerics.lisp" e2)
    (load-file "CLOS/compute-discriminating-function-support.lisp" e2)))
