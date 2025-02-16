(cl:in-package #:sicl-boot-condition-system)

(defun import-function (e5 e name)
  (env:import-function (env:client e5) e5 name e))

(defun import-functions (e5 e names)
  (loop for name in names
        do (import-function e5 e name)))

(defun pre-fill-environment (e5 e)
  (sicl-boot:copy-macro-functions e5 e)
  ;; These functions are not used right now, because we are still not
  ;; using file-compilation semantics.
  #+(or)
  (import-functions-from-host
   '((setf env:function-description)
     env:make-simple-function-description
     (setf env:variable-description)
     env:make-constant-variable-description
     env:make-special-variable-description
     (setf env:class-description)
     env:make-class-description)
   e))

(defun define-ast-eval (ecs)
  (setf (env:fdefinition (env:client ecs) ecs 'sicl-boot:ast-eval)
        (lambda (ast)
          (let* ((client (env:client ecs))
                 (code-object (sicl-compiler:compile-ast client ast)))
            (sicl-compiler:tie-code-object client ecs code-object)))))

(defun boot (boot)
  (with-accessors ((e5 sicl-boot:e5)
                   (ecs sicl-boot:ecs))
      boot
    (change-class ecs 'environment :base e5)
    (change-class (env:client ecs) 'client)
    (define-ast-eval ecs)
    (pre-fill-environment e5 ecs)))
