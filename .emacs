;; Sane Defauts
;(tool-bar-mode -1)
(scroll-bar-mode -1)
(add-hook 'before-save-hook
          'delete-trailing-whitespace)
(menu-bar-mode -1)
(set-fringe-mode 10)   ;Give some breathing room
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
