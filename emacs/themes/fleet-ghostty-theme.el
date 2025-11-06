;;; fleet-ghostty-theme.el --- JetBrains Fleet theme using official Zed colors  -*- lexical-binding: t; -*-

;; Author: JT
;; Version: 0.2
;; Filename: fleet-ghostty-theme.el
;; Package-Requires: ((emacs "24"))
;; SPDX-License-Identifier: MIT

;;; Commentary:

;; JetBrains Fleet theme for Emacs using the official color palette from
;; Zed's Fleet Dark theme, which is the official Fleet port.

;;; Code:

(deftheme fleet-ghostty
  "JetBrains Fleet theme using official Zed Fleet Dark color palette.")

(let ((bg              "#18191B")  ; Official Fleet Dark background
      (fg              "#E0E1E4")  ; Official Fleet Dark foreground
      (bg-active-line  "#0870E426") ; Active line highlight
      (bg-lighter      "#2A2A2A")  ; Slightly lighter for contrast
      (selection-bg    "#225090")  ; Official selection background
      (selection-fg    "#E0E1E4")  ; Selection foreground
      (border          "#3E4147")  ; Border color
      (border-focus    "#2A7DEB")  ; Focused border
      (line-numbers    "#6E747B")  ; Line numbers
      (comment         "#909194")  ; Comments
      (red             "#EB4056")  ; ANSI Red
      (red-error       "#E1465E")  ; Error red
      (green           "#82D2CE")  ; Keywords & ANSI Green
      (green-success   "#169068")  ; Success green
      (yellow          "#FAD075")  ; ANSI Yellow & Numbers
      (yellow-warning  "#B07203")  ; Warning yellow
      (blue            "#4B8DEC")  ; ANSI Blue & Info
      (blue-type       "#87C3FF")  ; Types
      (blue-modified   "#71A3EF")  ; Modified indicator
      (magenta         "#EB83E2")  ; ANSI Magenta
      (magenta-string  "#E394DC")  ; Strings
      (purple          "#AF9CFF")  ; Constants & Attributes
      (cyan            "#2CCCE6")  ; ANSI Cyan
      (orange          "#EBC88D")) ; Functions & Numbers

  (custom-theme-set-faces
   'fleet-ghostty

   `(default           ((t (:foreground ,fg :background ,bg :weight normal))))
   `(region            ((t (:foreground ,selection-fg :background ,selection-bg))))
   `(warning           ((t (:foreground ,yellow-warning))))
   `(error             ((t (:foreground ,red-error))))
   `(success           ((t (:foreground ,green-success))))
   `(fringe            ((t (:background ,bg))))
   `(link              ((t (:underline t :foreground ,blue))))
   `(vertical-border   ((t (:foreground ,border))))
   `(minibuffer-prompt ((t (:foreground ,orange))))
   `(highlight         ((t (:background ,selection-bg))))

   `(line-number              ((t (:foreground ,line-numbers))))
   `(line-number-current-line ((t (:foreground ,fg :background ,bg-lighter))))

   `(hl-line      ((t (:background ,bg-active-line))))
   `(hl-line-face ((t (:background ,bg-active-line))))

   `(font-lock-builtin-face           ((t (:foreground ,green))))
   `(font-lock-comment-delimiter-face ((t (:foreground ,comment))))
   `(font-lock-comment-face           ((t (:foreground ,comment))))
   `(font-lock-constant-face          ((t (:foreground ,purple))))
   `(font-lock-doc-face               ((t (:foreground ,comment))))
   `(font-lock-doc-string-face        ((t (:foreground ,magenta-string))))
   `(font-lock-function-name-face     ((t (:foreground ,orange))))
   `(font-lock-keyword-face           ((t (:foreground ,green))))
   `(font-lock-preprocessor-face      ((t (:foreground ,purple))))
   `(font-lock-string-face            ((t (:foreground ,magenta-string))))
   `(font-lock-type-face              ((t (:foreground ,blue-type))))
   `(font-lock-variable-name-face     ((t (:foreground ,fg))))
   `(font-lock-warning-face           ((t (:foreground ,yellow-warning))))

   ;; tree-sitter
   `(tree-sitter-hl-face:constant            ((t (:foreground ,purple))))
   `(tree-sitter-hl-face:constant.builtin    ((t (:foreground ,purple))))
   `(tree-sitter-hl-face:constructor         ((t (:foreground ,blue-type))))
   `(tree-sitter-hl-face:function            ((t (:foreground ,orange :weight semi-bold))))
   `(tree-sitter-hl-face:function.call       ((t (:foreground ,orange :slant normal))))
   `(tree-sitter-hl-face:keyword             ((t (:foreground ,green))))
   `(tree-sitter-hl-face:number              ((t (:foreground ,yellow))))
   `(tree-sitter-hl-face:operator            ((t (:foreground ,fg))))
   `(tree-sitter-hl-face:property            ((t (:foreground ,purple))))
   `(tree-sitter-hl-face:property.definition ((t (:foreground ,purple))))
   `(tree-sitter-hl-face:type.argument       ((t (:foreground ,blue-type))))
   `(tree-sitter-hl-face:type.builtin        ((t (:foreground ,blue-type))))
   `(tree-sitter-hl-face:type.parameter      ((t (:foreground ,blue-type))))

   ;; mode-line
   `(mode-line           ((t (:inverse-video unspecified :foreground ,fg :background ,bg-lighter :box unspecified))))
   `(mode-line-highlight ((t (:foreground ,fg :box unspecified))))
   `(mode-line-inactive  ((t (:inverse-video unspecified :foreground ,line-numbers :background ,bg-lighter :box unspecified))))

   ;; doom-modeline
   `(doom-modeline-bar                  ((t (:background ,blue))))
   `(doom-modeline-bar-inactive         ((t (:background ,border))))
   `(doom-modeline-buffer-file          ((t (:foreground ,fg :weight bold))))
   `(doom-modeline-buffer-modified      ((t (:foreground ,blue-modified :weight bold))))
   `(doom-modeline-buffer-major-mode    ((t (:foreground ,line-numbers))))
   `(doom-modeline-buffer-minor-mode    ((t (:foreground ,line-numbers))))
   `(doom-modeline-buffer-path          ((t (:foreground ,comment))))
   `(doom-modeline-project-dir          ((t (:foreground ,comment))))
   `(doom-modeline-project-root-dir     ((t (:foreground ,comment))))
   `(doom-modeline-info                 ((t (:foreground ,line-numbers))))
   `(doom-modeline-warning              ((t (:foreground ,line-numbers))))
   `(doom-modeline-urgent               ((t (:foreground ,fg))))
   `(doom-modeline-evil-normal-state    ((t (:foreground ,green :weight bold))))
   `(doom-modeline-evil-insert-state    ((t (:foreground ,blue :weight bold))))
   `(doom-modeline-evil-visual-state    ((t (:foreground ,purple :weight bold))))
   `(doom-modeline-evil-replace-state   ((t (:foreground ,red :weight bold))))
   `(doom-modeline-evil-operator-state  ((t (:foreground ,cyan :weight bold))))
   `(doom-modeline-evil-motion-state    ((t (:foreground ,magenta :weight bold))))
   `(doom-modeline-evil-emacs-state     ((t (:foreground ,yellow :weight bold))))
   `(doom-modeline-persp-name           ((t (:foreground ,line-numbers))))
   `(doom-modeline-vcs-icon             ((t (:foreground ,line-numbers))))
   `(doom-modeline-repl                 ((t (:foreground ,line-numbers))))
   `(doom-modeline-persp-buffer-not-in-persp ((t (:foreground ,line-numbers))))
   `(doom-modeline-lsp-success          ((t (:foreground ,line-numbers))))
   `(doom-modeline-lsp-error            ((t (:foreground ,line-numbers))))
   `(doom-modeline-lsp-warning          ((t (:foreground ,line-numbers))))

   ;; diff-hl
   `(diff-hl-insert ((t (:foreground ,green-success :background unspecified))))
   `(diff-hl-change ((t (:foreground ,blue-modified :background unspecified))))
   `(diff-hl-delete ((t (:foreground ,red-error :background unspecified))))

   ;; flycheck
   `(flycheck-info           ((t (:underline (:color ,green-success :style wave)))))
   `(flycheck-warning        ((t (:underline (:color ,yellow-warning :style wave)))))
   `(flycheck-error          ((t (:underline (:color ,red-error :style wave)))))
   `(flycheck-fringe-info    ((t (:foreground ,green-success))))
   `(flycheck-fringe-warning ((t (:foreground ,yellow-warning))))
   `(flycheck-fringe-error   ((t (:foreground ,red-error))))

   ;; ivy
   `(ivy-current-match           ((t (:foreground ,fg :background ,selection-bg))))
   `(ivy-minibuffer-match-face-1 ((t (:foreground ,magenta-string))))
   `(ivy-minibuffer-match-face-2 ((t (:foreground ,blue))))
   `(ivy-minibuffer-match-face-3 ((t (:foreground ,cyan))))
   `(ivy-minibuffer-match-face-4 ((t (:foreground ,green))))

   ;; lsp
   `(lsp-ui-doc-background      ((t (:foreground ,fg :background ,bg-lighter))))
   `(lsp-face-highlight-textual ((t (:background ,selection-bg))))

   ;; rustic
   `(rust-string-interpolation ((t (:foreground ,cyan))))

   ;; term - using official Fleet ANSI colors
   `(term               ((t (:foreground ,fg :background ,bg))))
   `(term-color-black   ((t (:foreground ,bg :background ,line-numbers))))
   `(term-color-white   ((t (:foreground ,fg :background ,fg))))
   `(term-color-red     ((t (:foreground ,red :background ,red))))
   `(term-color-yellow  ((t (:foreground ,yellow :background ,yellow))))
   `(term-color-green   ((t (:foreground ,green :background ,green))))
   `(term-color-cyan    ((t (:foreground ,cyan :background ,cyan))))
   `(term-color-blue    ((t (:foreground ,blue :background ,blue))))
   `(term-color-magenta ((t (:foreground ,magenta :background ,magenta))))

   ;; window-divider
   `(window-divider             ((t (:foreground ,border))))
   `(window-divider-first-pixel ((t (:foreground ,border))))
   `(window-divider-last-pixel  ((t (:foreground ,border))))))

;;;###autoload
(when load-file-name
  (add-to-list 'custom-theme-load-path
               (file-name-as-directory (file-name-directory load-file-name))))

(provide-theme 'fleet-ghostty)

;;; fleet-ghostty-theme.el ends here
