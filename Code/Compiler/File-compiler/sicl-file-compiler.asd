(cl:in-package #:asdf-user)

(defsystem #:sicl-file-compiler
  :depends-on (#:concrete-syntax-tree
               #:eclector
               #:cleavir-code-utilities
               #:cleavir-generate-ast
               #:cleavir-cst-to-ast)
  :serial t
  :components
  ((:file "packages")))
