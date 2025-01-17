;;; $DOOMDIR/config/lsp/golang.el -*- lexical-binding: t; -*-

(add-hook 'go-mode-hook #'lsp-deferred)
;; Make sure you don't have other goimports hooks enabled.
(defun lsp-go-install-save-hooks ()
  (add-hook 'before-save-hook #'lsp-organize-imports t t))
(add-hook 'go-mode-hook #'lsp-go-install-save-hooks)

(use-package! lsp-mode
  :config
  (setq lsp-go-use-placeholders nil)
  (setq lsp-file-watch-ignored-directories
        (append lsp-file-watch-ignored-directories
                '("[/\\\\]vendor\\'"))))
