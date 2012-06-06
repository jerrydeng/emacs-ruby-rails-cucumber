;;; init.el --- Where all the magic begins
;;

;; UTF-8
(prefer-coding-system 'utf-8)

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

;; Load node or other binary
(setenv "PATH" (concat "/usr/local/bin:" (getenv "PATH")))
(setq exec-path
      '(
    "/usr/local/bin"
    "/usr/bin"
    ))

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

;; Set and load rhtml mode
(add-to-list 'load-path "~/.emacs.d/rhtml")
(require 'rhtml-mode)
(add-to-list 'auto-mode-alist '("\\.erb$" . rhtml-mode))
;; use rhtml mode for eco
(add-to-list 'auto-mode-alist '("\\.eco$" . rhtml-mode))

;; Load yaml mode
(require 'yaml-mode)
(add-to-list 'auto-mode-alist '("\\.yml$" . yaml-mode))

;; set emacs nav
;; (add-to-list 'load-path "~/.emacs.d/elisp/emacs-nav")
;; (require 'nav)
;; (nav)

;; set line num
(require 'linum+)
(setq linum-format " %d ")
(global-linum-mode t)

;; set color theme
(add-to-list 'load-path "~/.emacs.d/elisp/color-theme")
(require 'color-theme)
(color-theme-initialize)
(load-file "~/.emacs.d/themes/color-theme-twilight.el")
(color-theme-twilight)

;(add-to-list 'load-path "~/.emacs.d/themes/emacs-color-theme-solarized")
;(require 'color-theme-solarized)
;(color-theme-solarized-dark)

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
;;; turn on syntax hilighting≈≈
(global-font-lock-mode 1)

;;; use groovy-mode when file ends in .groovy or has #!/bin/groovy at start
(autoload 'groovy-mode "groovy-mode" "Groovy editing mode." t)
(add-to-list 'auto-mode-alist '("\.groovy$" . groovy-mode))
(add-to-list 'interpreter-mode-alist '("groovy" . groovy-mode))


;; load javascript mode
(add-to-list 'auto-mode-alist '("\\.js\\'" . javascript-mode))
(autoload 'javascript-mode "javascript" nil t)

;; zencoding mode
(add-to-list 'load-path "~/.emacs.d/zencoding/")
(require 'zencoding-mode)
(add-hook 'sgml-mode-hook 'zencoding-mode) ;; Auto-start on any markup modes

;; yasnippet code (ruby) completion
(require 'yasnippet-bundle)
(yas/load-directory "~/.emacs.d/snippets/")

;; load Sass SCSS mode
(add-to-list 'load-path (expand-file-name "~/.emacs.d"))
(autoload 'scss-mode "scss-mode")
(add-to-list 'auto-mode-alist '("\\.scss\\'" . scss-mode))
(setq scss-compile-at-save nil)

;; use css mode for css.erb
(add-to-list 'auto-mode-alist '("\\.css.erb\\'" . css-mode))

;; load Clojure-mode
(add-to-list 'load-path "~/.emacs.d/clojure-mode")
(require 'clojure-mode)

;; load Coffee-Script Mode
(add-to-list 'load-path "~/.emacs.d/coffee-mode")
(require 'coffee-mode)
(add-to-list 'auto-mode-alist '("\\.coffee$" . coffee-mode))
(add-to-list 'auto-mode-alist '("Cakefile" . coffee-mode))

;; load MATLAB Mode
(add-to-list 'load-path "~/.emacs.d/matlab")
(require 'matlab)

;; maximize screen on startup
(require 'maxframe)
(add-hook 'window-setup-hook 'maximize-frame t)

;; x-copy to clipboard
(setq x-select-enable-clipboard t)

;; dirtree
(require 'dirtree)
(global-set-key (kbd "C-x C-o") 'dirtree)

;; mustache
(add-to-list 'load-path "~/.emacs.d/mustache-mode")
(require 'mustache-mode)
(add-to-list 'auto-mode-alist '("\\.handlebars$" . mustache-mode))

;; set global tab width
(setq-default tab-width 4)

;; set coffeescript indentation
(defun coffee-custom ()
  "coffee-mode-hook"
 (set (make-local-variable 'tab-width) 2))

(add-hook 'coffee-mode-hook
  '(lambda() (coffee-custom)))

;; jade
(add-to-list 'load-path "~/.emacs.d/vendor/jade-mode")
(require 'sws-mode)
(require 'jade-mode)    
(add-to-list 'auto-mode-alist '("\\.styl$" . sws-mode))
(add-to-list 'auto-mode-alist '("\\.jade$" . jade-mode))

;; load jshint
(add-to-list 'load-path "~/.emacs.d/jshint-mode")
(require 'flymake-jshint)
(add-hook 'javascript-mode-hook
          (lambda () (flymake-mode t)))

;; Turns on flymake for all files which have a flymake mode
(add-hook 'find-file-hook 'flymake-find-file-hook)

(provide 'init)
;;; init.el ends here
