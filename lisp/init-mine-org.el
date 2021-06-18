(use-package org-bullets
  :ensure t
  :config
  (add-hook 'org-mode-hook (lambda () (org-bullets-mode 1))))

(global-set-key "\C-ca" 'org-agenda)
(setq org-agenda-start-on-weekday nil)
(setq org-agenda-custom-commands
      '(("c" "Simple agenda view"
         ((agenda "")
          (alltodo "")))))

(global-set-key (kbd "C-c c") 'org-capture)

(setq org-agenda-files (list
                        "~/Sync/orgfiles/gcal.org" 
                        "~/opt/gcal.org"
                        "~/opt/soe-cal.org"
                        "~/Sync/orgfiles/i.org"))
(setq org-capture-templates
      '(
        ("a" "Appointment" entry (file+headline "~/Sync/orgfiles/gcal.org" "Appointments")
         "* TODO %?\n:PROPERTIES:\n\n:END:\nDEADLINE: %^T \n %i\n")
        ("l" "Link" entry (file+headline "~/Sync/orgfiles/links.org" "Links")
         "* %a %^g\n %?\n %T\n %i")
        ("b" "Blog idea" entry (file+headline "~/Sync/orgfiles/i.org" "POSTS:")
         "* %?\n%T" :prepend t)
        ("t" "To Do Item" entry (file+headline "~/Sync/orgfiles/i.org" "To Do and Notes")
         "* TODO %?\n%u" :prepend t)
        ("m" "Mail To Do" entry (file+headline "~/Sync/orgfiles/i.org" "To Do and Notes")
         "* TODO %a\n %?" :prepend t)
        ("n" "Note" entry (file+olp "~/Sync/orgfiles/i.org" "Notes")
         "* %u %? " :prepend t)
        ("r" "RSS" entry (file+headline "~/Sync/shared/elfeed.org" "Feeds misc")
         "** %A %^g\n")
        ("j" "Journal" entry (file+datetree "~/Sync/orgfiles/journal.org" "Journal")
         "* %?\n Entered on %U\n %i\n %a")
        ))

(use-package elfeed
  :ensure t
  :config
  (global-set-key (kbd "C-x w") 'elfeed)
  (setf url-queue-timeout 30)
  (setq elfeed-feeds
        '(("http://nullprogram.com/feed/" blog emacs)
          ("http://www.50ply.com/atom.xml" 50ply)
          ("http://planet.emacsen.org/atom.xml" planet)
          ("http://nedroid.com/feed/" webcomic)))
  ;; Mark all YouTube entries
  ;; (add-hook 'elfeed-new-entry-hook
  ;;           (elfeed-make-tagger :feed-url "youtube\\.com"
  ;;                               :add '(video youtube)))
  :bind
  ("C-x x" . elfeed)
  )

(use-package projectile
  :ensure t
  :bind (:map projectile-mode-map
              ("M-p" . 'projectile-command-map)
              ("C-c p" . 'projectile-command-map)
              )

  :config 
  (setq projectile-completion-system 'ivy)

  (projectile-mode +1))


(use-package ibuffer-projectile
  :ensure t
  :config 
  (add-hook 'ibuffer-hook
            (lambda ()
              (ibuffer-projectile-set-filter-groups)
              (unless (eq ibuffer-sorting-mode 'alphabetic)
                (ibuffer-do-sort-by-alphabetic))))
  )

(use-package dumb-jump
  :bind (("M-g o" . dumb-jump-go-other-window)
         ("M-g j" . dumb-jump-go)
         ("M-g x" . dumb-jump-go-prefer-external)
         ("M-g z" . dumb-jump-go-prefer-external-other-window))
  :config 
  (setq dumb-jump-selector 'ivy) ;; (setq dumb-jump-selector 'helm)
  :init
  (dumb-jump-mode)
  :ensure
  )

(setq xref-show-definitions-function #'xref-show-definitions-completing-read)
(add-hook 'xref-backend-functions #'dumb-jump-xref-activate)

;; (use-package pdf-tools
;;   :ensure t
;;   :config
;;   (pdf-tools-install)
;;   )
;; (use-package org-pdftools
;;   :ensure t
;;   )

(use-package company
  :ensure t
  :init
  (setq company-backends
        '((company-files          ; files & directory
           company-keywords       ; keywords
           company-capf
           company-yasnippet
           )
          (company-abbrev company-dabbrev)
          ))
  :config
  (setq company-idle-delay 0)
  (setq company-minimum-prefix-length 2)
  (global-company-mode t)   
  )

(use-package multiple-cursors
  :ensure t
  )

(defhydra hydra-multiple-cursors (:hint nil)
  "
 Up^^             Down^^           Miscellaneous           % 2(mc/num-cursors) cursor%s(if (> (mc/num-cursors) 1) \"s\" \"\")
------------------------------------------------------------------
 [_p_]   Next     [_n_]   Next     [_l_] Edit lines  [_0_] Insert numbers
 [_P_]   Skip     [_N_]   Skip     [_a_] Mark all    [_A_] Insert letters
 [_M-p_] Unmark   [_M-n_] Unmark   [_s_] Search
 [Click] Cursor at point       [_q_] Quit"
  ("l" mc/edit-lines :exit t)
  ("a" mc/mark-all-like-this :exit t)
  ("n" mc/mark-next-like-this)
  ("N" mc/skip-to-next-like-this)
  ("M-n" mc/unmark-next-like-this)
  ("p" mc/mark-previous-like-this)
  ("P" mc/skip-to-previous-like-this)
  ("M-p" mc/unmark-previous-like-this)
  ("s" mc/mark-all-in-region-regexp :exit t)
  ("0" mc/insert-numbers :exit t)
  ("A" mc/insert-letters :exit t)
  ("<mouse-1>" mc/add-cursor-on-click)
  ;; Help with click recognition in this hydra
  ("<down-mouse-1>" ignore)
  ("<drag-mouse-1>" ignore)
  ("q" nil))

(use-package auto-yasnippet
  :ensure t
  )

;; some ediff settings
(setq ediff-diff-options "")
(setq ediff-custom-diff-options "-u")
(setq ediff-window-setup-function 'ediff-setup-windows-plain)
(setq ediff-split-window-function 'split-window-vertically)

(use-package magit
  :ensure t
  :init
  (progn
    (setq magit-section-initial-visibility-alist
          '((stashes . hide) (untracked . hide) (unpushed . hide)))


    (bind-key "C-x g" 'magit-status)
    ))

(setq magit-status-margin
      '(t "%Y-%m-%d %H:%M " magit-log-margin-width t 18))

(use-package git-timemachine
  :ensure t
  )

(use-package git-gutter-fringe
  :ensure t
  :config
  (global-git-gutter-mode))

(use-package forge
  :ensure t)

(use-package smartparens
  :ensure t
  :config
  (require 'smartparens-config)
  (add-hook 'minibuffer-setup-hook 'turn-on-smartparens-strict-mode)
  ;; pair management
  (sp-local-pair 'minibuffer-inactive-mode "'" nil :actions nil)
  (smartparens-global-mode)
  )

(use-package rainbow-delimiters
  :ensure t
  :init
  (rainbow-delimiters-mode)
  (add-hook 'prog-mode-hook #'rainbow-delimiters-mode)
  (add-hook 'org-mode-hook #'rainbow-delimiters-mode)
  )

(show-paren-mode t)

(use-package which-key
  :ensure t
  :config
  (which-key-mode)
  )

(setq-default cursor-type 'bar)

(rainbow-delimiters-mode)
(setq-default left-margin-width 15 right-margin-width 8)
(setq tramp-ssh-controlmaster-options
      "-o ControlMaster=auto -o ControlPath='tramp.%%C' -o ControlPersist=no")

(desktop-save-mode 1)
(savehist-mode 1)
(add-to-list 'savehist-additional-variables 'kill-ring)

(use-package aggressive-indent 
  :ensure t
  :config
  (global-aggressive-indent-mode 1)
  (add-to-list 'aggressive-indent-excluded-modes 'html-mode)
  )
