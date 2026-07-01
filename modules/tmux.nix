{ ... }:

{
  programs.tmux = {
    enable = true;
    extraConfig = ''
      unbind C-b
      set-option -g prefix C-a
      bind-key C-a send-prefix
      set -g mouse on

      # vim-like pane resizing
      bind-key -r C-k resize-pane -U
      bind-key -r C-j resize-pane -D
      bind-key -r C-h resize-pane -L
      bind-key -r C-l resize-pane -R

      # vim-like pane switching
      bind-key k select-pane -U
      bind-key j select-pane -D
      bind-key h select-pane -L
      bind-key l select-pane -R

      unbind-key Up
      unbind-key Down
      unbind-key Left
      unbind-key Right

      unbind-key C-Up
      unbind-key C-Down
      unbind-key C-Left
      unbind-key C-Right

      # make vertical (-v) and horizontal (-h) split
      bind-key C-v split-window -h
      bind-key C-x split-window -v

      unbind-key '%'
      unbind-key '"'
    '';
  };
}
