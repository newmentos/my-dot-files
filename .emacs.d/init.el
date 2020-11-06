;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Section I: Generic settings                                               ;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;; The following 3 lines disable unnecessary GUI elements, in this case the
;; menu bar, the tool bar and the scroll bar. If you wish, you can comment out
;; the menu-bar and keep it, but eventually I recommend you disable it.

(if (fboundp 'menu-bar-mode) (menu-bar-mode -1))
(if (fboundp 'tool-bar-mode) (tool-bar-mode -1))
(if (fboundp 'scroll-bar-mode) (scroll-bar-mode -1))

;; Sometimes the mini-buffer becomes multi-line, and it can be a bit annoying as
;; you type in it. This makes it stay one line.

(setq resize-mini-windows nil)

;; We don't need the Emacs splash screen. You can keep it on if you're into
;; that sort of thing

(setq inhibit-splash-screen t)

;;; global-linum-mode adds line numbers to all open windows, In my opinion
;;; there is no reason not to have this enabled.
(global-linum-mode)

(require 'package)
(let* ((no-ssl (and (memq system-type '(windows-nt ms-dos))
                    (not (gnutls-available-p))))
       (proto (if no-ssl "http" "https")))
  (when no-ssl (warn "\
Your version of Emacs does not support SSL connections,
which is unsafe because it allows man-in-the-middle attacks.
There are two things you can do about this warning:
1. Install an Emacs version that does support SSL and be safe.
2. Remove this warning from your init file so you won't see it again."))
  ;;  (add-to-list 'package-archives (cons "melpa" (concat proto "://melpa.org/packages/")) t)
  ;; Comment/uncomment this line to enable MELPA Stable if desired.  See `package-archive-priorities`
  ;; and `package-pinned-packages`. Most users will not need or want to do this.
  (add-to-list 'package-archives (cons "melpa-stable" (concat proto "://stable.melpa.org/packages/")) t)
  (add-to-list 'package-archives (cons "marmalade" (concat proto "://marmalade-repo.org/packages/")) t)
  (add-to-list 'package-archives (cons "marmalade-china" (concat proto "://elpa.emacs-china.org/marmalade/")) t))

(package-initialize)
 (unless package-archive-contents
   (package-refresh-contents))

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(package-selected-packages
   '(password-store nim-mode magit rainbow-mode rainbow-delimiters smartparens company s nimbus-theme)))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )

;; Install if are not installed
;; (dolist (package package-selected-packages)
;;   (unless (package-installed-p package)
;;     (package-install package)))

;; (require 'cl)
(require 'company)
(require 'nim-mode)
;; ;;(require 'markdown-mode)
(require 'nimbus-theme)
;; ;;(require 'clhs)
;; ;;(require 'geiser)
;; ;;(require 'quack)
;; ;;(require 'case-table)
(require 'magit)
;; (require 'md-readme)
;; ;;(require 'ibuffer)
(require 's)
(require 'smartparens)

;; Emacs server
(require 'server)
(unless (server-running-p)
  (server-start))

;;; Supprot for asdf-vm
;;(add-to-list 'load-path "~/.asdf/shims")
;;(setq exec-path (cons "~/.asdf/shims" exec-path))

(setq-default indent-tabs-mode nil)
(setq-default tab-width 4)

;;;; Задаем переменную для домашней папки
(defvar use-home)
(setq use-home (concat (expand-file-name "~") "/"))

;; ;;; Установка цветовой темы
(load-theme 'nimbus t)

;;; Установка шрифта по умолчанию
(add-to-list 'default-frame-alist '(font . "PT Mono 14" ))
(set-face-attribute 'default t :font "PT Mono 14" )

;; handle emacs utf-8 input
(set-terminal-coding-system 'utf-8)
(set-keyboard-coding-system 'utf-8)
(prefer-coding-system 'utf-8)
(setenv "LANG" "ru_RU.UTF-8")

;;; Разделение килринг и клипбоард
;(setq x-select-enable-clipboard nil)
(setq x-select-enable-clipboard t)
(setq interprogram-cut-function nil)

;;; Setting load-path
(add-to-list 'load-path "~/.emacs.d/lisp")

;; ;;(load (expand-file-name "~/quicklisp/slime-helper.el"))
;; ;;; Rowsell
;; ;; (add-to-list 'load-path (expand-file-name "~/.roswell/bin"))
;; ;; (add-to-list 'exec-path (expand-file-name "~/.roswell/bin"))
(load (expand-file-name "~/.roswell/helper.el"))
;; ; (add-to-list 'load-path "~/.roswell/impls/x86-64/linux/sbcl-bin/2.0.7/bin/sbcl")

;; ;; SLIME and CLISP will complain about a missing temp directory without this
(setq temporary-file-directory (expand-file-name "~/tmp"))
(setq slime-lisp-implementations '((sbcl ("/usr/bin/sbcl"))
                                   (asdf-sbcl ("~/.asdf/shims/sbcl"))
                                   (gcl ("/usr/bin/gcl"))
                                   (ecl ("/usr/local/bin/ecl") :coding-system utf-8-unix)
                                   (ccl32 ("/usr/lib/ccl-git/lx86cl") :coding-system utf-8-unix)
                                   (ccl64 ("/usr/lib/ccl-git/lx86cl64") :coding-system utf-8-unix)
                                   (ros-ccl  ("ros" "-Q" "-l" "~/.ccl-init.lisp" "-L" "ccl-bin" "run"))
                                   (ros-sbcl ("ros" "-Q"  "-l" "~/.sbclrc" "-L" "sbcl-bin" "run"))))
                                   
(setq slime-net-coding-system 'utf-8-unix)

;; Setup load-path, autoloads and your lisp system
;; Not needed if you install SLIME via MELPA
;;(add-to-list 'load-path "~/.emacs.d/slime")
;;(add-to-list 'load-path "~/quicklisp/dists/quicklisp/software/slime-v2.24")

;; ;; SBCL
;; ;;(setq-default inferior-lisp-program "/usr/bin/sbcl")
;; ;;(setq slime-default-lisp 'sbcl)
;; ;; Clozure CL
;; ;;(setq-default inferior-lisp-program "ccl64")
;; ;;(setq slime-default-lisp 'ccl64)
;; ;; Embedded Common Lisp
;; ;;(setq inferior-lisp-program "/usr/local/bin/ecl")
;; ;;(setq slime-default-lisp 'ecl)
;; (setq inferior-lisp-program "~/.asdf/shims/sbcl")
;; ;; Roswell
;(setq inferior-lisp-program "ros -L sbcl-bin -Q -l ~/.sbclrc run")
(setq slime-default-lisp 'ros-sbcl)
(setq slime-startup-animation nil)

(require 'slime-autoloads)
;(slime-setup '(slime-company))
;(require 'slime)
(slime-setup)



;; Hooks
(add-hook 'lisp-mode-hook (lambda ()
                            (rainbow-delimiters-mode t)
                            (smartparens-strict-mode t)
                            (idle-highlight-mode t)
                            (auto-complete-mode)))

;; (add-hook 'slime-mode-hook (lambda ()
;;                              (set-up-slime-ac)
;;                              (auto-complete-mode)))

;; (add-hook 'slime-repl-mode-hook (lambda ()
;;                                   (rainbow-delimiters-mode t)
;;                                   (smartparens-strict-mode t)
;;                                   (set-up-slime-ac)
;;                                   (auto-complete-mode)))

;;(add-hook 'slime-repl-mode-hook (lambda () (paredit-mode +1)))
;; Stop SLIME's REPL from grabbing DEL,
;; which is annoying when backspacing over a '('
;; (defun override-slime-repl-bindings-with-paredit ()
;;   (define-key slime-repl-mode-map
;;     (read-kbd-macro paredit-backward-delete-key) nil))
;; (add-hook 'slime-repl-mode-hook 'override-slime-repl-bindings-with-paredit)


;; Parenthesis - OPTIONAL but recommended
(show-paren-mode t)
(require 'smartparens-config)
(sp-use-paredit-bindings)
(sp-pair "(" ")" :wrap "M-(")
(define-key smartparens-mode-map (kbd "C-<right>") 'sp-forward-slurp-sexp)
(define-key smartparens-mode-map (kbd "C-<left>") 'sp-backward-slurp-sexp)
(define-key smartparens-mode-map (kbd "C-S-<right>") 'sp-forward-barf-sexp)
(define-key smartparens-mode-map (kbd "C-S-<left>") 'sp-backward-barf-sexp)

(define-key smartparens-mode-map (kbd "C-)") 'sp-forward-slurp-sexp)
(define-key smartparens-mode-map (kbd "C-(") 'sp-backward-slurp-sexp)
(define-key smartparens-mode-map (kbd "C-}") 'sp-forward-barf-sexp)
(define-key smartparens-mode-map (kbd "C-{") 'sp-backward-barf-sexp)

(sp-pair "(" ")" :wrap "M-(")
(sp-pair "[" "]" :wrap "M-[")
(sp-pair "{" "}" :wrap "M-{")

;;(require 'paredit)
;; (autoload 'enable-paredit-mode "paredit" "Turn on pseudo-structural editing of Lisp code." t)
;; (add-hook 'emacs-lisp-mode-hook       #'enable-paredit-mode)
;; (add-hook 'eval-expression-minibuffer-setup-hook #'enable-paredit-mode)
;; (add-hook 'ielm-mode-hook             #'enable-paredit-mode)
;; (add-hook 'lisp-mode-hook             #'enable-paredit-mode)
;; (add-hook 'lisp-interaction-mode-hook #'enable-paredit-mode)
;; (add-hook 'scheme-mode-hook           #'enable-paredit-mode)

;; (require 'smartparens-config)
;; Always start smartparens mode in js-mode.
;; (add-hook 'js-mode-hook #'smartparens-mode)

;; This is Ring highlight syntax support for Emacs editor
;;(load "ring-mode")

;; The `nimsuggest-path' will be set to the value of
;; (executable-find "nimsuggest"), automatically.
(setq nimsuggest-path (concat use-home ".asdf/shims/nimsuggest"))

(defun my--init-nim-mode ()
  "Local init function for `nim-mode'."

  ;; Just an example, by default these functions are
  ;; already mapped to "C-c <" and "C-c >".
  (local-set-key (kbd "M->") 'nim-indent-shift-right)
  (local-set-key (kbd "M-<") 'nim-indent-shift-left)

  ;; Make files in the nimble folder read only by default.
  ;; This can prevent to edit them by accident.
  (when (string-match "/\.nimble/" buffer-file-name) (read-only-mode 1))

  ;; If you want to experiment, you can enable the following modes by
  ;; uncommenting their line.
  ;; (nimsuggest-mode 1)
  ;; Remember: Only enable either `flycheck-mode' or `flymake-mode' at the same time.
  (flycheck-mode 1)
  (flymake-mode 1)

  ;; The following modes are disabled for Nim files just for the case
  ;; that they are enabled globally.
  ;; Anything that is based on smie can cause problems.
  (auto-fill-mode 0)
  (electric-indent-local-mode 0)
)

(add-hook 'nim-mode-hook 'my--init-nim-mode)
