;; -*- mode: emacs-lisp -*-
;; This file is loaded by Spacemacs at startup.
;; It must be stored in your home directory.

(defun dotspacemacs/layers ()
  "Configuration Layers declaration.
You should not put any user code in this function besides modifying the variable
values."
  (setq-default
   ;; Base distribution to use. This is a layer contained in the directory
   ;; `+distribution'. For now available distributions are `spacemacs-base'
   ;; or `spacemacs'. (default 'spacemacs)
   dotspacemacs-distribution 'spacemacs
   ;; List of additional paths where to look for configuration layers.
   ;; Paths must have a trailing slash (i.e. `~/.mycontribs/')
   dotspacemacs-configuration-layer-path '("~/Dropbox/dotfiles/myspacemacslayers/")
   ;; List of configuration layers to load. If it is the symbol `all' instead
   ;; of a list then all discovered layers will be installed.
   dotspacemacs-configuration-layers
   '(
     ;; ----------------------------------------------------------------
     ;; Example of useful layers you may want to use right away.
     ;; Uncomment some layer names and press <SPC f e R> (Vim style) or
     ;; <M-m f e R> (Emacs style) to install them.
     ;; ----------------------------------------------------------------
     auto-completion
     emacs-lisp
     better-defaults
     git
     (haskell :variables haskell-enable-ghci-ng-support t)
     markdown
     org
     (shell :variables
            shell-default-height 30
            shell-default-position 'bottom)
     spell-checking
     syntax-checking
     version-control
     rcirc
     (auto-completion :variables
                      auto-completion-enable-help-tooltip t
                      auto-completion-enable-snippets-in-popup t)
     latex
     sml
     ocaml
     search-engine
     speed-reading
     themes-megapack
     emoji
     xkcd
     writeroom
     (colors :variables colors-enable-nyan-cat-progress-bar t)
     )
   ;; List of additional packages that will be installed without being
   ;; wrapped in a layer. If you need some configuration for these
   ;; packages, then consider creating a layer. You can also put the
   ;; configuration in `dotspacemacs/user-config'.
   dotspacemacs-additional-packages '()
   ;; A list of packages and/or extensions that will not be install and loaded.
   dotspacemacs-excluded-packages '()
   ;; If non-nil spacemacs will delete any orphan packages, i.e. packages that
   ;; are declared in a layer which is not a member of
   ;; the list `dotspacemacs-configuration-layers'. (default t)
   dotspacemacs-delete-orphan-packages t))

(defun dotspacemacs/init ()
  "Initialization function.
This function is called at the very startup of Spacemacs initialization
before layers configuration.
You should not put any user code in there besides modifying the variable
values."
  ;; This setq-default sexp is an exhaustive list of all the supported
  ;; spacemacs settings.
  (setq-default
   ;; If non nil ELPA repositories are contacted via HTTPS whenever it's
   ;; possible. Set it to nil if you have no way to use HTTPS in your
   ;; environment, otherwise it is strongly recommended to let it set to t.
   ;; This variable has no effect if Emacs is launched with the parameter
   ;; `--insecure' which forces the value of this variable to nil.
   ;; (default t)
   dotspacemacs-elpa-https t
   ;; Maximum allowed time in seconds to contact an ELPA repository.
   dotspacemacs-elpa-timeout 5
   ;; If non nil then spacemacs will check for updates at startup
   ;; when the current branch is not `develop'. (default t)
   dotspacemacs-check-for-update t
   ;; One of `vim', `emacs' or `hybrid'. Evil is always enabled but if the
   ;; variable is `emacs' then the `holy-mode' is enabled at startup. `hybrid'
   ;; uses emacs key bindings for vim's insert mode, but otherwise leaves evil
   ;; unchanged. (default 'vim)
   dotspacemacs-editing-style 'vim
   ;; If non nil output loading progress in `*Messages*' buffer. (default nil)
   dotspacemacs-verbose-loading nil
   ;; Specify the startup banner. Default value is `official', it displays
   ;; the official spacemacs logo. An integer value is the index of text
   ;; banner, `random' chooses a random text banner in `core/banners'
   ;; directory. A string value must be a path to an image format supported
   ;; by your Emacs build.
   ;; If the value is nil then no banner is displayed. (default 'official)
   dotspacemacs-startup-banner 'official
   ;; List of items to show in the startup buffer. If nil it is disabled.
   ;; Possible values are: `recents' `bookmarks' `projects'.
   ;; (default '(recents projects))
   dotspacemacs-startup-lists '(recents projects)
   ;; Number of recent files to show in the startup buffer. Ignored if
   ;; `dotspacemacs-startup-lists' doesn't include `recents'. (default 5)
   dotspacemacs-startup-recent-list-size 5
   ;; Default major mode of the scratch buffer (default `text-mode')
   dotspacemacs-scratch-mode 'text-mode
   ;; List of themes, the first of the list is loaded when spacemacs starts.
   ;; Press <SPC> T n to cycle to the next theme in the list (works great
   ;; with 2 themes variants, one dark and one light)
   dotspacemacs-themes '(
                         tango
                         spacemacs-dark
                         spacemacs-light
                         solarized-light
                         solarized-dark
                         leuven
                         monokai
                         zenburn)
   ;; If non nil the cursor color matches the state color in GUI Emacs.
   dotspacemacs-colorize-cursor-according-to-state t
   ;; Default font. `powerline-scale' allows to quickly tweak the mode-line
   ;; size to make separators look not too crappy.
   dotspacemacs-default-font '("Source Code Pro"
                               :size 13
                               :weight normal
                               :width normal
                               :powerline-scale 1.1)
   ;; The leader key
   dotspacemacs-leader-key "SPC"
   ;; The leader key accessible in `emacs state' and `insert state'
   ;; (default "M-m")
   dotspacemacs-emacs-leader-key "M-m"
   ;; Major mode leader key is a shortcut key which is the equivalent of
   ;; pressing `<leader> m`. Set it to `nil` to disable it. (default ",")
   dotspacemacs-major-mode-leader-key ","
   ;; Major mode leader key accessible in `emacs state' and `insert state'.
   ;; (default "C-M-m)
   dotspacemacs-major-mode-emacs-leader-key "C-M-m"
   ;; These variables control whether separate commands are bound in the GUI to
   ;; the key pairs C-i, TAB and C-m, RET.
   ;; Setting it to a non-nil value, allows for separate commands under <C-i>
   ;; and TAB or <C-m> and RET.
   ;; In the terminal, these pairs are generally indistinguishable, so this only
   ;; works in the GUI. (default nil)
   dotspacemacs-distinguish-gui-tab nil
   ;; (Not implemented) dotspacemacs-distinguish-gui-ret nil
   ;; The command key used for Evil commands (ex-commands) and
   ;; Emacs commands (M-x).
   ;; By default the command key is `:' so ex-commands are executed like in Vim
   ;; with `:' and Emacs commands are executed with `<leader> :'.
   dotspacemacs-command-key ":"
   ;; If non nil `Y' is remapped to `y$'. (default t)
   dotspacemacs-remap-Y-to-y$ t
   ;; Name of the default layout (default "Default")
   dotspacemacs-default-layout-name "Default"
   ;; If non nil the default layout name is displayed in the mode-line.
   ;; (default nil)
   dotspacemacs-display-default-layout nil
   ;; If non nil then the last auto saved layouts are resume automatically upon
   ;; start. (default nil)
   dotspacemacs-auto-resume-layouts nil
   ;; Location where to auto-save files. Possible values are `original' to
   ;; auto-save the file in-place, `cache' to auto-save the file to another
   ;; file stored in the cache directory and `nil' to disable auto-saving.
   ;; (default 'cache)
   dotspacemacs-auto-save-file-location 'cache
   ;; Maximum number of rollback slots to keep in the cache. (default 5)
   dotspacemacs-max-rollback-slots 5
   ;; If non nil then `ido' replaces `helm' for some commands. For now only
   ;; `find-files' (SPC f f), `find-spacemacs-file' (SPC f e s), and
   ;; `find-contrib-file' (SPC f e c) are replaced. (default nil)
   dotspacemacs-use-ido nil
   ;; If non nil, `helm' will try to minimize the space it uses. (default nil)
   dotspacemacs-helm-resize nil
   ;; if non nil, the helm header is hidden when there is only one source.
   ;; (default nil)
   dotspacemacs-helm-no-header nil
   ;; define the position to display `helm', options are `bottom', `top',
   ;; `left', or `right'. (default 'bottom)
   dotspacemacs-helm-position 'bottom
   ;; If non nil the paste micro-state is enabled. When enabled pressing `p`
   ;; several times cycle between the kill ring content. (default nil)
   dotspacemacs-enable-paste-micro-state nil
   ;; Which-key delay in seconds. The which-key buffer is the popup listing
   ;; the commands bound to the current keystroke sequence. (default 0.4)
   dotspacemacs-which-key-delay 0.4
   ;; Which-key frame position. Possible values are `right', `bottom' and
   ;; `right-then-bottom'. right-then-bottom tries to display the frame to the
   ;; right; if there is insufficient space it displays it at the bottom.
   ;; (default 'bottom)
   dotspacemacs-which-key-position 'bottom
   ;; If non nil a progress bar is displayed when spacemacs is loading. This
   ;; may increase the boot time on some systems and emacs builds, set it to
   ;; nil to boost the loading time. (default t)
   dotspacemacs-loading-progress-bar t
   ;; If non nil the frame is fullscreen when Emacs starts up. (default nil)
   ;; (Emacs 24.4+ only)
   dotspacemacs-fullscreen-at-startup nil
   ;; If non nil `spacemacs/toggle-fullscreen' will not use native fullscreen.
   ;; Use to disable fullscreen animations in OSX. (default nil)
   dotspacemacs-fullscreen-use-non-native nil
   ;; If non nil the frame is maximized when Emacs starts up.
   ;; Takes effect only if `dotspacemacs-fullscreen-at-startup' is nil.
   ;; (default nil) (Emacs 24.4+ only)
   dotspacemacs-maximized-at-startup nil
   ;; A value from the range (0..100), in increasing opacity, which describes
   ;; the transparency level of a frame when it's active or selected.
   ;; Transparency can be toggled through `toggle-transparency'. (default 90)
   dotspacemacs-active-transparency 90
   ;; A value from the range (0..100), in increasing opacity, which describes
   ;; the transparency level of a frame when it's inactive or deselected.
   ;; Transparency can be toggled through `toggle-transparency'. (default 90)
   dotspacemacs-inactive-transparency 90
   ;; If non nil unicode symbols are displayed in the mode line. (default t)
   dotspacemacs-mode-line-unicode-symbols t
   ;; If non nil smooth scrolling (native-scrolling) is enabled. Smooth
   ;; scrolling overrides the default behavior of Emacs which recenters the
   ;; point when it reaches the top or bottom of the screen. (default t)
   dotspacemacs-smooth-scrolling t
   ;; If non nil line numbers are turned on in all `prog-mode' and `text-mode'
   ;; derivatives. If set to `relative', also turns on relative line numbers.
   ;; (default nil)
   dotspacemacs-line-numbers nil
   ;; If non-nil smartparens-strict-mode will be enabled in programming modes.
   ;; (default nil)
   dotspacemacs-smartparens-strict-mode nil
   ;; Select a scope to highlight delimiters. Possible values are `any',
   ;; `current', `all' or `nil'. Default is `all' (highlight any scope and
   ;; emphasis the current one). (default 'all)
   dotspacemacs-highlight-delimiters 'all
   ;; If non nil advises quit functions to keep server open when quitting.
   ;; (default nil)
   dotspacemacs-persistent-server nil
   ;; List of search tool executable names. Spacemacs uses the first installed
   ;; tool of the list. Supported tools are `ag', `pt', `ack' and `grep'.
   ;; (default '("ag" "pt" "ack" "grep"))
   dotspacemacs-search-tools '("ag" "pt" "ack" "grep")
   ;; The default package repository used if no explicit repository has been
   ;; specified with an installed package.
   ;; Not used for now. (default nil)
   dotspacemacs-default-package-repository nil
   ;; Delete whitespace while saving buffer. Possible values are `all'
   ;; to aggressively delete empty line and long sequences of whitespace,
   ;; `trailing' to delete only the whitespace at end of lines, `changed'to
   ;; delete only whitespace for changed lines or `nil' to disable cleanup.
   ;; (default nil)
   dotspacemacs-whitespace-cleanup nil
   ))

(defun dotspacemacs/user-init ()
  "Initialization function for user code.
It is called immediately after `dotspacemacs/init'.  You are free to put almost
any user code here.  The exception is org related code, which should be placed
in `dotspacemacs/user-config'."
  )

(defun dotspacemacs/user-config ()
  "Configuration function for user code.
This function is called at the very end of Spacemacs initialization after
layers configuration. You are free to put any user code."
(global-hl-line-mode -1) ; Disable current line highlight
;;(load-theme 'tango)
(global-writeroom-mode 1)
;;(setq engine/browser-function 'eww-browse-url)

(setq user-full-name "Shane D'Mello")
(setq deft-directory "~/Dropbox/deftnotes")

;; Send email via Gmail: using gnus
(setq message-send-mail-function 'smtpmail-send-it
      smtpmail-default-smtp-server "smtp.gmail.com")


(setq smart-compile-alist '(("\\.tex$"  . "latexmk %f")))
;;(add-to-list 'smart-compile-alist '("\\.tex$" . "latexmk %f"))

(add-hook 'doc-view-mode-hook 'auto-revert-mode)
;;setting SPC m h t to use ghc-mod
(spacemacs/set-leader-keys-for-major-mode 'haskell-mode
  "mht"  'ghc-show-type)

(setq rcirc-server-alist
      '(("irc.freenode.net" :port 6697 :encryption tls
         :channels ("#haskell"))))

(display-time-mode 1)


(set-default-font "Inconsolata 11")
(fringe-mode 0)


(defun my-evil-mode-config () 
  (visual-line-mode t)
  )

(global-hl-line-mode -1) ;; remove current line highlighting

(with-eval-after-load 'org ;; It is recommended that all org related code be in the body of this function.


  ;; This entire block is for automatically marking a TODO heading as done if the checklist is done
  ;; see http://thread.gmane.org/gmane.emacs.orgmode/42715
  (eval-after-load 'org-list
    '(add-hook 'org-checkbox-statistics-hook (function ndk/checkbox-list-complete)))
  ;; automatic TODO block continues...
  (defun ndk/checkbox-list-complete ()
    (save-excursion
      (org-back-to-heading t)
      (let ((beg (point)) end)
        (end-of-line)
        (setq end (point))
        (goto-char beg)
        (if (re-search-forward "\\[\\([0-9]*%\\)\\]\\|\\[\\([0-9]*\\)/\\([0-9]*\\)\\]" end t)
            (if (match-end 1)
                (if (equal (match-string 1) "100%")
                    ;; all done - do the state change
                    (org-todo 'done)
                  (org-todo 'todo))
              (if (and (> (match-end 2) (match-beginning 2))
                       (equal (match-string 2) (match-string 3)))
                  (org-todo 'done)
                (org-todo 'todo)))))))


;; This entire block is for automatically marking a TODO item as done if all the sub-headings are DONE
  (defun org-summary-todo (n-done n-not-done)
    "Switch entry to DONE when all subentries are done, to TODO otherwise."
    (let (org-log-done org-log-states)   ; turn off logging
      (org-todo (if (= n-not-done 0) "DONE" "TODO"))))
  ;; automatic TODO block continues...
  (add-hook 'org-after-todo-statistics-hook 'org-summary-todo)


  ;; minted code block
  (setq org-src-preserve-indentation t)
  (setq org-latex-listings 'minted)
  (setq org-latex-minted-options '(("fontsize" "\\small")("obeytabs" "true")))
  (add-to-list 'org-latex-packages-alist '("" "minted" nil))
  ;;(add-to-list 'org-latex-packages-alist '("" "zhfontcfg" nil))
  ;;(add-to-list 'org-latex-packages-alist '("" "mathpazo" t))
  (setq org-latex-pdf-process '("xelatex -shell-escape -interaction nonstopmode -output-directory %o %f"
                                "xelatex -shell-escape -interaction nonstopmode -output-directory %o %f"))


  (setq org-src-fontify-natively t)



;; active Babel languages

(org-babel-do-load-languages
 'org-babel-load-languages
 '((haskell . t)
   (emacs-lisp . t)
   (latex . t)
   (python . t)
   (sh . t)
   ))


;;(setq org-latex-create-formula-image-program 'dvipng)
;;(setq org-latex-create-formula-image-program 'imagemagick)
(setq org-image-actual-width '(400))

;;(custom-set-variables
 ;;'(org-modules (quote (org-habit))))

(defun my-org-mode-config () 
    (local-set-key (kbd "M-l") 'org-metaright)
    (local-set-key (kbd "M-h") 'org-metaleft)
    (local-set-key (kbd "M-j") 'org-metadown)
    (local-set-key (kbd "M-k") 'org-metaup)
    (evil-global-set-key 'normal (kbd "C-l") 'org-shiftright)
    (evil-global-set-key 'normal (kbd "C-h") 'org-shiftleft)
    (evil-global-set-key 'normal "=" 'org-ctrl-c-ctrl-c)
    (evil-global-set-key 'normal ",l" 'org-shiftright)
    (evil-global-set-key 'normal ",h" 'org-shiftleft)
    (evil-global-set-key 'normal ",j" 'org-shiftdown)
    (evil-global-set-key 'normal ",k" 'org-shiftup)
    (evil-global-set-key 'normal ",d" 'org-insert-drawer)
    (evil-global-set-key 'normal ",f" 'org-footnote-action)
    (evil-global-set-key 'normal ",u" 'universal-argument)
    (evil-global-set-key 'normal "zR" 'show-all)
    (evil-global-set-key 'normal "zM" 'my-org-fold-all)
    (setq org-log-done 'time)
    (setq org-log-repeat 'time)
    (setq-default word-wrap t)
)



(defun my-org-fold-all ()
  (interactive)
  (org-set-startup-visibility)
  )
;;(evil-global-set-key 'normal ",c" 'org-capture)
(evil-global-set-key 'normal ",a" 'org-agenda)
(global-set-key (kbd "C-c a") 'org-agenda)
(add-hook 'org-mode-hook 'my-org-mode-config)
(add-hook 'evil-mode-hook 'my-evil-mode-config)

(setq org-bullets-bullet-list '("◉" "○" "■" "◆"))
  (global-visual-line-mode t)


  (setq haskell-font-lock-symbols t)

  (setq org-blank-before-new-entry '((heading . auto) (plain-list-item . auto)))
  (setq org-default-notes-file "~/Dropbox/diary.org")
  (setq-default org-startup-indented t) 
  ;;(setq-default org-odd-levels-only t) 
(setq org-tag-alist '(("work" . ?w) ("house" . ?h) ("ARCHIVE" . ?a)))
  ;;(define-key global-map "\C-cc" 'org-capture)

  (setq org-capture-templates
        '(
          ("t" "Todo" entry (file+headline "~/Dropbox/org/diary.org" "Tasks")
           "* TODO %?\n  %i\n")
          ("b" "Phone business" table-line (file+headline "~/Dropbox/org/diary.org" "Business")
           "|%^{Name?}|%^{Phone?}|%^{Type?}")
          ("p" "Phone personal" table-line (file+headline "~/Dropbox/org/diary.org" "Personal")
           "|%^{Name?}|%^{Phone?}|%^{Email?}")
          ("s" "Shopping" item (file+headline "~/Dropbox/org/diary.org" "Shopping list")
           "- [ ] %^{Item?}")
          ("d" "Download list" item (file+headline "~/Dropbox/org/diary.org" "Download list")
           "- [ ] %^{Item?}")
          ("j" "Journal" entry (file+datetree "~/Dropbox/org/journal.org")
           "\n* %? %U\n  %i\n" :empty-lines 1)
          ("m" "Medical Journal" entry (file+datetree "~/Dropbox/org/medical.org")
           "\n* %U %? %^g\n  %i\n" :empty-lines 1)
          ("c" "Clips" entry (file+datetree "~/Dropbox/org/clips.org")
           "\n* %U\n  %x\n" :immediate-finish t)
          ))
)
  )
;; Do not write anything past this comment. This is where Emacs will
;; auto-generate custom variable definitions.
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(org-agenda-files
   (quote
    ("~/Dropbox/Application/applications.org" "~/Dropbox/knotstudy.org" "~/Dropbox/org/conferences.org" "~/Dropbox/org/holidays.org" "~/Dropbox/org/diary.org" "~/Dropbox/Algebraic Knots/gluing.org")))
 '(org-modules
   (quote
    (org-bibtex org-habit org-irc org-mouse org-bookmark org-bullets org-checklist org-choose))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(company-tooltip-common ((t (:inherit company-tooltip :weight bold :underline nil))))
 '(company-tooltip-common-selection ((t (:inherit company-tooltip-selection :weight bold :underline nil)))))
