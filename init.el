;; init.el
(add-to-list 'load-path "~/.emacs.d/lisp")
(add-to-list 'load-path "~/.emacs.d/plugins")

(add-to-list 'exec-path "/usr/local/bin")

;; Setup theme
(add-to-list 'custom-theme-load-path "~/.emacs.d/plugins/emacs-color-theme-solarized")

(load-theme 'solarized t)

(set-frame-parameter nil
		     'background-mode
		     'dark)

(enable-theme 'solarized)

;;setup font
(set-default-font "Consolas-14")

;;setup scroll action
;; (defun smooth-scroll (increment)
;;   (scroll-up increment) (sit-for 0.05)
;;   (scroll-up increment) (sit-for 0.02)
;;   (scroll-up increment) (sit-for 0.02)
;;   (scroll-up increment) (sit-for 0.05)
;;   (scroll-up increment) (sit-for 0.06)
;;   (scroll-up increment))

;; (global-set-key [(mouse-5)] '(lambda () (interactive) (smooth-scroll 100)))
;; (global-set-key [(mouse-4)] '(lambda () (interactive) (smooth-scroll -100)))

;; scroll one line at a time (less "jumpy" than defaults)
(setq mouse-wheel-scroll-amount '(3 ((shift) . 3))) ;; one line at a time
(setq mouse-wheel-progressive-speed nil) ;; don't accelerate scrolling
(setq mouse-wheel-follow-mouse 't) ;; scroll window under mouse
(setq scroll-step 1) ;; keyboard scroll one line at a time

;;setup tab
(setq default-tab-width 4)
(setq-default indent-tabs-mode nil)

;; require other component
;; example: (require ')

;;setup org-mode
(require 'org-install)

(setq org-startup-indented t)

;;melpa setup
(require 'package) ;; You might already have this line
(add-to-list 'package-archives
             '("melpa" . "http://melpa.org/packages/") t)
(when (< emacs-major-version 24)
  ;; For important compatibility libraries like cl-lib
  (add-to-list 'package-archives '("gnu" . "http://elpa.gnu.org/packages/")))
(package-initialize) ;; You might already have this line

;; setup Omnisharp
(setq omnisharp-curl-executable-path "/usr/bin/curl")
(setq omnisharp-server-executable-path "~/Work/Refs/GithubProj/omnisharp-server/OmniSharp/bin/Debug/OmniSharp.exe")

(add-to-list 'auto-mode-alist '("\\.cs$" . csharp-mode))
;; (add-hook 'csharp-mode-hook
;;             #'(lambda ()
;;                 (omnisharp-mode)))
(global-auto-complete-mode t)
 
;; (require 'omnisharp)
;; (require 'helm-config)

;; (define-key omnisharp-mode-map "\C-c\C-s" 'my-omnisharp-start)
;; (define-key omnisharp-mode-map "\M-/" 'omnisharp-auto-complete)
;; (define-key omnisharp-mode-map "." 'omnisharp-add-dot-and-auto-complete)
;; (define-key omnisharp-mode-map "\C-c\C-c" 'omnisharp-build-in-emacs)
;; (define-key omnisharp-mode-map "\C-c\C-N" 'omnisharp-navigate-to-solution-member)
;; (define-key omnisharp-mode-map "\C-c\C-n" 'omnisharp-navigate-to-current-file-member)
;; (define-key omnisharp-mode-map "\C-c\C-f" 'omnisharp-navigate-to-solution-file)
;; (define-key omnisharp-mode-map "\C-c\C-g" 'omnisharp-go-to-definition)
;; (define-key omnisharp-mode-map "\C-c\C-r" 'omnisharp-rename)
;; (define-key omnisharp-mode-map "\C-c\C-y" 'omnisharp-find-usages)
;; (define-key omnisharp-mode-map "\C-c\C-v" 'omnisharp-run-code-action-refactoring)
;; (define-key omnisharp-mode-map "\C-c\C-o" 'omnisharp-auto-complete-overrides)
;; (define-key omnisharp-mode-map "\C-c\C-u" 'omnisharp-helm-find-symbols)
;; (define-key omnisharp-mode-map "\C-c\C-t\C-s" (lambda() (interactive) (omnisharp-unit-test "single")))
;; (define-key omnisharp-mode-map "\C-c\C-t\C-r" (lambda() (interactive) (omnisharp-unit-test "fixture")))
;; (define-key omnisharp-mode-map "\C-c\C-t\C-e" (lambda() (interactive) (omnisharp-unit-test "all")))

;; (defun my-omnisharp-start (sln)
;;   (interactive "fOpen sln: ")
;;   (omnisharp-start-omnisharp-server (expand-file-name sln)))


;;setup
(global-linum-mode 1)

;;setup smex
(require 'smex) 
(smex-initialize)

(global-set-key (kbd "M-x") 'smex)
(global-set-key (kbd "M-X") 'smex-major-mode-commands)
;; This is your old M-x.
(global-set-key (kbd "C-c C-c M-x") 'execute-extended-command)

;;set imenu on
(setq omnisharp-imenu-support t)

;;setup cursor
(setq-default cursor-type 'bar)

;;setup ace jump
(autoload
  'ace-jump-mode
  "ace-jump-mode" t)
(eval-after-load "ace-jump-mode"
  '(ace-jump-mode-enable-mark-sync))

(define-key global-map (kbd "C-c SPC") 'ace-jump-mode)
(define-key global-map (kbd "C-x SPC") 'ace-jump-mode-pop-mark)

;;setup swtich window
(global-set-key (kbd "C-x o") 'switch-window)
