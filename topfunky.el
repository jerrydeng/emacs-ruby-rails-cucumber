;; DESCRIPTION: topfunky settings

;; Manually set PATH for use by eshell, rspec-mode, etc.
(let ((path))
  (setq path (concat "~/.gem/ruby/1.8/bin:"
                     "~/bin:"
                     "~/src/homebrew/bin:"
                     "/usr/local/bin:"
                     "/usr/bin:"
                     "/bin"))
  (setenv "PATH" path))

(add-to-list 'load-path (concat dotfiles-dir "/vendor"))

(require 'topfunky/meta)

;; Clojure
;;(eval-after-load 'clojure-mode '(clojure-slime-config))

(require 'topfunky/plain-text)

;; Snippets
(add-to-list 'load-path (concat dotfiles-dir "/vendor/yasnippet.el"))
(require 'yasnippet)
(yas/initialize)
(yas/load-directory (concat dotfiles-dir "/vendor/yasnippet.el/snippets"))

(require 'unbound)

(add-to-list 'load-path (concat dotfiles-dir "/vendor/textmate.el"))
(require 'textmate)
(require 'peepopen)
(require 'topfunky/textmate-ext)
(textmate-mode)

(require 'whitespace)

(require 'topfunky/python)

;; ruby-mode
(require 'topfunky/sinatra)
(add-to-list 'load-path (concat dotfiles-dir "/vendor/ruby-complexity"))
(require 'linum)
(require 'ruby-complexity)
(add-hook 'ruby-mode-hook
          (function (lambda ()
                      (flymake-mode)
                      (linum-mode)
                      (ruby-complexity-mode)
                      )))

(add-to-list 'load-path (concat dotfiles-dir "/vendor/cucumber"))
(require 'feature-mode)
(require 'topfunky/cucumber)

(require 'topfunky/js)

;; Remove scrollbars and make hippie expand
;; work nicely with yasnippet
(when (fboundp 'scroll-bar-mode) (scroll-bar-mode -1))
(require 'hippie-exp)
(setq hippie-expand-try-functions-list
      '(yas/hippie-try-expand
        try-expand-dabbrev
        try-expand-dabbrev-visible
        try-expand-dabbrev-all-buffers
        ;;        try-expand-dabbrev-from-kill
        ;;         try-complete-file-name
        ;;         try-complete-file-name-partially
        ;;         try-complete-lisp-symbol
        ;;         try-complete-lisp-symbol-partially
        ;;         try-expand-line
        ;;         try-expand-line-all-buffers
        ;;         try-expand-list
        ;;         try-expand-list-all-buffers
        ;;        try-expand-whole-kill
        ))

(defun indent-or-complete ()
  (interactive)
  (if (and (looking-at "$") (not (looking-back "^\\s-*")))
      (hippie-expand nil)
    (indent-for-tab-command)))
(add-hook 'find-file-hooks (function (lambda ()
                                       (local-set-key (kbd "TAB") 'indent-or-complete))))

;; dabbrev-case-fold-search for case-sensitive search

(require 'topfunky/rinari)

(add-to-list 'load-path (concat dotfiles-dir "/vendor/rspec-mode"))
(require 'rspec-mode)

(require 'topfunky/applescript)
(require 'topfunky/org)
(require 'topfunky/textile)
(require 'topfunky/markdown)
(require 'topfunky/haml)
(require 'topfunky/xcode)
(require 'topfunky/keyboard)

;; gist
(require 'gist)

;; Mercurial
;;(require 'mercurial)

;; Color Themes
(add-to-list 'load-path (concat dotfiles-dir "/vendor/color-theme"))
(require 'color-theme)
(color-theme-initialize)

;; Activate theme
(load (concat dotfiles-dir "topfunky/theme.el"))
(color-theme-topfunky)
