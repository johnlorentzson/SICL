(cl:in-package #:asdf-user)

(defsystem #:sicl-boot-phase-5
  :depends-on (#:sicl-boot-base
               #:sicl-clos-boot-support)
  :serial t
  :components
  ((:file "packages")
   (:file "environment")
   (:file "import-from-host")
   (:file "enable-typep")
   (:file "enable-object-creation")
   (:file "enable-method-combinations")
   (:file "enable-defgeneric")
   (:file "enable-defmethod")
   (:file "enable-defclass")
   (:file "prepare-this-phase")
   (:file "create-additional-generic-functions")
   (:file "create-additional-classes")
   (:file "hir-evaluator-configuration")
   (:file "boot")))
