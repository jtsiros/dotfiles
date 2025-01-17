;;; $DOOMDIR/config/lsp/lsp.el -*- lexical-binding: t; -*-

(setq lsp-modeline-diagnostics-scope :workspace)
(after! lsp-mode
  (setq lsp-ui-sideline-enable nil)
  (setq lsp-signature-render-documentation nil))

(use-package! eglot
  :config
  (setq eldoc-documentation-strategy 'eldoc-documentation-compose) ; Prevent duplicate entries
  (setq eldoc-echo-area-use-multiline-p nil)) ; Disable multiline hover if unnecessary
