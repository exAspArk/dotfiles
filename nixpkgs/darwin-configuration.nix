{ config, pkgs, ... }:

{
  nixpkgs.config.allowUnfree = true;

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
    lazygit

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
    python313
    python313Packages.pip
    python313Packages.virtualenv
    python313Packages.python-lsp-server
    ruby_3_4
    rubyPackages_3_4.solargraph
    nodejs_24
    pnpm
    jdk
    go
    delve # go debugger
    terraform-ls # Terraform LSP
  ];

  environment.darwinConfig = "/Users/exaspark/.nixpkgs/darwin-configuration.nix";

  system.primaryUser = "exaspark";

  nix.package = pkgs.nix;

  # Create /etc/zshrc that loads the nix-darwin environment.
  programs.zsh.enable = true;  # default shell on catalina
  # programs.fish.enable = true;

  # Used for backwards compatibility, please read the changelog before changing.
  # $ darwin-rebuild changelog
  system.stateVersion = 4;
  ids.uids.nixbld = 350;
}
