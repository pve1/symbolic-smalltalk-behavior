(defpackage :symbolic-smalltalk-behavior
  (:local-nicknames (:core :symbolic-smalltalk-core))
  (:use :cl))

(in-package :symbolic-smalltalk-behavior)

;;; Object

(core:define-method (core:object class)
  (core:class self))

(defmethod core:does-not-understand ((recipient core:object) arguments function)
  (call-next-method))

;;; Behavior

(core:define-method (core:behavior new)
  (core:new self))

(core::define-method (core:behavior basic-new)
  (core:basic-new self))

(core:define-method (core:behavior inst-var-names)
  (core:instance-variables self))

(core:define-method (core:behavior class-var-names)
  (core:class-variables self))

;; Object class :add-selector '(:x x :y y)
;;              :with-lambda '(lambda (self x y) ...)

(core:define-method (core:behavior :add-selector selector
                                   :with-lambda lambda-form)
  (core:add-method-to-class self selector lambda-form))

(core:define-method (core:behavior :remove-selector selector)
  (core:remove-method-from-class self selector))

(core:define-method (core:behavior :add-slot-accessor slot-name)
  (core:add-slot-accessor self slot-name))

(core:define-method (core:class :subclass name)
  (core:subclass self name))

(core:define-method (core:class :subclass name
                                :instance-variable-names instance-variables
                                :class-variable-names class-variables)
  (core:subclass self name
                 :instance-variables instance-variables
                 :class-variables class-variables))
