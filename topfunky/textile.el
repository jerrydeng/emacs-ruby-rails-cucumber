
(require 'textile-mode)

(add-to-list 'auto-mode-alist '("\\.textile\\'" . textile-mode))

(setq topfunky-textile-mode-imenu-generic-expression
      '(("Heading" "\\s-*\\(h[0-9]+\\. .+\\)" 1)
        ))
(add-hook 'textile-mode-hook
          (lambda ()
            (setq imenu-generic-expression
                  topfunky-textile-mode-imenu-generic-expression)))

(provide 'topfunky/textile)
