{ config, pkgs, ... }:

{
  # List packages installed in system profile. To search by name, run:
  # $ nix-env -qaP | grep wget
  environment.systemPackages = with pkgs; [
    neovim
    git
    openssl
    cmake
    ripgrep
    fd # faster than find
    wget
    fzf
    unar
    gnused # for spectre-nvim
    mas # mac app store cli
    jid
    ffmpeg_6
    yt-dlp
    rsync
    pstree
    jq
    html-tidy
    gh
    fira-code
    sshfs
    overmind
    darwin.trash
    bore-cli # ngrok alternative for tunnels
    unixtools.watch
    socat
    tshark # wireshark cli
    mkcert # local HTTPS

    # Cloud
    localstack
    awscli2
    argocd
    kubernetes-helm
    kubeseal
    eksctl
    terraform
    wireguard-tools # VPN
    kubectl-cnpg # CloudNativePG
    stern # kube logs

    # Languages
    python311Full
    python311Packages.pip
    python311Packages.virtualenv
    python311Packages.python-lsp-server
    ruby_3_2
    rubyPackages_3_2.solargraph
    nodejs_20
    nodePackages_latest.pnpm
    elixir_1_15
    jdk
    go
    delve # go debugger
    terraform-ls # Terraform LSP
  ];

  # Use a custom configuration.nix location.
  # $ darwin-rebuild switch -I darwin-config=$HOME/.config/nixpkgs/darwin/configuration.nix
  # environment.darwinConfig = "$HOME/.config/nixpkgs/darwin/configuration.nix";

  # Auto upgrade nix package and the daemon service.
  services.nix-daemon.enable = true;
  nix.package = pkgs.nix;

  # Create /etc/zshrc that loads the nix-darwin environment.
  programs.zsh.enable = true;  # default shell on catalina
  # programs.fish.enable = true;

  # Used for backwards compatibility, please read the changelog before changing.
  # $ darwin-rebuild changelog
  system.stateVersion = 4;
  ids.uids.nixbld = 300; # For macOS Sonoma 14
}
