# stocks-lisp
A Common Lisp client for pulling stock information from Google's public stock API.

This is a trivial package (it is, in fact, one single line of CL code), but saves having to re-invent the wheel each time you need some basic stock data. Note that all values are returned as strings. If you need integers or floats, you'll have to convert the returned values yourself.

````
CL-USER> (stocks:get-stock "PANW")
(((:ID . "397082540983823") (:T . "PANW") (:E . "NYSE") (:L . "147.20")
  (:L--FIX . "147.20") (:L--CUR . "147.20") (:S . "0") (:LTT . "3:26PM EDT")
  (:LT . "Sep 1, 3:26PM EDT") (:LT--DTS . "2017-09-01T15:26:08Z")
  (:C . "+14.51") (:C--FIX . "14.51") (:CP . "10.94") (:CP--FIX . "10.94")
  (:CCOL . "chg") (:PCLS--FIX . "132.69")))
CL-USER>
````

I won't pretend to understand every one of these returned values, I wrote this mostly to grab :L and :C. I assume anyone familiar with stock trading can make use of the rest of the returned values.
