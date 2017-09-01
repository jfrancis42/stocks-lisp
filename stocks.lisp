(in-package #:stocks)

(defmacro cdr-assoc (name alist)
  "Replaces '(cdr (assoc name alist))' because it's used a bajillion
times when doing API stuff."
  `(cdr (assoc ,name ,alist :test #'equal)))

(defmacro string-to-float (alist-key alist)
  "Converts the string representation of a value in an alist to a float."
  `(setf (cdr-assoc ,alist-key ,alist) (parse-number:parse-number (cdr-assoc ,alist-key ,alist))))

(defun get-stock (stock)
  "Given a stock (examples: PANW, CHKP), return the available data for
that stock from the Google Finance API."
  (let ((quote nil))
    (setf quote
	  (first
	   (json:decode-json-from-string
	    (subseq
	     (first
	      (multiple-value-list
	       (drakma:http-request
		(concatenate 'string "https://finance.google.com/finance/info?client=ig&q=" stock)
		:method :get)))
	     4))))
    (string-to-float :l quote)
    (string-to-float :l--fix quote)
    (string-to-float :l--cur quote)
    (string-to-float :s quote)
    (string-to-float :c quote)
    (string-to-float :c--fix quote)
    (string-to-float :cp quote)
    (string-to-float :cp--fix quote)
    (string-to-float :pcls--fix quote)
    (string-to-float :el quote)
    (string-to-float :el--fix quote)
    (string-to-float :el--cur quote)
    (string-to-float :ec quote)
    (string-to-float :ec--fix quote)
    (string-to-float :ecp quote)
    (string-to-float :ecp--fix quote)
    quote))
