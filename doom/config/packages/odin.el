;;; $DOOMDIR/config/packages/odin.el -*- lexical-binding: t; -*-

;; Odin language config
(use-package! odin-mode
  :mode ("\\.odin\\'" . odin-mode)
  :hook (odin-mode . lsp))
