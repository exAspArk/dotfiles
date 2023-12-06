{ config, pkgs, ... }:

{
  # List packages installed in system profile. To search by name, run:
  # $ nix-env -qaP | grep wget
  environment.systemPackages = with pkgs; [
    neovim
    git
    openssl
    cmake
    ctags
    ripgrep
    fd # faster than find
    wget
    fzf
    unar
    gnused # for spectre-nvim
    mas # mac app store cli
    jid
    ffmpeg_6
    rsync
    pstree
    jq
    html-tidy
    gh
    fira-code
    sshfs
    overmind
    darwin.trash
    bore-cli # ngrok alternative
    unixtools.watch

    # Cloud
    localstack
    awscli2
    argocd
    kubernetes-helm
    kubeseal
    # stern # kube logs
    # sops

    # Languages
    python39
    ruby_3_2
    nodejs_20
    nodePackages_latest.pnpm
    elixir_1_15
    jdk
    go
  ];

  # Use a custom configuration.nix location.
  # $ darwin-rebuild switch -I darwin-config=$HOME/.config/nixpkgs/darwin/configuration.nix
  # environment.darwinConfig = "$HOME/.config/nixpkgs/darwin/configuration.nix";

  # Auto upgrade nix package and the daemon service.
  services.nix-daemon.enable = true;
  # nix.package = pkgs.nix;

  # Create /etc/zshrc that loads the nix-darwin environment.
  programs.zsh.enable = true;  # default shell on catalina
  # programs.fish.enable = true;

  # Used for backwards compatibility, please read the changelog before changing.
  # $ darwin-rebuild changelog
  system.stateVersion = 4;
}
