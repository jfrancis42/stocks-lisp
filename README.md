# stocks-lisp
A Common Lisp client for pulling stock information from Google's
public stock API.

This is a trivial package (you could provide equivalent functionality
(minus error checking) in one line of code, if you wanted), but saves
having to re-invent the wheel each time you need some basic stock
data.

````
CL-USER> (stocks:get-stock "PANW")
((:ID . "397082540983823") (:T . "PANW") (:E . "NYSE") (:L . 146.67)
 (:L--FIX . 146.67) (:L--CUR . 146.67) (:S . 2) (:LTT . "4:01PM EDT")
 (:LT . "Sep 1, 4:01PM EDT") (:LT--DTS . "2017-09-01T16:01:36Z") (:C . 13.98)
 (:C--FIX . 13.98) (:CP . 10.54) (:CP--FIX . 10.54) (:CCOL . "chg")
 (:PCLS--FIX . 132.69) (:EL . 146.5) (:EL--FIX . 146.5) (:EL--CUR . 146.5)
 (:ELT . "Sep 1, 4:19PM EDT") (:EC . -0.17) (:EC--FIX . -0.17) (:ECP . -0.12)
 (:ECP--FIX . -0.12) (:ECCOL . "chr") (:DIV . "") (:YLD . ""))
CL-USER> 
````

I won't pretend to understand every one of these returned values, I
wrote this mostly to grab :L and :C. I assume anyone familiar with
stock trading can make use of the rest of the returned values.
