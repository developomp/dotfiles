{ ... }:

{
  imports = [
    ../../modules/home-manager/brave.nix
    ../../modules/home-manager/dconf-gnome-desktop.nix
    ../../modules/home-manager/dconf-gnome-extension-blur-my-shell.nix
    ../../modules/home-manager/dconf-gnome-extensions.nix
    ../../modules/home-manager/dconf-input.nix
    ../../modules/home-manager/dconf-nautilus.nix
    ../../modules/home-manager/git.nix
    ../../modules/home-manager/kitty.nix
    ../../modules/home-manager/xdg-user-dirs.nix
  ];

  nixpkgs.config.allowUnfree = true;

  home.username = "homelab2";
  home.homeDirectory = "/home/homelab2";
  home.file = {
    ".zshrc".source = ../../home/.zshrc;
    ".config/starship.toml".source = ../../home/.config/starship.toml;
  };

  # Let Home Manager install and manage itself.
  programs.home-manager.enable = true;

  # This value determines the Home Manager release that your configuration is
  # compatible with. This helps avoid breakage when a new Home Manager release
  # introduces backwards incompatible changes.
  #
  # You should not change this value, even if you update Home Manager. If you do
  # want to update the value, then make sure to first check the Home Manager
  # release notes.
  home.stateVersion = "24.05"; # Please read the comment before changing.
}