Snipe is f/F/t/T on steroids. It emulates vim-sneak and vim-seek for
evil-mode by default, bound to s/S in normal mode and z/Z/x/X in visual or
operator mode. With its N-character searching, it can also be adapted to
replace evil-mode's f/F/t/T funcitonality. See the readme for more
information.

To enable globally, add the following lines to ~/.emacs:

    (require 'evil-snipe)
    (global-evil-snipe-mode 1)

To replace evil-mode's f/F/t/T functionality with (1-character) snipe, use:

    (evil-snipe-replace-evil)
