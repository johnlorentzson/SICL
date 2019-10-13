(cl:in-package #:sicl-boot)

(defun boot ()
  (let ((boot (make-instance 'boot
                :e0 (make-instance 'environment)
                :e1 (make-instance 'environment)
                :e2 (make-instance 'environment)
                :e3 (make-instance 'environment)
                :e4 (make-instance 'environment)
                :e5 (make-instance 'environment)
                :e6 (make-instance 'environment))))
    (import-function-from-host 'format (e1 boot))
    (import-function-from-host 'format (e2 boot))
    (import-function-from-host 'format (e3 boot))
    (import-function-from-host 'format (e4 boot))
    (import-function-from-host 'format (e5 boot))
    (import-function-from-host 'format (e6 boot))
    (import-function-from-host 'break (e1 boot))
    (import-function-from-host 'break (e2 boot))
    (import-function-from-host 'break (e3 boot))
    (import-function-from-host 'break (e4 boot))
    (import-function-from-host 'break (e5 boot))
    (import-function-from-host 'break (e6 boot))
    (setf (sicl-genv:special-variable '*trace-output* (e1 boot) t)
          *trace-output*)
    (setf (sicl-genv:special-variable '*trace-output* (e2 boot) t)
          *trace-output*)
    (setf (sicl-genv:special-variable '*trace-output* (e3 boot) t)
          *trace-output*)
    (setf (sicl-genv:special-variable '*trace-output* (e4 boot) t)
          *trace-output*)
    (setf (sicl-genv:special-variable '*trace-output* (e5 boot) t)
          *trace-output*)
    (sicl-boot-phase-0:boot boot)
    (sicl-boot-phase-1:boot boot)
    (sicl-boot-phase-2:boot boot)
    (sicl-boot-phase-3:boot boot)
    (sicl-boot-phase-4:boot boot)
    (sicl-boot-phase-5:boot boot)
    boot))
