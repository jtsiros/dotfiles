;;; doom-asteroid-theme.el --- Asteroid theme for Doom Emacs -*- lexical-binding: t; no-byte-compile: t; -*-

(require 'doom-themes)

(defgroup doom-asteroid-theme nil
  "Options for doom-asteroid theme."
  :group 'doom-themes)

(def-doom-theme doom-asteroid
    "A dark theme inspired by Asteroid (Zed editor)"

  ((bg         '("#191920"))
   (bg-alt     '("#202028"))
   (base0      '("#0d0d0d"))
   (base1      '("#121212"))
   (base2      '("#191920"))
   (base3      '("#252530"))
   (base4      '("#2d2d3a"))
   (base5      '("#373747"))
   (base6      '("#454556"))
   (base7      '("#505065"))
   (base8      '("#5f5f7a"))
   (fg         '("#e7f2fe"))
   (fg-alt     '("#aaaabf"))

   (grey       '("#aaaabf"))
   (red        '("#ff2e18"))
   (orange     '("#ff8b39"))
   (green      '("#64d3b6"))
   (teal       '("#4fe1c5"))
   (yellow     '("#9685e7"))
   (blue       '("#6bd6fb"))
   (dark-blue  '("#3c89b3"))
   (magenta    '("#9580ff"))
   (violet     '("#a9d6e8"))
   (cyan       '("#6bd6fb"))
   (dark-cyan  '("#4fe1c5"))

   (highlight      cyan)
   (vertical-bar   base2)
   (selection      base4)
   (builtin        violet)
   (comments       grey)
   (doc-comments   (doom-lighten grey 0.25))
   (constants      cyan)
   (functions      green)
   (keywords       violet)
   (methods        green)
   (operators      cyan)
   (type           teal)
   (strings        magenta)
   (variables      fg)
   (numbers        dark-blue)
   (region         (doom-lighten bg-alt 0.05))
   (error          red)
   (warning        orange)
   (success        green)
   (vc-modified    yellow)
   (vc-added       green)
   (vc-deleted     red))

  ;; Custom faces
  ((cursor :background dark-blue)
   (line-number :foreground base5)
   (line-number-current-line :foreground fg)
   (mode-line :background base3 :foreground fg)
   (mode-line-inactive :background base2 :foreground base5)
   (fringe :background bg)
   (header-line :background bg-alt :foreground fg)
   (minibuffer-prompt :foreground cyan)
   (vertical-border :foreground base3)
   (font-lock-function-name-face :foreground green)
   (font-lock-function-call-face :foreground green)
   (font-lock-keyword-face :foreground violet))

  ;; Extra UI Elements
  ())

(provide 'doom-asteroid-theme)
