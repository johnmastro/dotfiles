;;; prelude
(add-to-list 'load-path "~/.emacs.d/lisp/")
(load-file "~/.emacs.d/lisp/geiser/elisp/geiser.el")
(require 'cl)
(require 'lacarte)
(require 'quack)
(require 'uniquify)
(require 'linum)

(setq inhibit-startup-screen t)
(setq initial-scratch-message nil)
(blink-cursor-mode -1)
(fset 'yes-or-no-p 'y-or-n-p)


;;; basic settings
(setq line-number-mode t)
(setq column-number-mode t)
(size-indication-mode t)
(setq global-font-lock-mode 1)
(setq visible-bell t)
(global-hl-line-mode +1)
; (global-set-key (kbd "TAB") 'self-insert-command)
(setq-default indent-tabs-mode nil)
(setq-default tab-width 4)
(global-linum-mode 1)
(setq linum-format "%d ")

(add-hook 'python-mode-hook '(lambda ()
    (define-key python-mode-map "\C-m" 'newline-and-indent)))


;;; key bindings
(global-set-key (kbd "C-\\") 'shell)
(global-set-key (kbd "M-SPC") 'execute-extended-command)
(global-set-key (kbd "M-`") 'lacarte-execute-command)


;;; backup & autosave
(setq backup-directory-alist '((".*" . "~/.tmp/emacs/backup/")))
(setq backup-by-copying t)
(setq auto-save-file-name-transforms '((".*" "~/.tmp/emacs/autosave/\\1" t)))


;;; scheme-related settings
(setq quack-default-program "mit-scheme")
(setq geiser-active-implementations '(guile))


;;; paredit hooks
(autoload 'paredit-mode "paredit"
  "Minor mode for pseudo-structurally editing Lisp code." t)
(add-hook 'lisp-mode-hook                (lambda () (paredit-mode +1)))
(add-hook 'lisp-interaction-mode-hook    (lambda () (paredit-mode +1)))
(add-hook 'scheme-mode-hook              (lambda () (paredit-mode +1)))
(add-hook 'inferior-scheme-mode-hook     (lambda () (paredit-mode +1)))
(add-hook 'emacs-lisp-mode-hook          (lambda () (paredit-mode +1)))


;;; uniquify settings
(setq uniquify-buffer-name-style 'forward)
(setq uniquify-seperator "/")
(setq uniquify-after-kill-buffer-p t)
(setq uniquify-ignore-buffers-re "^\\*")


;;; theme
(add-to-list 'custom-theme-load-path "~/.emacs.d/themes/solarized/")
(setq solarized-termcolors 256)
(load-theme 'solarized-dark t)
