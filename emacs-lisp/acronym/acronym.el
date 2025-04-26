;;; acronym.el --- Acronym (exercism)  -*- lexical-binding: t; -*-

;;; Commentary:

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
