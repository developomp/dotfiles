{ pkgs, ... }:

{
  users.users.pomp.shell = pkgs.zsh;
  programs.starship.enable = true;

  # https://mynixos.com/nixpkgs/options/programs.zsh
  programs.zsh = {
    enable = true;
    syntaxHighlighting.enable = true;
    shellAliases = {
      c = "clear";
      e = "eza --long --classify=always --color=always --icons=always --all --group-directories-first --binary --group --no-time --octal-permissions";
      y = "yazi";
    };
  };

  environment.systemPackages = with pkgs; [
    fzf
    eza
    tmux
    atuin
    yazi
  ];
}
