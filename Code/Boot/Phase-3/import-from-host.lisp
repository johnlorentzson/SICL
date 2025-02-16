(cl:in-package #:sicl-boot-phase-3)

(defun import-number-functions (e3)
  (import-functions-from-host
   '(+ - < <= = /= floor 1+ 1-
     ;; ZEROP is used in CLOS to compute the discriminating function.
     zerop
     ;; RANDOM is used to create a hash code for standard
     ;; objects.
     random)
   e3))

(defun import-cons-functions (e3)
  (import-functions-from-host
   '(;; SECOND is used in many places
     second
     ;; THIRD is used by the expansion of DEFMETHOD
     third
     ;; NTH is used at run time in CLOS.
     nth
     ;; CAR, CDR, FIRST, and REST are used in many places.
     car cdr first rest
     ;; CADR is generated by the expander for REMF, and REMF is used
     ;; in CLOS.
     cadr
     ;; CDDR is used at run time in CLOS.
     cddr
     ;; CONSP is used at run time in CLOS.
     consp
     ;; ATOM is used at run time in CLOS.
     atom
     ;; LISTP is used at run time in CLOS.
     listp
     ;; NULL is used in many places at run time.
     null
     ;; ENDP is used in the expansion of LOOP.
     endp
     ;; CONS is used in many places at run time.
     cons
     ;; LIST is used in many places at run time.
     list
     ;; LIST* is used in CLOS at run time.
     list*
     ;; APPEND is used at run time in several places.
     append
     ;; MAKE-LIST is used in CLOS at run time.
     make-list
     ;; COPY-LIST is used in CLOS at run time, for instance in
     ;; ENSURE-CLASS and ENSURE-GENERIC-FUNCTION.
     copy-list
     ;; CDDDR is generated by the expander for REMF, and REMF is used
     ;; in CLOS.
     cdddr)
   e3))

(defun import-code-utilities (e3)
  (import-functions-from-host
   '(cleavir-code-utilities:proper-list-p
     cleavir-code-utilities:extract-required
     cleavir-code-utilities:canonicalize-generic-function-lambda-list)
   e3))

(defun import-misc (e3)
  (import-functions-from-host
   '(slot-unbound
     no-applicable-method
     sicl-method-combination:define-method-combination-expander
     shared-initialize initialize-instance reinitialize-instance
     closer-mop:method-function
     sicl-clos:parse-defmethod sicl-clos:canonicalize-specializers
     (setf env:macro-function)
     coerce)
   e3)
  (setf (env:macro-function (env:client e3) e3 'defpackage)
        (lambda (form env)
          (declare (ignore env))
          (eval form)
          nil)))

(defun import-sequence-functions (e3)
  (import-functions-from-host
   '(;; FIND-IF-NOT is used in COMPUTE-EFFECTIVE-SLOT-DEFINITION to
     ;; determine whether a slot has an :INITFORM.
     find-if-not
     ;; FIND-IF is used in ADD-METHOD to determine whether an existing
     ;; method needs to be removed before the new one is added.
     find-if
     ;; REMOVE-DUPLICATES and REDUCE are used in order to compute all
     ;; superclasses of a given class, for the purpose of computing
     ;; the class precedence list.  This is done by appending the
     ;; class precedence lists of the superclasses and then removing
     ;; duplicates.
     remove-duplicates reduce
     ;; FIND is used in the computation of the class precedence list
     find
     ;; REMOVE is used at compile time to parse DEFGENERIC forms, and
     ;; in several places in CLOS at run time.
     remove
     ;; SORT is used in CLOS at run time to compute the discriminating
     ;; automaton.
     sort
     ;; SUBSEQ is used at compile time to parse DEFMETHOD forms, and
     ;; at run time in several places in CLOS, like to compute
     ;; applicable methods and to compute the discriminating function.
     subseq
     ;; POSITION is used at run time by CLOS to compute applicable methods
     ;; and to determine which of two specializers is more specific.
     position
     ;; REVERSE is used in several places at run time, for instance
     ;; for computing class precedence lists.
     reverse
     ;; COUNT is used in CLOS in order to finalize inheritance.
     count
     ;; LENGTH is used in various places at run time, such as in CLOS for
     ;; SHARED-INITIALIZE.
     length)
   e3))

(defun import-from-host (e3)
  (import-number-functions e3)
  (import-cons-functions e3)
  (import-code-utilities e3)
  (import-misc e3)
  (import-sequence-functions e3))
