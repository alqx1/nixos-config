{ ... }:

{
  programs.zsh = {
    enable = true;
    enableCompletion = true;
    autosuggestion.enable = true;
    syntaxHighlighting.enable = true;

    history = {
      size = 10000;
      ignoreAllDups = true;
      path = "$HOME/.cache/zsh/.zsh_history";
    };

    shellAliases = {
      update = "sudo nixos-rebuild switch";
    };

    oh-my-zsh = {
      enable = true;
      theme = "awesomepanda";
    };

    initContent = ''
      mkdir -p "$HOME/.cache/zsh"
    '';

    completionInit = ''
      autoload -Uz compinit
      compinit -d "$HOME/.cache/zsh/.zcompdump"
      zstyle ':completion:*' matcher-list 'm:{a-z}={A-Za-z}'
    '';

    sessionVariables = {
      MANPAGER = "nvim +Man!";
    };
  };
}
