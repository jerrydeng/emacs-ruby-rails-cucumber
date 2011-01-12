;;; init.el --- Where all the magic begins
;;
;; Part of the Emacs Starter Kit
;;
;; This is the first thing to get loaded.
;;
;; "Emacs outshines all other editing software in approximately the
;; same way that the noonday sun does the stars. It is not just bigger
;; and brighter; it simply makes everything else vanish."
;; -Neal Stephenson, "In the Beginning was the Command Line"

;; Benchmarking
(defvar *emacs-load-start* (current-time))

;; Load path etc:

(setq dotfiles-dir (file-name-directory
                    (or (buffer-file-name) load-file-name)))
(add-to-list 'load-path dotfiles-dir)
(add-to-list 'load-path (concat dotfiles-dir "/elpa-to-submit"))
(setq autoload-file (concat dotfiles-dir "loaddefs.el"))
(setq package-user-dir (concat dotfiles-dir "elpa"))
(setq custom-file (concat dotfiles-dir "custom.el"))

;; These should be loaded on startup rather than autoloaded on demand
;; since they are likely to be used in every session:

(require 'cl)
(require 'saveplace)
(require 'ffap)
(require 'uniquify)
(require 'ansi-color)
(require 'recentf)

;; Load up ELPA, the package manager:

(require 'package)
(package-initialize)
;;(require 'starter-kit-elpa)

;; Load up starter kit customizations:

(require 'starter-kit-defuns)
(require 'starter-kit-bindings)
(require 'starter-kit-misc)
(require 'starter-kit-registers)
(require 'starter-kit-eshell)
(require 'starter-kit-lisp)
(require 'starter-kit-ruby)
(require 'starter-kit-js)

(regen-autoloads)
(load custom-file 'noerror)

;; You can keep system- or user-specific customizations here:

(setq system-specific-config (concat dotfiles-dir system-name ".el")
      user-specific-config (concat dotfiles-dir user-login-name ".el"))

(if (file-exists-p system-specific-config) (load system-specific-config))
(if (file-exists-p user-specific-config) (load user-specific-config))

;; load cucumber mode
;; Copy files to ~/.emacs.d/elisp/feature-mode and add this to your
;; .emacs to load the mode
(add-to-list 'load-path "~/.emacs.d/elisp/feature-mode")
;; ;; optional configurations
;; ;; default language if .feature doesn't have "# language: fi"
;; ;(setq feature-default-language "fi")
;; ;; point to cucumber languages.yml or gherkin i18n.yml to use
;; ;; exactly the same localization your cucumber uses
;; ;(setq feature-default-i18n-file "/path/to/gherkin/gem/i18n.yml")
;; ;; and load feature-mode
(require 'feature-mode)
(add-to-list 'auto-mode-alist '("\.feature$" . feature-mode))

;; Set and load rspec not working below
(add-to-list 'load-path "~/.emacs.d/elisp")
(require 'rspec-mode)

;; Set rails minor-mode
(add-to-list 'load-path (expand-file-name "~/.emacs.d/rails-minor-mode"))
;;(require 'rails)

;; Set and load php mode
(add-to-list 'load-path "~/.emacs.d/elisp")
(load "php-mode")
(add-to-list 'auto-mode-alist '("\\.php[34]?\\'\\|\\.phtml\\'" . php-mode))

;; Set and load ruby-mode
(load "ruby-mode")
(load "inf-ruby")
(load "ruby-electric")

;; Load yaml mode
(require 'yaml-mode)
(add-to-list 'auto-mode-alist '("\\.yml$" . yaml-mode))

;; set to full screen
"Emacs outshines all other editing software in approximately the
;; same way that the noonday sun does the stars. It is not just bigger
;; and brighter; it simply makes everything else vanish."
;; -Neal Stephenson, "In the Beginning was the Command Line"

;; Benchmarking
(defvar *emacs-load-start* (current-time))

;; Load path etc:

(setq dotfiles-dir (file-name-directory
                    (or (buffer-file-name) load-file-name)))
(add-to-list 'load-path dotfiles-dir)
(add-to-list 'load-path (concat dotfiles-dir "/elpa-to-submit"))
(setq autoload-file (concat dotfiles-dir "loaddefs.el"))
(setq package-user-dir (concat dotfiles-dir "elpa"))
(setq custom-file (concat dotfiles-dir "custom.el"))

;; These should be loaded on startup rather than autoloaded on demand
;; since they are likely to be used in every session:

(require 'cl)
(require 'saveplace)
(require 'ffap)
(require 'uniquify)
(require 'ansi-color)
(require 'recentf)

;; Load up ELPA, the package manager:

(require 'package)
(package-initialize)
;;(require 'starter-kit-elpa)

;; Load up starter kit customizations:

(require 'starter-kit-defuns)
(require 'starter-kit-bindings)
(require 'starter-kit-misc)
(require 'starter-kit-registers)
(require 'starter-kit-eshell)
(require 'starter-kit-lisp)
(require 'starter-kit-ruby)
(require 'starter-kit-js)

(regen-autoloads)
(load custom-file 'noerror)

;; You can keep system- or user-specific customizations here:

(setq system-specific-config (concat dotfiles-dir system-name ".el")
      user-specific-config (concat dotfiles-dir user-login-name ".el"))

(if (file-exists-p system-specific-config) (load system-specific-config))
(if (file-exists-p user-specific-config) (load user-specific-config))

;; load cucumber mode
;; Copy files to ~/.emacs.d/elisp/feature-mode and add this to your
;; .emacs to load the mode
(add-to-list 'load-path "~/.emacs.d/elisp/feature-mode")
;; ;; optional configurations
;; ;; default language if .feature doesn't have "# language: fi"
;; ;(setq feature-default-language "fi")
;; ;; point to cucumber languages.yml or gherkin i18n.yml to use
;; ;; exactly the same localization your cucumber uses
;; ;(setq feature-default-i18n-file "/path/to/gherkin/gem/i18n.yml")
;; ;; and load feature-mode
(require 'feature-mode)
(add-to-list 'auto-mode-alist '("\.feature$" . feature-mode))

;; Set and load rspec not working below
(add-to-list 'load-path "~/.emacs.d/elisp")
(require 'rspec-mode)

;; Set rails minor-mode
(add-to-list 'load-path (expand-file-name "~/.emacs.d/rails-minor-mode"))
;;(require 'rails)

;; Set and load php mode
(add-to-list 'load-path "~/.emacs.d/elisp")
(load "php-mode")
(add-to-list 'auto-mode-alist '("\\.php[34]?\\'\\|\\.phtml\\'" . php-mode))

;; Set and load ruby-mode
(load "ruby-mode")
(load "inf-ruby")
(load "ruby-electric")

;; Load yaml mode
(require 'yaml-mode)
(add-to-list 'auto-mode-alist '("\\.yml$" . yaml-mode))

;; set emacs nav
(add-to-list 'load-path "~/.emacs.d/elisp/emacs-nav")
(require 'nav)
(nav)

;; set color theme
(add-to-list 'load-path "~/.emacs.d/elisp/color-theme")
(require 'color-theme)
(color-theme-initialize)
(load-file "~/.emacs.d/themes/color-theme-blackboard.el")
(color-theme-blackboard)

;; Benchmarking
(message "My .emacs loaded in %ds"
         (destructuring-bind (hi lo ms) (current-time)
           (- (+ hi lo) (+ (first *emacs-load-start*) (second
                                                       *emacs-load-start*)))))

;; load scala-mode
(add-to-list 'load-path (expand-file-name "~/.emacs.d/scala-mode"))
(require 'scala-mode)
(add-to-list 'auto-mode-alist '("\\.scala$" . scala-mode))
;;(add-hook 'scala-mode-hook '(lambda () (yas/minor-mode-on)))

;; check and use local copy for ftp edit
(setq recentf-keep '(file-remote-p file-readable-p))

; try to improve slow performance on windows.
(setq w32-get-true-file-attributes nil)

;; add groovy support
;;; turn on syntax hilighting
(global-font-lock-mode 1)

;;; use groovy-mode when file ends in .groovy or has #!/bin/groovy at start
(autoload 'groovy-mode "groovy-mode" "Groovy editing mode." t)
(add-to-list 'auto-mode-alist '("\.groovy$" . groovy-mode))
(add-to-list 'interpreter-mode-alist '("groovy" . groovy-mode))


;; load javascript mode
(add-to-list 'auto-mode-alist '("\\.js\\'" . javascript-mode))
(autoload 'javascript-mode "javascript" nil t)

(provide 'init)
;;; init.el ends here
