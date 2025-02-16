(cl:in-package #:sicl-boot-phase-3)

(defun boot (boot)
  (format *trace-output* "Start phase 3~%")
  (with-accessors ((e1 sicl-boot:e1)
                   (e2 sicl-boot:e2)
                   (e3 sicl-boot:e3))
      boot
    (change-class e3 'environment)
    (change-class (env:client e3) 'client)
    (let ((sicl-client:*client* (make-instance 'client)))
      (import-from-host e3)
      (pre-fill-environment e3)
      (prepare-this-phase e1 e2 e3)
      (load-source-file "Structure/packages.lisp" e3)
      (load-source-file "Symbol/symbol-value-etc-defuns.lisp" e3)
      (sicl-boot:create-accessor-defgenerics e3)
      (sicl-boot:create-mop-classes e3)
      (setf (env:find-class (env:client e3) e3 'symbol) (find-class 'symbol))
      (load-source-file "CLOS/class-readers-forward-referenced-class-defmethods.lisp" e3)
      (load-source-file "CLOS/class-readers-defmethods-before.lisp" e3))))
