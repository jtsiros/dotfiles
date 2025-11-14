(setq package-enable-at-startup nil)

;; Set UTF-8 as default encoding
(set-language-environment "UTF-8")
(prefer-coding-system 'utf-8)
(set-default-coding-systems 'utf-8)
(set-terminal-coding-system 'utf-8)
(set-keyboard-coding-system 'utf-8)
(setq-default buffer-file-coding-system 'utf-8-unix)

;; Native compilation settings (Emacs 28+)
(when (featurep 'native-compile)
  ;; Silence compiler warnings
  (setq native-comp-async-report-warnings-errors nil)
  ;; Set native-comp directory
  (setq native-comp-eln-load-path
        (list (expand-file-name "eln-cache/" user-emacs-directory))))

;; Clean titlebar on macOS with rounded corners (like Ghostty)
(when (eq system-type 'darwin)
  (setq frame-resize-pixelwise t)
  ;; Transparent titlebar that blends with the theme
  (push '(ns-transparent-titlebar . t) default-frame-alist)
  (push '(ns-appearance . dark) default-frame-alist)
  ;; Hide proxy icon and frame title for clean look
  (setq ns-use-proxy-icon nil)
  (setq frame-title-format nil))
