;;; $DOOMDIR/config/packages/json.el -*- lexical-binding: t; -*-

;; formatters
(after! json-mode
  (set-formatter! 'jq "jq ." :modes '(json-mode))
  (add-hook 'json-mode-hook #'format-all-mode))
