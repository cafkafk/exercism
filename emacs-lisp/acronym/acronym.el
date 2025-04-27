;;; acronym.el --- Acronym (exercism)  -*- lexical-binding: t; -*-

;;; Commentary: This will turn a string into an acronym

;;; Code:


(defun acronym (phrase)
  (mapconcat 'identity
             (mapcar
              (lambda
                (word)
                (substring word 0 1))
              (split-string
               (upcase phrase)
               "[ _-]+" t))))

(provide 'acronym)
;;; acronym.el ends here
