;;; $DOOMDIR/config/lsp/odin.el -*- lexical-binding: t; -*-

;; Set up OLS as the language server for Odin, ensuring lsp-mode is loaded first
(with-eval-after-load 'lsp-mode
  (setq-default lsp-auto-guess-root t) ;; Helps find the ols.json file with Projectile or project.el
  (setq lsp-language-id-configuration (cons '(odin-mode . "odin") lsp-language-id-configuration))

  (lsp-register-client
   (make-lsp-client :new-connection (lsp-stdio-connection "/Users/jtsiros/dev/lib/ols/ols")
                    :major-modes '(odin-mode)
                    :server-id 'ols
                    :multi-root t))) ;; Ensures lsp-mode sends "workspaceFolders" to the server

(add-hook 'odin-mode-hook #'lsp)
