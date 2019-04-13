(cl:in-package #:sicl-alternative-extrinsic-environment)

(defmethod cleavir-cst-to-ast:convert-global-function-reference
    (cst info (environment environment) system)
  (cleavir-ast:make-constant-fdefinition-ast
   (cleavir-env:name info) :origin (cst:source cst)))

(defmethod cleavir-cst-to-ast:convert-special-variable
    (cst info (environment environment) system)
  (cleavir-ast:make-constant-symbol-value-ast
   (cleavir-env:name info) :origin (cst:source cst)))
