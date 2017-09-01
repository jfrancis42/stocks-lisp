;;;; stocks.asd

(asdf:defsystem #:stocks
  :description "A library for pulling data from Google's stock API."
  :author "Jeff Francis <jeff@gritch.org>"
  :license "MIT, see file LICENSE"
  :depends-on (#:drakma
               #:babel
               #:cl-json)
  :serial t
  :components ((:file "package")
               (:file "stocks")))

