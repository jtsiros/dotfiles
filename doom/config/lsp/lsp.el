;;; $DOOMDIR/config/lsp/lsp.el -*- lexical-binding: t; -*-

(setq lsp-modeline-diagnostics-scope :workspace)
(after! lsp-mode
  (setq lsp-ui-sideline-enable nil)
  (setq lsp-signature-render-documentation nil))
