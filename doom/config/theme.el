;;; $DOOMDIR/config/theme.el -*- lexical-binding: t; -*-

;; disable toolbar
(add-hook 'doom-after-init-hook (lambda () (tool-bar-mode 1) (tool-bar-mode 0)))

;; Function to adjust title bar appearance based on current theme
(defun my-update-titlebar-appearance ()
  (if (eq doom-theme 'almost-mono-gray)
      (set-frame-parameter nil 'ns-appearance 'dark)
    (set-frame-parameter nil 'ns-appearance 'light)))

;; Hook into Doom theme loading to adjust the title bar
(add-hook 'doom-load-theme-hook #'my-update-titlebar-appearance)

(when (eq system-type 'darwin)
  (add-to-list 'default-frame-alist '(ns-transparent-titlebar . t))
  ;; This will be overridden by the theme-specific setting from the function above
  (add-to-list 'default-frame-alist '(ns-appearance . light)))


(setq doom-theme 'almost-mono-gray)

;; Toggle themes
(defvar my-light-theme 'almost-mono-cream)
(defvar my-dark-theme 'almost-mono-gray)

(defun my-toggle-theme ()
  (interactive)
  (if (equal doom-theme my-dark-theme)
      (load-theme my-light-theme t)
    (load-theme my-dark-theme t))
  (doom/reload-theme))

(map! :leader
      :desc "Toggle light/dark theme"
      "t t" #'my-toggle-theme)
