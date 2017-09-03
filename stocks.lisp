(in-package #:stocks)

(defmacro cdr-assoc (name alist)
  "Replaces '(cdr (assoc name alist))' because it's used a bajillion
times when doing API stuff."
  `(cdr (assoc ,name ,alist :test #'equal)))

(defmacro string-to-float (alist-key alist)
  "Converts the string representation of a value in an alist to a float."
  `(when (cdr-assoc ,alist-key ,alist)
     (setf (cdr-assoc ,alist-key ,alist)
	   (parse-number:parse-number (cdr-assoc ,alist-key ,alist)))))

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
    (mapcar (lambda (a) (string-to-float a quote))
	    (list '(:l :l--fix :l--cur :s :c :c--fix :cp :cp--fix :pcls--fix
		    :el :el--fix :el--cur :ec :ec--fix :ecp :ecp--fix)))
    quote))
