(defpackage :symbolic-smalltalk-behavior
  (:local-nicknames (:core :symbolic-smalltalk-core))
  (:use :cl))

(in-package :symbolic-smalltalk-behavior)

;;; Object

(core:define-method (core:object class)
  (core:class self))

(core:define-method (core:object :does-not-understand message)
  (error 'core:message-not-understood
         :recipient self
         :message message))

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

;;; Message

(core:define-method (core:message recipient)
  (core:message-recipient self))

(core:define-method (core:message :recipient recipient)
  (setf (core:message-recipient self) recipient)
  self)

(core:define-method (core:message selector)
  (core:message-selector self))

(core:define-method (core:message :selector selector)
  (setf (core:message-selector self) selector)
  self)

(core:define-method (core:message arguments)
  (core:message-arguments self))

(core:define-method (core:message :arguments arguments)
  (setf (core:message-arguments self) arguments)
  self)
