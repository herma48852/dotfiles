;; Sane Defauts

;; Only available in graphical emacs
;(tool-bar-mode -1)
;(scroll-bar-mode -1)
;(set-fringe-mode 10)

(add-hook 'before-save-hook
          'delete-trailing-whitespace)
(menu-bar-mode -1)
(setq inhibit-startup-message -1)

(setq visible-bell nil)

(setq-default indent-tabs-mode nil)

(defun prada ()
  (interactive)
  (find-file "/plink:herman@prada:/home/herman/working-dirs"))


(setq explicit-shell-file-name "/bin/bash")

(load-theme 'tango-dark)


(require 'package)

(setq package-archives '(("melpa" . "https://melpa.org/packages/")
                         ("org"   . "https://orgmode.org/elpa/")
                         ("elpa"  . "https://elpa.gnu.org/packages/")))

(package-initialize)
(unless package-archive-contents
  (package-refresh-contents)
  )

;; Initialize use-package on non-Linux platforms
(unless (package-installed-p 'use-package)
  (package-install 'use-package))

(require 'use-package)
(setq use-package-always-ensure t)

;(use-package command-log-mode)

(use-package counsel)
(use-package magit)
(use-package ivy
  :diminish
  :bind (("C-s" . swiper)
         :map ivy-switch-buffer-map
         :map ivy-minibuffer-map
         :map ivy-reverse-i-search-map
         )
  :config
  (ivy-mode 1))

(column-number-mode)
(global-display-line-numbers-mode t)
;; Disable line number in org mode, terminals and shells
(dolist (mode '(org-mode-hook
                term-mode-hook
                shell-mode-hook
                eshell-mode-hook))
  (add-hook mode (lambda () (display-line-numbers-mode 0))))

(use-package rainbow-delimiters
  :hook (prog-mode . rainbow-delimiters-mode))

(use-package which-key
  :init (which-key-mode)
  :diminish which-key-mode
  :config
  (setq which-key-idle-delay 0.3))

(use-package ivy-rich
  :init
  (ivy-rich-mode 1))

(use-package which-key
  :init (which-key-mode)
  :diminish whick-key-mode
  :config
  (setq which-key-idle-delay 0.3))

(use-package counsel
  :bind (("M-x" . counsel-M-x)
         ("C-x b" . counsel-ibuffer)
         ("C-x C-f" . counsel-find-file)
         ("C-M-l" . counsel-imenu)
         :map minibuffer-local-map
         ("C-r" . 'counsel-minibuffer-history)))

(use-package helpful
  :ensure t
  :custom
  (counsel-describe-function-function #'helpful-callable)
  (counsel-describe-variable-function #'helpful-variable)
  :bind
  ([remap describe-function] . counsel-describe-function)
  ([remap describe-command] . helpful-command)
  ([remap describe-variable] . counsel-describe-variable)
  ([remap describe-key] . helpful-key))
