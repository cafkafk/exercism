;;; allergies.el --- Allergies Exercise (exercism)  -*- lexical-binding: t; -*-

;;; Commentary:
;; This file provides functions to determine allergies based on a numeric score.
;; Each allergen corresponds to a bit in the score.
;; Test functions pass allergen names as strings, so conversions are needed.

;;; Code:

;; Define the mapping between allergen symbols and their score values.
;; Using defconst as this data is constant.
(defconst allergies-alist
  '((eggs . 1)
    (peanuts . 2)
    (shellfish . 4)
    (strawberries . 8)
    (tomatoes . 16)
    (chocolate . 32)
    (pollen . 64)
    (cats . 128))
  "Alist mapping allergen symbols to their score values.")

(defun allergen-list (score)
  "Return a list of allergen *strings* based on the allergy SCORE.
Ignores unknown allergens (values >= 256)."
  (let ((result '())) ; Initialize an empty list to store allergen strings
    ;; Iterate through the known allergens in their defined order
    (dolist (pair allergies-alist)
      (let ((item-symbol (car pair))  ; Get the allergen symbol (e.g., 'eggs)
            (value (cdr pair))) ; Get the allergen score value (e.g., 1)
        ;; Check if the bit corresponding to this allergen's value is set in the score
        ;; using bitwise AND (logand). If the result is > 0, the bit is set.
        (when (> (logand score value) 0)
          ;; If allergic, convert the symbol to a string and add it
          ;; to the front of the result list.
          (push (symbol-name item-symbol) result))))
    ;; `push` adds items to the front, resulting in a reversed list.
    ;; `nreverse` reverses the list in-place to match the original order
    ;; (eggs, peanuts, etc.).
    (nreverse result)))

(defun allergic-to-p (score allergen-string)
  "Return t if SCORE indicates an allergy to ALLERGEN-STRING, otherwise nil.
ALLERGEN-STRING should be one of the known allergen names (e.g., \"eggs\")."
  ;; Convert the input allergen string (e.g., "eggs") to a symbol (e.g., 'eggs)
  ;; because the alist uses symbols as keys.
  (let* ((allergen-symbol (intern allergen-string))
         ;; Look up the numeric value associated with the allergen symbol
         ;; in the allergies-alist. `assoc` returns the (key . value) pair or nil.
         (item-value (cdr (assoc allergen-symbol allergies-alist))))
    ;; Check if the allergen was found in the list (i.e., it's a known allergen).
    (when item-value
      ;; If the allergen is known, perform a bitwise AND (logand) between
      ;; the total score and the allergen's specific value.
      ;; If the result is greater than 0, it means the bit corresponding
      ;; to the allergen was set in the score, indicating an allergy.
      (> (logand score item-value) 0))))

;; Make the functions available when this file is loaded.
(provide 'allergies)
;;; allergies.el ends here
