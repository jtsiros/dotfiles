;;; $DOOMDIR/config.el -*- lexical-binding: t; -*-

;; Function to load all .el files in a directory
(defun load-config-files (dir)
  (let ((load-it (lambda (f)
                   (load (concat (file-name-as-directory dir) f)))))
    (mapc load-it
          (directory-files dir nil "\\.el$"))))


;; Load general settings
(load! "config/general")

;; Load theme settings
(load! "config/theme")

;; Load Org mode configuration
(load! "config/org")

;; Load all configuration files from config/packages/
(load-config-files (concat doom-user-dir "config/packages"))

;; Load lsp configurations
(load-config-files (concat doom-user-dir "config/lsp"))
