(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(custom-enabled-themes (quote (wombat)))
 '(custom-safe-themes (quote ("a9cbe7e6ea378a6ec0ffb63b8e8797eea15445118c42a5dddfc6a3a468deb04f" default))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )

;; Set Default Window Size
;; http://www.emacswiki.org/FrameSize
(add-to-list 'default-frame-alist '(height . 60))
(add-to-list 'default-frame-alist '(width . 200))
 
;;; Addingp board support
;;; http://blog.binchen.org/posts/the-reliable-way-to-access-system-clipboard-from-emacs.html
(setq *is-a-mac* (eq system-type 'darwin))
(setq *cygwin* (eq system-type 'cygwin) )
(setq *linux* (or (eq system-type 'gnu/linux) (eq system-type 'linux)) )
(defun copy-to-x-clipboard ()
  (interactive)
  (if (region-active-p)
      (progn
        (cond
         ((and (display-graphic-p) x-select-enable-clipboard)
          (x-set-selection 'CLIPBOARD (buffer-substring (region-beginning) (region-end))))
         (t (shell-command-on-region (region-beginning) (region-end)
                                     (cond
                                      (*cygwin* "putclip")
                                      (*is-a-mac* "pbcopy")
                                      (*linux* "xsel -ib")))
            ))
        (message "Yanked region to clipboard!")
        (deactivate-mark))
        (message "No region active; can't yank to clipboard!")))

(defun paste-from-x-clipboard()
  (interactive)
  (cond
   ((and (display-graphic-p) x-select-enable-clipboard)
    (insert (x-selection 'CLIPBOARD)))
   (t (shell-command
       (cond
        (*cygwin* "getclip")
        (*is-a-mac* "pbpaste")
        (t "xsel -ob"))
       1))
   ))

(defun my/paste-in-minibuffer ()
  (local-set-key (kbd "M-y") 'paste-from-x-clipboard)
  )

(add-hook 'minibuffer-setup-hook 'my/paste-in-minibuffer)

;; Prevent the cursor from blinking
(blink-cursor-mode 0)
;; Don't use messages that you don't read
(setq initial-scratch-message "")
(setq inhibit-startup-message t)
;; Don't let Emacs hurt your ears
(setq visible-bell t)
;; You need to set `inhibit-startup-echo-area-message' from the
;; customization interface:
;; M-x customize-variable RET inhibit-startup-echo-area-message RET
;; then enter your username
(setq inhibit-startup-echo-area-message "guerry")

;; This is bound to f11 in Emacs 24.4
;; (toggle-frame-fullscreen) 
;; Who use the bar to scroll?
(scroll-bar-mode 0)

(tool-bar-mode 0)
(menu-bar-mode 0)

;; Taken From: https://github.com/oneKelvinSmith/monokai-emacs
(add-to-list 'custom-theme-load-path "~/.emacs.d/themes/")

;; Creating a directory for TEMP files
;; http://www.emacswiki.org/emacs/AutoSave 
(setq backup-directory-alist
          `((".*" . ,temporary-file-directory)))
    (setq auto-save-file-name-transforms
          `((".*" ,temporary-file-directory t)))


;; Adding 4 Space Tabs
;; http://stackoverflow.com/questions/69934/set-4-space-indent-in-emacs-in-text-mode
(setq-default indent-tabs-mode nil)
(setq-default tab-width 4)
(setq indent-line-function 'insert-tab)

;; Set Cua Mode (Make Emacs behave like a modern program [copy, paste..])
;; http://ergoemacs.org/emacs/emacs_make_modern.html
(cua-mode 1)

;; Add Auto Closing Brackets
;; http://ergoemacs.org/emacs/emacs_make_modern.html
(electric-pair-mode 1)

;; How to have matching parenthesis highlighted?
;; http://ergoemacs.org/emacs/emacs_make_modern.html
(show-paren-mode 1) ; turn on paren match highlighting
(setq show-paren-style 'expression) ; highlight entire bracket expression

;; How to show line numbers?
;; http://ergoemacs.org/emacs/emacs_make_modern.html
(global-linum-mode 1) ; display line numbers in margin. New in Emacs 23

;; How to restore opened files from last session?
;; http://ergoemacs.org/emacs/emacs_make_modern.html
(desktop-save-mode 1) ; save/restore opened files

;;;;;;;;;;;;;;;;;;;;;;;;;;
;;
;; Package Managers
;;
;;;;;;;;;;;;;;;;;;;;;;;;;;


;; Require Melpa
(require 'package)
(add-to-list 'package-archives
  '("melpa" . "http://melpa.milkbox.net/packages/") t)

(when (< emacs-major-version 24)
  (add-to-list 'package-archives '("gnu" . "http://elpa.gnu.org/packages/")))

;; Require Marmalade
(add-to-list 'package-archives '("marmalade" . "http://marmalade-repo.org/packages/"))

(package-initialize) 

(require 'flymake-jslint) ;; Not necessary if using ELPA package
(add-hook 'js-mode-hook 'flymake-jslint-load)

;; (require 'sublimity)
;; (require 'sublimity-scroll)
;; (require 'sublimity-map)
;; (require 'sublimity-attractive)

;; (sublimity-mode 1)
