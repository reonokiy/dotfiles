{
  packageOverrides = pkgs: with pkgs; {
    myPackages = pkgs.buildEnv {
      name = "my-packages";
      paths = [
        atuin
        bat
        chezmoi
        eza
        starship
        yazi
        neovim
        micromamba
        tealdeer
        zsh
        zsh-syntax-highlighting
        zoxide
      ];
    };
  };
}