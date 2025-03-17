# disable fish greeting
set fish_greeting

# nix
if command -v nix >/dev/null
    fish_add_path ~/.nix-profile/bin
end

# direnv
if command -v direnv >/dev/null
    direnv hook fish | source
    set -g direnv_fish_mode eval_on_arrow
end

# starship
if command -v starship >/dev/null
    source (starship init fish --print-full-init | psub)
end

# zoxide
if command -v zoxide >/dev/null
    zoxide init fish | source
end

# micromamba
if command -v micromamba >/dev/null
    set -gx MAMBA_EXE $(which micromamba)
    set -gx MAMBA_ROOT_PREFIX "/home/oune/.local/share/mamba"
    $MAMBA_EXE shell hook --shell fish --root-prefix $MAMBA_ROOT_PREFIX | source
    alias conda=micromamba
    alias mamba=micromamba
    alias ma="micromamba activate"
    alias mda="micromamba activate base"
    alias mel="micromamba env list"
end

# fnm
if command -v fnm >/dev/null
    fnm env --use-on-cd --shell fish | source
end

# kubectl
if command -v kubectl >/dev/null
    alias k=kubectl
end
