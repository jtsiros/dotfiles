;;; $DOOMDIR/config.el -*- lexical-binding: t; -*-

;; Place your private configuration here! Remember, you do not need to run 'doom
;; sync' after modifying this file!


;; Some functionality uses this to identify you, e.g. GPG configuration, email
;; clients, file templates and snippets.
(setq user-full-name "Jon Tsiros"
      user-mail-address "jon.tsiros@gmail.com")

;; Doom exposes five (optional) variables for controlling fonts in Doom. Here
;; are the three important ones:
;;
;; + `doom-font'
;; + `doom-variable-pitch-font'
;; + `doom-big-font' -- used for `doom-big-font-mode'; use this for
;;   presentations or streaming.
;;
;; They all accept either a font-spec, font string ("Input Mono-12"), or xlfd
;; font string. You generally only need these two:

(setq doom-font (font-spec :family "BlexMono Nerd Font" :size 15)
      doom-unicode-font (font-spec :family "BlexMono Nerd Font" :size 15)
      doom-variable-pitch-font (font-spec :family "BlexMono Nerd Font" :size 15)
      projectile-project-search-path '("~/dev/code/")
      mac-command-modifier 'meta
      default-directory "~"
      org-ellipsis " ▾ "
      org-bullets-bullet-list '("·")
      org-tags-column -80
      org-agenda-files (ignore-errors (directory-files +org-dir t "\\.org$" t))
      org-log-done 'time
      org-refile-targets (quote ((nil :maxlevel . 1)))
      org-capture-templates '(("x" "Note" entry
                          (file+olp+datetree "journal.org")
                          "**** [ ] %U %?" :prepend t :kill-buffer t)
                         ("t" "Task" entry
                          (file+headline "tasks.org" "Inbox")
                          "* [ ] %?\n%i" :prepend t :kill-buffer t))
      +org-capture-todo-file "tasks.org")

(map! :ne "M-/" #'comment-or-uncomment-region)
(map! :ne "SPC / r" #'deadgrep)
(map! :ne "SPC n b" #'org-brain-visualize)
(map! :ne "SPC k" #'save-buffer)
;;
;; There are two ways to load a theme. Both assume the theme is installed and
;; available. You can either set `doom-theme' or manually load a theme with the
;; `load-theme' function. This is the default:
(setq doom-theme 'doom-dark+)

;; This determines the style of line numbers in effect. If set to `nil', line
;; numbers are disabled. For relative line numbers, set this to `relative'.
(setq display-line-numbers-type 'relative)
