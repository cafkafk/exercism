;;; armstrong-numbers.el --- armstrong-numbers Exercise (exercism)  -*- lexical-binding: t; -*-

;;; Commentary:

;;; Code:

(defun armstrong-p (n)
  "Return t if N is an Armstrong number, nil otherwise.
An Armstrong number is a number that is the sum of its own digits
each raised to the power of the number of digits.
Handles non-negative integers N."
  (if (and (not (integerp n)) (<= n 0))
      (error "Input must be a non-negative integer: %S" n)
    (if (= n 0) t
      (let* (
             (s (number-to-string n))
             (power (length s))
             (sum (cl-loop for char across s
                           for digit = (string-to-number (string char))
                           sum (expt digit power))))
        (= n sum)))))







;; Your mapping call (now using the corrected function)
;; This will generate a vector of t/nil values for numbers 1 through 100
(cl-map 'vector #'armstrong-p (number-sequence 1 200))

(provide 'armstrong-numbers)
;;; armstrong-numbers.el ends here
