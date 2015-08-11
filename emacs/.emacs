;; Emacs config
;; @author matteo.muscella@usi.ch

(require 'cl)


;;;; Benchmarking

(defvar *emacs-load-start* (current-time))
(defun anarcat/time-to-ms (time)
  (+ (* (+ (* (car time)
              (expt 2 16))
           (car (cdr time)))
        1000000)
     (car(cdr (cdr time)))))
(defun anarcat/display-timing ()
  (message
   ".emacs loaded in %fms"
   (/ (- (anarcat/time-to-ms (current-time))
         (anarcat/time-to-ms *emacs-load-start*))
      1000000.0)))
(add-hook 'after-init-hook 'anarcat/display-timing t)



;;;; Necessary function

(defun add-subfolders-to-load-path (parent-dir &optional the-list)
  "Adds all first level `parent-dir' subdirs to a list.  Default
to the Emacs load path."
  (let ((mlist (if the-list the-list 'load-path )))
    (add-subfolders-to-list parent-dir mlist)))

(defun add-subfolders-to-list (parent-dir the-list)
  "Adds all first level `parent-dir' subdirs to a list."
  (dolist (file (directory-files parent-dir t "\\w+"))
    (when (file-directory-p file)
      (add-to-list the-list file))))

(defun make-dir-if-nec (the-dir)
  "Create `dir` if not present. Assume `base-dir` is set"
  (unless (file-exists-p the-dir)
  (make-directory the-dir)))



;;;; Constants

(defconst base-dir     "~/.emacs.d/")
(defconst elisp-dir    (expand-file-name "elisp"    base-dir))
(defconst vendor-dir   (expand-file-name "vendor"   base-dir))
(defconst themes-dir   (expand-file-name "themes"   base-dir))
(defconst snippets-dir (expand-file-name "snippets" base-dir))
(defconst savefile-fil (expand-file-name "saves"    base-dir))
(defconst savefile-dir (expand-file-name "savefile" base-dir))
(defconst personal-dir (expand-file-name "personal" base-dir)
  "All Emacs Lisp files here are loaded automatically.")



;;;; Init

(make-dir-if-nec elisp-dir)
(make-dir-if-nec vendor-dir)
(make-dir-if-nec themes-dir)
(make-dir-if-nec snippets-dir)
(make-dir-if-nec savefile-dir)
(make-dir-if-nec personal-dir)

(add-to-list 'load-path elisp-dir)
(add-to-list 'load-path vendor-dir)
(add-to-list 'load-path personal-dir)



;;;; Package Manager

(require 'package)
(setq package-archives '(("gnu" . "http://elpa.gnu.org/packages/")
                         ("marmalade" . "https://marmalade-repo.org/packages/")
                         ("melpa" . "http://melpa.org/packages/")
			 ("org" . "http://orgmode.org/elpa/")))
(package-initialize)

(defconst my-packages
  '(auctex
    auto-complete autopair
    clang-format
    color-theme-sanityinc-tomorrow
    color-theme-sanityinc-solarized
    gnuplot gnuplot-mode haskell-mode
    magit php-mode
    rainbow-mode rainbow-delimiters
    yasnippet)
  "A list of packages to ensure are installed at launch.")

(defun my-packages-installed-p ()
  (loop for p in my-packages
        when (not (package-installed-p p)) do (return nil)
        finally (return t)))

(unless (my-packages-installed-p)
  ;; check for new packages (package versions)
  (message "%s" "Emacs is now refreshing its package database...")
  (package-refresh-contents)
  (message "%s" " done.")
  ;; install the missing packages
  (dolist (p my-packages)
    (when (not (package-installed-p p))
      (package-install p))))



;;;; Appearance

(setq-default frame-title-format #'("" "%b")
              initial-scratch-message ";;"
              custom-theme-directory "~/.emacs.d/themes"
              linum-format "%d  "
              transient-mark-mode 0
              inhibit-startup-message t
              line-spacing 5)

(setq default-font-list-index 7)
(setq font-list-index default-font-list-index)

(setq font-list
      (list "-*-agave for Powerline-*-*-*-*-*-140-*-*-*-*-*-*"
            "-*-Anka/Coder-*-*-*-*-*-140-*-*-*-*-*-*"
            "-*-Anonymous Pro for Powerline-*-*-*-*-*-140-*-*-*-*-*-*"
            "-*-Consolas-*-*-*-*-*-140-*-*-*-*-*-*"
            "-*-Droid Sans Mono for Powerline-*-*-*-*-*-120-*-*-*-*-*-*"
            "-*-Fira Mono Medium for Powerline-*-*-*-*-*-140-*-*-*-*-*-*"
            "-*-GohuFont-*-*-*-*-*-140-*-*-*-*-*-*"
            "-*-Inconsolata for Powerline-*-*-*-*-*-150-*-*-*-*-*-*"
            "-*-M+ 1m-*-*-*-*-*-140-*-*-*-*-*-*"
            "-*-Monaco-*-*-*-*-*-120-*-*-*-*-*-*"
            "-*-PragmataPro-*-*-*-*-*-140-*-*-*-*-*-*"
            "-*-Source Code Pro for Powerline-*-*-*-*-*-140-*-*-*-*-*-*"))

(when (display-graphic-p)
  (cond ((string-equal system-type "darwin")
         (progn
           (menu-bar-mode 1)
           (set-frame-font (nth default-font-list-index font-list) nil t)
           (load-theme 'sanityinc-solarized-light t)
           ))
        ((or (string-equal system-type "gnu")
             (string-equal system-type "gnu/linux"))
         (progn
           (menu-bar-mode 0)
           (set-frame-font (nth default-font-list-index font-list) nil t)
           (load-theme 'sanityinc-tomorrow-night t)
           ))))

(add-hook 'linum-mode-hook
          (lambda()
            (set-face-attribute 'fringe nil :background "#fdf6e3")
            (set-face-attribute 'linum nil :background "#fdf6e3")))

(tool-bar-mode 0)
(scroll-bar-mode 0)
(blink-cursor-mode 0)
(column-number-mode 1)
(size-indication-mode 1)
(set-fringe-mode 0)
(show-paren-mode t)
(setq confirm-kill-emacs 'y-or-n-p)

;; scroll one line at a time (less "jumpy" than defaults)
(setq mouse-wheel-scroll-amount '(1 ((shift) . 1))) ;; one line at a time
(setq mouse-wheel-progressive-speed nil) ;; don't accelerate scrolling
(setq mouse-wheel-follow-mouse 't) ;; scroll window under mouse
(setq scroll-step 1) ;; keyboard scroll one line at a time


;;;; Interactively Do Things

(require 'ido)
(setq ido-enable-flex-matching t
      ido-everywhere t)
(ido-mode t)



;;;; Backup and Save places

(require 'saveplace)
(setq save-place-file savefile-fil)
(setq
 backup-directory-alist
 `((".*" . ,savefile-dir))
 auto-save-file-name-transforms
 `((".*" ,savefile-dir t))
 backup-by-copying t      ; don't clobber symlinks
 delete-old-versions t
 kept-new-versions 6
 kept-old-versions 2
 version-control t)       ; use versioned backups

(defun prelude-auto-save-command ()
  "Save the current buffer if appropriate."
  (when (and buffer-file-name
             (buffer-modified-p (current-buffer))
             (file-writable-p buffer-file-name))
    (save-buffer)))

(defadvice switch-to-buffer (before save-buffer-now activate)
  "Invoke `prelude-auto-save-command' before `switch-to-window'."
  (prelude-auto-save-command))
(defadvice other-window (before other-window-now activate)
  "Invoke `prelude-auto-save-command' before `other-window'."
  (prelude-auto-save-command))

(add-hook 'mouse-leave-buffer-hook 'prelude-auto-save-command)



;;;; Autocomplete
(setq hippie-expand-try-functions-list
      '(try-expand-dabbrev
        try-expand-dabbrev-all-buffers
        try-expand-dabbrev-from-kill
        try-complete-file-name-partially
        try-complete-file-name
        try-expand-all-abbrevs
        try-expand-list
        try-expand-line
        try-complete-lisp-symbol-partially
        try-complete-lisp-symbol))

;; Stop completion-at-point from popping up completion buffers so eagerly
(setq completion-cycle-threshold 5)

;; Yasnippets
(require 'yasnippet)

;; Auto Complete
(ac-config-default)



;;;; Editor

(defalias 'yes-or-no-p 'y-or-n-p)

(setq locale-coding-system   'utf-8)    ; pretty
(set-terminal-coding-system  'utf-8)    ; pretty
(set-keyboard-coding-system  'utf-8)    ; pretty
(set-selection-coding-system 'utf-8)    ; please
(prefer-coding-system        'utf-8)    ; with sugar on top

(setq-default buffer-file-coding-system 'utf-8)

(setq-default indent-tabs-mode nil)  ; don't use tabs to indent
(setq-default tab-width 8)           ; but maintain correct appearance

(setq x-select-enable-clipboard t
      save-interprogram-paste-before-kill nil
      apropos-do-all t
      mouse-yank-at-point t)

(setq magit-auto-revert-mode nil)
(setq magit-last-seen-setup-instructions "1.4.0")

(setq-default c-basic-offset 4
              c-default-style "ellemtel")

(add-hook 'emacs-lisp-mode-hook 'imenu-elisp-sections)

(require 'compile)

(add-hook 'c-mode-hook                  ; set default compile command
          (lambda ()
            (set (make-local-variable 'compile-command)
                 (format "gcc -Wall -o %s %s"
                         (file-name-base buffer-file-name)
                         (file-name-nondirectory buffer-file-name)))))

(add-hook 'c++-mode-hook
          (lambda ()
            (set (make-local-variable 'compile-command)
                 (format "g++ -Wall -o %s %s"
                         (file-name-base buffer-file-name)
                         (file-name-nondirectory buffer-file-name)))))

(add-hook 'c-mode-common-hook 
          (lambda () (define-key c-mode-base-map (kbd "C-c C-c") 'compile)))




;;;; Keys

(global-unset-key (kbd "C-x C-+"))
(global-unset-key (kbd "C-x C--"))
(global-set-key (kbd "C-M-=")     'text-scale-increase)
(global-set-key (kbd "C-M--")     'text-scale-decrease)
(global-set-key (kbd "C--")       'prev-font)
(global-set-key (kbd "C-=")       'next-font)
(global-set-key (kbd "C-0")       'default-font)
(global-set-key (kbd "C-x C-b")   'ido-switch-buffer)
(global-set-key (kbd "C-c C-r")   'eval-region)
(global-set-key (kbd "C-c C-b")   'eval-buffer)
(global-set-key (kbd "s-<left>")  'windmove-left)
(global-set-key (kbd "s-<right>") 'windmove-right)
(global-set-key (kbd "s-<up>")    'windmove-up)
(global-set-key (kbd "s-<down>")  'windmove-down)
(global-set-key (kbd "C-c C-s")   'shell)
(global-set-key (kbd "C-c C-n")   'linum-mode)
(global-set-key (kbd "s-F")       'clang-format-buffer)
(global-set-key (kbd "C-x g")     'magit-status)



;;;; Functions

(defun next-font ()
  "Selects next font in the font list"
  (interactive)
  (progn
    (setq font-list-index (min (- (length font-list) 1)
                               (+ font-list-index 1)))
    (message (nth font-list-index font-list))
    (set-frame-font (nth font-list-index font-list))))

(defun prev-font ()
  "Selects previous font in the font list"
  (interactive)
  (progn
    (setq font-list-index (max 0
                               (- font-list-index 1)))
    (message (nth font-list-index font-list))
    (set-frame-font (nth font-list-index font-list))))

(defun default-font ()
  "Sets frames font as in 'default-font-list-index"
  (interactive)
  (progn
    (setq font-list-index default-font-list-index)
    (message (nth font-list-index font-list))
    (set-frame-font (nth font-list-index font-list))))

(defun imenu-elisp-sections ()
  "Imenu display if four comment syntax ;;;;"
  (setq imenu-prev-index-position-function nil)
  (add-to-list 'imenu-generic-expression '(nil "^;;;; \\(.+\\)$" 1) t))

(defun set-default-compilation-command (mode command)
  "Add a new default compilation command to major mode"
  (add-hook mode
            (lambda ()
              (set (make-local-variable 'compile-command) command))))
