(add-to-list 'default-frame-alist '(fullscreen . fullscreen))

(require 'cask "~/.cask/cask.el")
(cask-initialize)    ; 类似于 package-initialize
(require 'pallet)
(pallet-mode t)      ; 激活 pallet, 在安装包时将 Cask 文件写入相应信息

(require 'use-package)
(add-to-list 'load-path "~/.emacs.d/lisp/")
(require 'init-mine)
(rainbow-delimiters-mode)

(setq tramp-ssh-controlmaster-options
      "-o ControlMaster=auto -o ControlPath='tramp.%%C' -o ControlPersist=no")

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(cdlatex-math-symbol-alist '((57 ("\\cap" "\\bigcap" "\\prod"))))
 '(cdlatex-paired-parens "$[{(<")
 '(custom-enabled-themes '(spacemacs-dark))
 '(custom-safe-themes
   '("bffa9739ce0752a37d9b1eee78fc00ba159748f50dc328af4be661484848e476" default))
 '(echo-keystrokes 0.01)
 '(evil-want-Y-yank-to-eol nil)
 '(google-translate--tkk-url "https://translate.google.cn")
 '(google-translate-base-url "https://translate.google.cn/translate_a/single")
 '(google-translate-default-source-language "en")
 '(google-translate-default-target-language "zh-CN")
 '(google-translate-enable-ido-completion t)
 '(google-translate-listen-url "https://translate.google.cn/translate_tts")
 '(google-translate-show-phonetic nil)
 '(helm-echo-input-in-header-line t)
 '(highlight-parentheses-colors '("#2aa198" "#b58900" "#268bd2" "#6c71c4" "#859900"))
 '(iflipb-ignore-buffers "^[*]")
 '(menu-bar-mode nil)
 '(org-confirm-babel-evaluate nil)
 '(org-default-notes-file (concat org-directory "/notes.org"))
 '(org-directory "~/Sync/orgfiles")
 '(org-export-html-postamble nil)
 '(org-export-with-toc nil)
 '(org-hide-leading-stars t)
 '(org-src-fontify-natively t)
 '(org-startup-folded 'overview)
 '(org-startup-indented t)
 '(package-selected-packages
   '(magit spacemacs-theme beacon bm company-math math-symbol-lists mmm-mode markdown-toc markdown-mode gh-md multiple-cursors yasnippet-snippets yasnippet unfill org-projectile org-category-capture org-present org-pomodoro alert log4e gntp org-mime org-download mwim htmlize gnuplot flyspell-correct-helm flyspell-correct flycheck-pos-tip pos-tip flycheck auto-dictionary cdlatex windswap counsel swiper iflipb ivy pallet solarized-theme ws-butler winum which-key volatile-highlights vi-tilde-fringe uuidgen use-package undo-tree toc-org spaceline restart-emacs request rainbow-delimiters popwin persp-mode pcre2el paradox org-plus-contrib org-bullets open-junk-file neotree move-text macrostep lorem-ipsum linum-relative link-hint indent-guide hungry-delete hl-todo highlight-parentheses highlight-numbers highlight-indentation helm-themes helm-swoop helm-projectile helm-mode-manager helm-make helm-flx helm-descbinds helm-company helm-c-yasnippet helm-ag google-translate golden-ratio fuzzy flx-ido fill-column-indicator fancy-battery eyebrowse expand-region exec-path-from-shell evil-visualstar evil-visual-mark-mode evil-unimpaired evil-tutor evil-surround evil-search-highlight-persist evil-numbers evil-nerd-commenter evil-mc evil-matchit evil-lisp-state evil-indent-plus evil-iedit-state evil-exchange evil-escape evil-ediff evil-args evil-anzu eval-sexp-fu elisp-slime-nav dumb-jump diminish define-word company-statistics company-auctex column-enforce-mode clean-aindent-mode auto-yasnippet auto-highlight-symbol auto-compile auctex-latexmk adaptive-wrap ace-window ace-link ace-jump-helm-line ac-ispell))
 '(preview-scale-function 2.2)
 '(rainbow-delimiters-mode)
 '(recentf-exclude
   '("/\\(\\(\\(COMMIT\\|NOTES\\|PULLREQ\\|MERGEREQ\\|TAG\\)_EDIT\\|MERGE_\\|\\)MSG\\|\\(BRANCH\\|EDIT\\)_DESCRIPTION\\)\\'" "~/.emacs.d/.cask/"))
 '(scroll-bar-mode nil)
 '(tool-bar-mode nil)
 '(tooltip-resize-echo-area t))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(default ((t (:family "Consolas" :foundry "outline" :slant normal :weight bold :height 143 :width normal)))))
