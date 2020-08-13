# remap prefix from 'C-b' to 'C-a'
unbind C-b
set-option -g prefix C-a
bind-key C-a send-prefix

# split panes using \ and -
bind \ split-window -h
bind - split-window -v
unbind '"'
unbind %

# switch panes using Alt-arrow without prefix (M is "Meta")
bind -n M-Left select-pane -L
bind -n M-Right select-pane -R
bind -n M-Up select-pane -U
bind -n M-Down select-pane -D

# switch windows using Ctrl-arrow without prefix
bind -n C-Left  previous-window
bind -n C-Right next-window

# switch sessions using Shift-arrow without prefix
bind -n S-Left switch-client -p
bind -n S-Right switch-client -n

# set inactive window styles: fg is light grey, bg is black
set -g window-style 'fg=colour246,bg=colour16'

# set active window styles: fg is white, bg is dark grey
set -g window-active-style 'fg=colour231,bg=colour233'

# set border styles to white
set -g pane-border-fg colour231
set -g pane-active-border-fg colour231

# reload config file (change file location to the tmux.conf you want to use)
bind r source-file $DOTFILES_DIR/tmux/config.tmux

# status bar
set -g status-fg white
set -g status-bg black
set -g status-interval 10
set -g status-left-length 30
set -g status-left '[session=#S] '
set -g status-right '#[fg=yellow]#(cut -d " " -f 1-4 /proc/loadavg)#[default] #[fg=white]%H:%M#[default]'

set -g window-status-current-bg white
set -g window-status-current-fg black
set -g window-status-current-attr bold

# 0 is too far from 1, 2, 3, ...
set -g base-index 1
