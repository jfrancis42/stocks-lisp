(in-package #:stocks)

(defun get-stock (stock)
  "Given a stock (examples: PANW, CHKP), return the available data for
that stock from the Google Finance API."
  (json:decode-json-from-string
   (subseq
    (first
     (multiple-value-list
      (drakma:http-request
       (concatenate 'string "https://finance.google.com/finance/info?client=ig&q=" stock)
       :method :get)))
    4)))
