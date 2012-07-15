;; (require 'cl)

(add-to-list 'load-path "~/.emacs.d/lisp/")

(setq inhibit-startup-screen t)
(blink-cursor-mode -1)
(fset 'yes-or-no-p 'y-or-n-p)

(setq line-number-mode t)
(setq column-number-mode t)
(size-indication-mode t)
(setq global-font-lock-mode 1)
(setq visible-bell t)
(global-set-key (kbd "TAB") 'self-insert-command)
(setq-default indent-tabs-mode nil)
(setq-default tab-width 4)
;; (setq indent-line-function 'insert-tab)
(global-hl-line-mode +1)

(setq backup-directory-alist '((".*" . "~/.tmp/emacs/backup/")))
(setq backup-by-copying t)
(setq auto-save-file-name-transforms '((".*" "~/.tmp/emacs/autosave/\\1" t)))

;; (setq inferior-lisp-program "/usr/bin/sbcl")
;; (add-to-list 'load-path "~/.emacs.d/lisp/slime/")
;; (require 'slime)
;; (slime-setup)

(require 'quack)

(autoload 'paredit-mode "paredit"
  "Minor mode for pseudo-structurally editing Lisp code." t)
(add-hook 'lisp-mode-hook                (lambda () (paredit-mode +1)))
(add-hook 'lisp-interaction-mode-hook    (lambda () (paredit-mode +1)))
(add-hook 'scheme-mode-hook              (lambda () (paredit-mode +1)))
(add-hook 'inferior-scheme-mode-hook     (lambda () (paredit-mode +1)))
(add-hook 'emacs-lisp-mode-hook          (lambda () (paredit-mode +1)))
;; (add-hook 'slime-repl-mode-hook          (lambda () (paredit-mode +1)))

(require 'uniquify)
(setq uniquify-buffer-name-style 'forward)
(setq uniquify-seperator "/")
(setq uniquify-after-kill-buffer-p t)
(setq uniquify-ignore-buffers-re "^\\*")

(add-to-list 'custom-theme-load-path "~/.emacs.d/themes/solarized/")
(setq solarized-termcolors 256)
(load-theme 'solarized-dark t)
