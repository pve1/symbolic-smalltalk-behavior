(asdf:defsystem :symbolic-smalltalk-behavior
  :description "Provides Symbolic-smalltalk class behavior."
  :author "Peter von Etter"
  :license "LGPL-3.0"
  :version "0.0.1"
  :serial t
  :components ((:file "behavior"))
  :depends-on (#:symbolic-smalltalk-core
               #:alexandria))
