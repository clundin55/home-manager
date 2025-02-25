{ config, pkgs, ... }:

{
  home.username = "carl";
  home.homeDirectory = "/home/carl";
  home.language.base = "en_US.UTF-8";

  programs.zsh.enable = true;
  home.shell.enableZshIntegration = true;

  home.packages = [
    pkgs.git
    pkgs.zsh
    pkgs.tmux
    pkgs.ruby
    pkgs.neovim
    pkgs.alacritty
    pkgs.ripgrep
    pkgs.fzf
    pkgs.jq
    pkgs.gh # GitHub CLI
    pkgs.htop
    pkgs.fd
    pkgs.difftastic # binary is difft
    pkgs.tealdeer
    pkgs.pass
    pkgs.tree
    (pkgs.writeShellScriptBin "install-scm-breeze" ''
        git clone https://github.com/scmbreeze/scm_breeze.git ~/.scm_breeze
        ~/.scm_breeze/install.sh
    '')
  ];

  home.file = {
    ".zshrc".source = dotfiles/zshrc;
    ".inputrc".source = dotfiles/inputrc;
    ".tmux.conf".source = dotfiles/tmuxconf;
    ".config/nvim/init.lua".source = dotfiles/nvimlua;
    ".config/alacritty/alacritty.toml".source = dotfiles/alacrittytoml;
    ".config/alacritty/darcula.toml".source = dotfiles/darculatoml;
    ".config/alacritty/paper.toml".source = dotfiles/papertoml;
    ".config/hypr/hyprland.conf".source = dotfiles/hyprlandconf;
    ".config/hypr/hyprpaper.conf".source = dotfiles/hyprpaperconf;
    ".config/waybar/config".source = dotfiles/waybarconf;
    ".config/waybar/style.css".source = dotfiles/waybarstyle;
  };

  home.sessionVariables = {
      USING_HOME_MANAGER = "true";
      EDITOR = "nvim";
      GIT_EXTERNAL_DIFF = "difft";
  };

  programs.git = {
    enable = true;
    userName = "Carl Lundin";
    userEmail = "carllundin55@gmail.com";
  };

  programs.home-manager.enable = true;
  home.stateVersion = "24.11";
}
