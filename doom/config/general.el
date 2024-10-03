;;; $DOOMDIR/config/general.el -*- lexical-binding: t; -*-

;; open full screen
(add-to-list 'initial-frame-alist '(fullscreen . maximized))
;; (add-to-list 'default-frame-alist '(height . 120))
;; (add-to-list 'default-frame-alist '(width . 240))

;; configure line numbers
(setq display-line-numbers-type 'relative)
(global-display-line-numbers-mode)

(setq user-full-name "Jon Tsiros"
      user-mail-address "jon@brightblock.ai")

;; configure font


(setq doom-font (font-spec :family "JetBrainsMono Nerd Font Mono" :size 18.0 :height 110 :weight 'medium)
      doom-variable-pitch-font (font-spec :family "Ubuntu" :size 18.0 :height 110 :weight 'medium)
      doom-big-font (font-spec :family "JetBrainsMono Nerd Font Mono" :size 22.0 :height 110 :weight 'medium))

(add-to-list 'default-frame-alist '(font . "JetBrainsMono Nerd Font Mono-16"))

(setq doom-themes-enable-bold t    ;; If nil, bold is universally disabled
      doom-themes-enable-italic t) ;; If nil, italics are universally disabled

(setq-default line-spacing 0.12)
