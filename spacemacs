;; -*- mode: emacs-lisp -*-

;(let ((auto-saves-dir "~/.spacemacs.d/tmp/auto-saves")
;      ())
;  (if (not (file-exists-p auto-saves-dir t))
;      (progn
;        (make-directory auto-saves-dir t)
;        (make-directory "~/.spacemacs.d/tmp/bkp")
;        (make-directory "~/.spacemacs.d/tmp/lock-files")
;        )
;    ))

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
   ;; Lazy installation of layers (i.e. layers are installed only when a file
   ;; with a supported type is opened). Possible values are `all', `unused'
   ;; and `nil'. `unused' will lazy install only unused layers (i.e. layers
   ;; not listed in variable `dotspacemacs-configuration-layers'), `all' will
   ;; lazy lnstall any layer that support lazy installation even the layers
   ;; listed in `dotspacemacs-configuration-layers'. `nil' disable the lazy
   ;; installation feature and you have to explicitly list a layer in the
   ;; variable `dotspacemacs-configuration-layers' to install it.
   ;; (default 'unused)
   dotspacemacs-enable-lazy-installation 'unused
   ;; If non-nil then Spacemacs will ask for confirmation before installing
   ;; a layer lazily. (default t)
   dotspacemacs-ask-for-lazy-installation t
   ;; If non-nil layers with lazy install support are lazy installed.
   ;; List of additional paths where to look for configuration layers.
   ;;  s aths must have a trailing slash (i.e. `~/.mycontribs/')
   dotspacemacs-configuration-layer-path '()
   ;; List of configuration layers to load.
   dotspacemacs-configuration-layers
   '(
     ;; ----------------------------------------------------------------
     ;; Example of useful layers you may want to use right away.
     ;; Uncomment some layer names and press <SPC f e R> (Vim style) or
     ;; <M-m f e R> (Emacs style) to install them.
     ;; ----------------------------------------------------------------
     (xclipboard :variables xclipboard-enable-cliphist t)
     ansible
     vimscript
     html
     (auto-completion :variables
                      auto-completion-return-key-behavior nil
                      auto-completion-tab-key-behavior nil)
     better-defaults
     (clojure :variables
              clojure-enable-fancify-symbols nil
              clojure-backend 'lsp
              clojure-enable-linters '(clj-kondo joker)
              ; This might clash with cider
              clojure-enable-sayid nil
              clojure-enable-clj-refactor nil
              )
     ;; confluence
     ;; docker
     emacs-lisp
     epub
     ;; eos
     evil-commentary
     eww
     finance
     git
     go
     speed-reading
     ;; kubernetes
     helm
     html
     javascript
     (languagetool :variables
                   langtool-default-language "en-US"
                   languagetool-show-error-on-jump t
                   langtool-http-server-host "127.0.0.1"
                   langtool-http-server-port 8371
                   )
     lsp
     lua
     markdown
     (org :variables
          org-journal-date-format "%A, %B %d %Y"
          org-journal-time-format "%I:%M%p▷ "
          org-journal-file-type "='year="
          org-enable-org-journal-support t
          org-journal-dir "/***/journal"
          org-journal-file-format "mrsipper-%Y"
          org-startup-indented nil
          org-startup-truncated t
          org-adapt-indentation nil
          org-enable-reveal-js-support t
          org-enable-roam-support t
          org-enable-epub-support t
          org-enable-verb-support t
          ;; org-enable-valign t
          )
     pandoc
     puppet
     (python :variables
             python-backend 'lsp
             python-lsp-server 'pyright
             python-test-runner 'pytest
             python-format-on-save t
             python-save-before-test t
             python-sort-imports-on-save t
             python-formatter 'yapf)

     (ranger :variables
             ranger-show-preview t
             ranger-ignored-extensions '("mkv" "iso" "mp4")
             ranger-max-preview-size 7)
     ;; read-aloud
     restclient
     restructuredtext
     ruby
     rust
     scheme
     sphinx
     search-engine
     shell-scripts
     spacemacs-evil
     spacemacs-language
     spacemacs-org
     (spell-checking :variables
                     spell-checking-enable-by-default nil)
     (sql :variables
          sql-capitalize-keywords t
          sql-capitalize-keywords-disable-interactive t
          sql-auto-indent t)
     syntax-checking
     systemd
     (terraform :variables
                terraform-auto-format-on-save t
                terraform-backend 'lsp)
     theming
     typescript
     yaml
     (shell :variables
            shell-default-shell 'vterm
            shell-default-term-shell "~/opt/pylocal/bin/xonsh"
            ;; shell-default-term-shell "/usr/bin/bash"
            shell-enable-smart-eshell t
            shell-default-height 30
            close-window-with-terminal t
            spacemacs-vterm-history-file-location "~/.bash_history"
            shell-default-position 'bottom)
     version-control)

   ;; List of additional packages that will be installed without being
   ;; wrapped in a layer. If you need some configuration for these
   ;; packages, then consider creating a layer. You can also put the
   ;; configuration in `dotspacemacs/user-config'.
   dotspacemacs-additional-packages '(xonsh-mode gptel)
   ;; A list of packages that cannot be updated.
   dotspacemacs-frozen-packages '()
   ;; A list of packages that will not be installed and loaded.
   ;; dotspacemacs-excluded-packages '(exec-path-from-shell)
   ;; Defines the behaviour of Spacemacs when installing packages.
   ;; Possible values are `used-only', `used-but-keep-unused' and `all'.
   ;; `used-only' installs only explicitly used packages and uninstall any
   ;; unused packages as well as their unused dependencies.
   ;; `used-but-keep-unused' installs only the used packages but won't uninstall
   ;; them if they become unused. `all' installs *all* packages supported by
   ;; Spacemacs and never uninstall them. (default is `used-only')
   dotspacemacs-install-packages 'used-only))

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
   dotspacemacs-elpa-timeout 9
   ;; If non nil then spacemacs will check for updates at startup
   ;; when the current branch is not `develop'. Note that checking for
   ;; new versions works via git commands, thus it calls GitHub services
   ;; whenever you start Emacs. (default nil)
   dotspacemacs-check-for-update nil
   ;; If non-nil, a form that evaluates to a package directory. For example, to
   ;; use different package directories for different Emacs versions, set this
   ;; to `emacs-version'.
   dotspacemacs-elpa-subdirectory nil
   ;; One of `vim', `emacs' or `hybrid'.
   ;; `hybrid' is like `vim' except that `insert state' is replaced by the
   ;; `hybrid state' with `emacs' key bindings. The value can also be a list
   ;; with `:variables' keyword (similar to layers). Check the editing styles
   ;; section of the documentation for details on available variables.
   ;; (default 'vim)
   dotspacemacs-editing-style 'vim
   ;; If non nil output loading progress in `*Messages*' buffer. (default nil)
   dotspacemacs-verbose-loading nil
   ;; Specify the startup banner. Default value is `official', it displays
   ;; the official spacemacs logo. An integer value is the index of text
   ;; banner, `random' chooses a random text banner in `core/banners'
   ;; directory. A string value must be a path to an image format supported
   ;; by your Emacs build.
   ;; If the value is nil then no banner is displayed. (default 'official)
   dotspacemacs-startup-banner 'random
   ;; List of items to show in startup buffer or an association list of
   ;; the form `(list-type . list-size)`. If nil then it is disabled.
   ;; Possible values for list-type are:
   ;; `recents' `bookmarks' `projects' `agenda' `todos'."
   ;; List sizes may be nil, in which case
   ;; `spacemacs-buffer-startup-lists-length' takes effect.
   dotspacemacs-startup-lists '((recents . 5)
                                (projects . 7))
   ;; True if the home buffer should respond to resize events.
   dotspacemacs-startup-buffer-responsive t
   ;; Default major mode of the scratch buffer (default `text-mode')
   dotspacemacs-scratch-mode 'org-mode
   ;; List of themes, the first of the list is loaded when spacemacs starts.
   ;; Press <SPC> T n to cycle to the next theme in the list (works great
   ;; with 2 themes variants, one dark and one light)

   ;; dotspacemacs-themes (if (display-graphic-p)
   ;;                         '(spacemacs-light spacemacs-dark)
   ;;                       '(spacemacs-dark spacemacs-light))

   dotspacemacs-themes '(spacemacs-light spacemacs-dark)
   ;; If non nil the cursor color matches the state color in GUI Emacs.
   dotspacemacs-colorize-cursor-according-to-state t
   ;; Default font, or prioritized list of fonts. `powerline-scale' allows to
   ;; quickly tweak the mode-line size to make separators look not too crappy.
   dotspacemacs-default-font '(
                               ;; "Source Code Pro"
                               ;; "Source Code Pro For Powerline"
                               "JuliaMono"
                               :size 22
                               :weight normal
                               :width normal
                               :powerline-scale 1.0)
   ;; The leader key
   dotspacemacs-leader-key "SPC"
   ;; The key used for Emacs commands (M-x) (after pressing on the leader key).
   ;; (default "SPC")
   dotspacemacs-emacs-command-key "SPC"
   ;; The key used for Vim Ex commands (default ":")
   dotspacemacs-ex-command-key ":"
   ;; The leader key accessible in `emacs state' and `insert state'
   ;; (default "M-m")
   dotspacemacs-emacs-leader-key "M-m"
   ;; Major mode leader key is a shortcut key which is the equivalent of
   ;; pressing `<leader> m`. Set it to `nil` to disable it. (default ",")
   dotspacemacs-major-mode-leader-key ","
   ;; Major mode leader key accessible in `emacs state' and `insert state'.
   ;; (default "C-M-m")
   dotspacemacs-major-mode-emacs-leader-key "C-M-m"
   ;; These variables control whether separate commands are bound in the GUI to
   ;; the key pairs C-i, TAB and C-m, RET.
   ;; Setting it to a non-nil value, allows for separate commands under <C-i>
   ;; and TAB or <C-m> and RET.
   ;; In the terminal, these pairs are generally indistinguishable, so this only
   ;; works in the GUI. (default nil)
   dotspacemacs-distinguish-gui-tab nil
   ;; If non nil `Y' is remapped to `y$' in Evil states. (default nil)
   dotspacemacs-remap-Y-to-y$ nil
   ;; If non-nil, the shift mappings `<' and `>' retain visual state if used
   ;; there. (default t)
   dotspacemacs-retain-visual-state-on-shift t
   ;; If non-nil, J and K move lines up and down when in visual mode.
   ;; (default nil)
   dotspacemacs-visual-line-move-text nil
   ;; If non nil, inverse the meaning of `g' in `:substitute' Evil ex-command.
   ;; (default nil)
   dotspacemacs-ex-substitute-global nil
   ;; Name of the default layout (default "Default")
   dotspacemacs-default-layout-name "Default"
   ;; If non nil the default layout name is displayed in the mode-line.
   ;; (default nil)
   dotspacemacs-display-default-layout nil
   ;; If non nil then the last auto saved layouts are resume automatically upon
   ;; start. (default nil)
   dotspacemacs-auto-resume-layouts nil
   ;; Size (in MB) above which spacemacs will prompt to open the large file
   ;; literally to avoid performance issues. Opening a file literally means that
   ;; no major mode or minor modes are active. (default is 1)
   dotspacemacs-large-file-size 1
   ;; Location where to auto-save files. Possible values are `original' to
   ;; auto-save the file in-place, `cache' to auto-save the file to another
   ;; file stored in the cache directory and `nil' to disable auto-saving.
   ;; (default 'cache)
   dotspacemacs-auto-save-file-location 'cache
   ;; Maximum number of rollback slots to keep in the cache. (default 5)
   dotspacemacs-max-rollback-slots 5
   ;; If non nil, `helm' will try to minimize the space it uses. (default nil)
   dotspacemacs-helm-resize nil
   ;; if non nil, the helm header is hidden when there is only one source.
   ;; (default nil)
   dotspacemacs-helm-no-header nil
   ;; define the position to display `helm', options are `bottom', `top',
   ;; `left', or `right'. (default 'bottom)
   dotspacemacs-helm-position 'bottom
   ;; Controls fuzzy matching in helm. If set to `always', force fuzzy matching
   ;; in all non-asynchronous sources. If set to `source', preserve individual
   ;; source settings. Else, disable fuzzy matching in all sources.
   ;; (default 'always)
   dotspacemacs-helm-use-fuzzy 'always
   ;; If non nil the paste micro-state is enabled. When enabled pressing `p`
   ;; several times cycle between the kill ring content. (default nil)
   dotspacemacs-enable-paste-transient-state nil
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
   ;; If non nil show the titles of transient states. (default t)
   dotspacemacs-show-transient-state-title t
   ;; If non nil show the color guide hint for transient state keys. (default t)
   dotspacemacs-show-transient-state-color-guide t
   ;; If non nil unicode symbols are displayed in the mode line. (default t)
   dotspacemacs-mode-line-unicode-symbols t
   ;; If non nil smooth scrolling (native-scrolling) is enabled. Smooth
   ;; scrolling overrides the default behavior of Emacs which recenters point
   ;; when it reaches the top or bottom of the screen. (default t)
   dotspacemacs-smooth-scrolling t
   ;; Control line numbers activation.
   ;; If set to `t' or `relative' line numbers are turned on in all `prog-mode' and
   ;; `text-mode' derivatives. If set to `relative', line numbers are relative.
   ;; This variable can also be set to a property list for finer control:
   ;; '(:relative nil
   ;;   :disabled-for-modes dired-mode
   ;;                       doc-view-mode
   ;;                       markdown-mode
   ;;                       org-mode
   ;;                       pdf-view-mode
   ;;                       text-mode
   ;;   :size-limit-kb 1000)
   ;; (default nil)
   dotspacemacs-line-numbers nil
   ;; dotspacemacs-line-numbers '(:visual t
   ;;                             :disabled-for-modes dired-mode
   ;;                                                 doc-view-mode
   ;;                                                 markdown-mode
   ;;                                                 org-mode
   ;;                                                 pdf-view-mode
   ;;                                                 rst-mode
   ;;                                                 text-mode
   ;;                             :size-limit-kb 1024)

   ;; Code folding method. Possible values are `evil' and `origami'.
   ;; (default 'evil)
   dotspacemacs-folding-method 'evil
   ;; If non-nil smartparens-strict-mode will be enabled in programming modes.
   ;; (default nil)
   dotspacemacs-smartparens-strict-mode nil
   ;; If non-nil pressing the closing parenthesis `)' key in insert mode passes
   ;; over any automatically added closing parenthesis, bracket, quote, etc…
   ;; This can be temporary disabled by pressing `C-q' before `)'. (default nil)
   dotspacemacs-smart-closing-parenthesis nil
   ;; Select a scope to highlight delimiters. Possible values are `any',
   ;; `current', `all' or `nil'. Default is `all' (highlight any scope and
   ;; emphasis the current one). (default 'all)
   dotspacemacs-highlight-delimiters 'all

   ;; dotspacemacs-enable-server nil
   dotspacemacs-enable-server t
   ;; If non nil, advise quit functions to keep server open when quitting.
   ;; (default nil)
   dotspacemacs-persistent-server t
   dotspacemacs-server-socket-dir "~/.emacs.d/server"

   ;; List of search tool executable names. Spacemacs uses the first installed
   ;; tool of the list. Supported tools are `ag', `pt', `ack' and `grep'.
   ;; (default '("ag" "pt" "ack" "grep"))
   dotspacemacs-search-tools '("rg" "ag" "pt" "ack" "grep")
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
   dotspacemacs-scratch-buffer-persistent t
   dotspacemacs-scratch-buffer-unkillable t
   ))

(defun dotspacemacs/user-init ()
  "Initialization function for user code.
It is called immediately after `dotspacemacs/init', before layer configuration
executes.
 This function is mostly useful for variables that need to be set
before packages are loaded. If you are unsure, you should try in setting them in
`dotspacemacs/user-config' first."

  ;; (add-to-list 'tramp-remote-path "/usr/local/opt/coreutils/libexec/gnubin")
  ;; (setq tramp-remote-path '(tramp-default-remote-path "/usr/local/opt/coreutils/libexec/gnubin"))

  (setq theming-modifications
        '((spacemacs-dark
           (default :background "#303030")
           (default :foreground "#e3e0d7")
           (font-lock-builtin-face :foreground "#86E5FF")
           (font-lock-constant-face :foreground "#D09CFA")
           (font-lock-string-face :foreground "#82d9be")
           (font-lock-variable-name-face :foreground "#5BC0F8")
           (terraform--resource-name-face :foreground "#FF577F"))
          (spacemacs-light
           (terraform--resource-name-face :foreground "#c41e3a")
           ;; (default :foreground "#540b0e")
           ;; (default :foreground "#343a40")
           ;; (default :foreground "#212529")
           (default :foreground "#321f28")
           ;; (default :foreground "#495057")
           (evil-ex-lazy-highlight :foreground "#293241" :background "#ff85a1")
           (evil-ex-search :foreground "#293241" :background "#ff5c8a")
           ;; (font-lock-comment-face :foreground "#127475" :background nil)
           (font-lock-comment-face :foreground "#127475")
           (font-lock-variable-name-face :foreground "#3c096c")
           (font-lock-doc-face :foreground "#a85311")
           (font-lock-string-face :foreground "#941474")
           (font-lock-builtin-face :foreground "#1279d4")
           ;; (font-lock-builtin-face :foreground "#346bb3")
           (font-lock-constant-face :foreground "#755fac")
           (info-double-quoted-name :foreground "#ff6d00")
           (rst-level-1 :background "#c4b7cb")
           (rst-level-2 :background "#bbc7ce")
           (rst-level-3 :background "#fae1dd")
           ;; (org-code :foreground "#3fa7d6")
           ;; (org-code :foreground "#304c89")
           ;; (org-code :foreground "#902923")
           (org-code :foreground "#a22c29")
           (org-level-3 :foreground "#4f7a25")
           (term-default-fg-color :foreground "#3f3f3f"))))

  (setq-default git-magit-status-fullscreen t)

  (add-hook 'org-mode-hook (lambda nil
                             (auto-fill-mode 1)
                             (set-fill-column 78)))

  (add-hook 'vterm-mode-hook
            (lambda ()
              (setq vterm-disable-bold t)
              (setq vterm-disable-inverse-video t)
              (setq vterm-disable-underline t)))
  (cond
   ((eq window-system 'nil)
    (tool-bar-mode 0) (menu-bar-mode 0))
   (t (tool-bar-mode 0) (menu-bar-mode 0))))


(defun dotspacemacs/user-config ()
  "Configuration function for user code.
This function is called at the very end of Spacemacs initialization after
layers configuration.
This is the place where most of your configurations should be done. Unless it is
explicitly specified that a variable should be set before a package is loaded,
you should place your code here."

  (require 'gptel)
  (setq gptel-host "127.0.0.1:8787")
  (setq gptel-api-key "dummy")
  (setq gptel-use-curl t)
  (setq gptel-default-mode 'org-mode)
  ;; (setq gptel--debug nil)

  (custom-set-faces '(trailing-whitespace ((t (:background "#eceef7")))))

  (spacemacs/set-leader-keys "fw" 'save-buffer)
  (spacemacs/toggle-highlight-current-line-globally-off)
  ;; (spacemacs/set-leader-keys "/" 'evil-search-clear-highlight)
  ;; (define-key evil-normal-state-map (kbd "TAB") 'evil-scroll-down)
  (define-key evil-normal-state-map (kbd "RET") 'evil-scroll-down)
  (define-key evil-normal-state-map (kbd "DEL") 'evil-scroll-up)

  ;; suspend with c-z
  (define-key evil-motion-state-map (kbd "C-z") 'suspend-frame)
  (define-key evil-emacs-state-map (kbd "C-z") 'suspend-frame)
  (define-key evil-motion-state-map (kbd "C-x C-z") 'evil-emacs-state)
  (define-key evil-emacs-state-map (kbd "C-x C-z") 'evil-exit-emacs-state)

  (setq browse-url-browser-function 'eww-browse-url)
  (setq initial-major-mode 'org-mode)
  (setq x-select-enable-clipboard t)
  ;; (setq x-select-enable-primary t)
  (setq mouse-drag-copy-region t)

  (setq powerline-default-separator nil)
  (setq dotspacemacs-mode-line-theme '(spacemacs :separator nil))

  (setq password-cache-expiry 3600)
  (setq org-src-preserve-indentation t)
  (setq org-src-window-setup 'current-window)
  (setq org-src-tab-acts-natively t)
  (setq org-startup-truncated t)

  ;; Backups, auto-saves and lock-files
  (setq backup-directory-alist '((".*" . "~/.spacemacs.d/tmp/bkp/")))
  (setq auto-save-file-name-transforms '((".*" "~/.spacemacs.d/tmp/auto-saves/\\1" t)))
  (setq tramp-backup-directory-alist backup-directory-alist)
  (setq lock-file-name-transforms '((".*" "~/.spacemacs.d/tmp/lock-files/\\1" t)))

  ;; Refiling
  (setq org-refile-use-outline-path 'file)
  (setq org-refile-allow-creating-parent-nodes 'confirm)
  (setq org-refile-allow-creating-parent-nodes t)
  (setq org-outline-path-complete-in-steps nil)
  (setq org-reverse-note-order t)

  ;; org
  (setq org-agenda-files
        (directory-files-recursively
         "/***/org"
         "\\.org$"))

  (setq org-directory (expand-file-name "/***/org/"))
  (setq org-default-notes-file (concat org-directory "/main.org"))
  (setq org-refile-targets '((org-agenda-files :maxlevel . 2)))

  (setq org-export-allow-bind-keywords t)

  (setq python-shell-interpreter "/Users/mrsipan/opt/vpy311/bin/python3")


  (evil-define-key 'normal org-mode-map (kbd "RET") 'evil-scroll-down)
  ;(setq default-frame-alist '((font . "Source Code Pro")))

  (setq nov-text-width t)
  (setq visual-fill-column-center-text t)
  (add-hook 'nov-mode-hook 'visual-line-mode)
  (add-hook 'nov-mode-hook 'visual-fill-column-mode)
  (evil-define-key 'motion nov-mode-map (kbd "RET") 'nov-scroll-down)
  ;; (add-hook 'nov-mode-hook
  ;;           (lambda ()
  ;;             (face-remap-add-relative 'variable-pitch
  ;;                                      :family "Verdana"
  ;;                                      :height 1.5
  ;;                                      :size 30)))

  (with-eval-after-load 'company
    (define-key company-active-map (kbd "C-e") #'company-complete-selection))

  (with-eval-after-load 'spray
    (set-face-attribute 'spray-base-face nil :inherit 'variable-pitch))

  (with-eval-after-load 'org
    (defun mrsipper/send-to-salambria (&optional b e)
      (interactive "r")
      (shell-command-on-region
       b e "pandoc --from=org --to=rst  | sed 's/.. code::/.. colored-code::/g' | editblogger -i -b salambria &")
      (deactivate-mark))
    (defun mrsipper/to-html-then-clipboard (&optional b e)
      (interactive "r")
      ())
    (defun mrsiesta/to-md-then-clipboard ()
      (interactive)
      (setq-local current-point (point))
      (re-search-backward "^\* ")
      (org-mark-subtree)
      (shell-command-on-region
       (region-beginning)
       (region-end)
       "pandoc --from=org --to=markdown  | pbcopy"
       )
      (deactivate-mark)
      (goto-char current-point)
      )

    (defun mrsiesta/to-jira-then-clipboard ()
      (interactive)
      (setq-local current-point (point))
      (re-search-backward "^\* ")
      (org-mark-subtree)
      (shell-command-on-region
       (region-beginning)
       (region-end)
       "pandoc --from=org --to=jira  | pbcopy"
       )
      (deactivate-mark)
      (goto-char current-point)
      )

    (defun mrsiesta/whole-top-subtree-to-html ()
      (interactive)

      (setq-local current-point (point))
      (re-search-backward "^\* ")
      (org-mark-subtree)
      (let
          (
           (tmp-file (make-temp-file "tmp_" nil ".org"))
           )
        (write-region (region-beginning) (region-end) tmp-file)
        (shell-command (format "pandoc --toc --template uikit.html -f org -t html < %s > %s.html" tmp-file tmp-file))
        (shell-command (format "open %s.html" tmp-file))
        )
      (deactivate-mark)
      (goto-char current-point)
     )
    )

  (define-key evil-normal-state-map (kbd "gR")
    (lambda () (interactive) (evil-edit nil t) (message "File reloaded"))))

;; Do not write anything past this comment. This is where Emacs will
;; auto-generate custom variable definitions.
(defun dotspacemacs/emacs-custom-settings ()
  "Emacs custom settings.
This is an auto-generated function, do not modify its content directly, use
Emacs customize menu instead.
This function is called at the very end of Spacemacs initialization."
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(package-selected-packages
   '(gptel puppet-mode anaconda-mode ansible ansible-doc auto-complete auto-dictionary auto-yasnippet blacken browse-at-remote chruby cider-eval-sexp-fu clojure-snippets code-cells cython-mode dactyl-mode emmet-mode engine-mode esh-help eshell-prompt-extras eshell-z evil-commentary evil-ledger evil-org fish-mode flycheck-bashate flycheck-clj-kondo flycheck-joker flycheck-ledger flycheck-pos-tip pos-tip flyspell-correct-helm flyspell-correct fuzzy geiser gh-md git-gutter-fringe fringe-helper git-gutter git-link git-messenger git-modes git-timemachine gitignore-templates gnuplot go-eldoc go-fill-struct go-gen-test go-guru go-impl go-rename go-tag go-mode godoctor helm-c-yasnippet parseedn clojure-mode parseclj company helm-css-scss helm-git-grep helm-ls-git helm-org-rifle helm-pydoc impatient-mode importmagic epc ctable concurrent deferred insert-shebang jinja2-mode journalctl-mode js-doc js2-refactor multiple-cursors json-mode json-navigator hierarchy json-reformat json-snatcher langtool ledger-mode live-py-mode livid-mode lua-mode minitest mmm-mode multi-term multi-vterm mwim nodejs-repl nose nov esxml kv npm-mode ob-http ob-restclient org-cliplink org-contrib org-download org-journal org-mime org-pomodoro alert log4e gntp org-present org-projectile org-project-capture org-category-capture org-re-reveal htmlize org-rich-yank emacsql ox-epub ox-pandoc pandoc-mode persistent-scratch pip-requirements pipenv load-env-vars pippel poetry prettier-js pug-mode py-isort pydoc pyenv-mode pythonic pylookup pytest pyvenv rake ranger rbenv restclient-helm restclient inf-ruby ron-mode rspec-mode rubocop rubocopfmt ruby-hash-syntax ruby-refactor ruby-test-mode ruby-tools markdown-mode rust-mode rvm sass-mode haml-mode scss-mode seeing-is-believing shell-pop shfmt reformatter skewer-mode js2-mode simple-httpd slim-mode smeargle sphinx-doc spray sql-indent sqlup-mode systemd tagedit terminal-here terraform-mode hcl-mode texfrag auctex toml-mode magit-section git-commit with-editor transient typescript-mode unfill unkillable-scratch verb vimrc-mode vterm web-beautify web-mode xonsh-mode xterm-color yaml-mode yapfify yasnippet-snippets yasnippet ws-butler writeroom-mode winum which-key volatile-highlights vi-tilde-fringe uuidgen undo-tree treemacs-projectile treemacs-persp treemacs-icons-dired treemacs-evil toc-org term-cursor symon symbol-overlay string-inflection string-edit-at-point spacemacs-whitespace-cleanup spacemacs-purpose-popwin spaceline space-doc restart-emacs request rainbow-delimiters quickrun popwin pcre2el password-generator paradox overseer org-superstar open-junk-file nameless multi-line macrostep lorem-ipsum link-hint inspector info+ indent-guide hybrid-mode hungry-delete holy-mode hl-todo highlight-parentheses highlight-numbers highlight-indentation hide-comnt helm-xref helm-themes helm-swoop helm-purpose helm-projectile helm-org helm-mode-manager helm-make helm-descbinds helm-ag google-translate golden-ratio flycheck-package flycheck-elsa flx-ido fancy-battery eyebrowse expand-region evil-visualstar evil-visual-mark-mode evil-unimpaired evil-tutor evil-textobj-line evil-surround evil-numbers evil-nerd-commenter evil-mc evil-matchit evil-lisp-state evil-lion evil-indent-plus evil-iedit-state evil-goggles evil-exchange evil-evilified-state evil-escape evil-easymotion evil-collection evil-cleverparens evil-args evil-anzu eval-sexp-fu emr elisp-slime-nav elisp-def editorconfig dumb-jump drag-stuff dotenv-mode dired-quick-sort diminish devdocs define-word column-enforce-mode clean-aindent-mode centered-cursor-mode auto-highlight-symbol auto-compile all-the-icons aggressive-indent ace-link ace-jump-helm-line)))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(evil-ex-lazy-highlight ((t (:foreground "#293241" :background "#ff85a1"))))
 '(evil-ex-search ((t (:foreground "#293241" :background "#ff5c8a"))))
 '(font-lock-builtin-face ((t (:foreground "#1279d4"))))
 '(font-lock-comment-face ((t (:foreground "#127475" :background nil))))
 '(font-lock-constant-face ((t (:foreground "#755fac"))))
 '(font-lock-doc-face ((t (:foreground "#a85311"))))
 '(font-lock-string-face ((t (:foreground "#941474"))))
 '(font-lock-variable-name-face ((t (:foreground "#3c096c"))))
 '(info-double-quoted-name ((t (:foreground "#ff6d00"))))
 '(org-code ((t (:foreground "#a22c29"))))
 '(org-level-3 ((t (:foreground "#4f7a25"))))
 '(rst-level-1 ((t (:background "#c4b7cb"))))
 '(rst-level-2 ((t (:background "#bbc7ce"))))
 '(rst-level-3 ((t (:background "#fae1dd"))))
 '(term-default-fg-color ((t (:foreground "#3f3f3f"))))
 '(terraform--resource-name-face ((t (:foreground "#c41e3a"))) t)
 '(trailing-whitespace ((t (:background "#eceef7")))))
)
