# disable fish greeting
set fish_greeting

# go 
set -gx GOPATH $HOME/.go
fish_add_path $GOPATH/bin

# rust
fish_add_path $HOME/.cargo/bin

# uv
fish_add_path $HOME/.local/bin

# nix
if command -v nix >/dev/null
    fish_add_path $HOME/.nix-profile/bin
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
    set -gx MAMBA_ROOT_PREFIX $HOME/.local/share/mamba
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

if command -v /usr/local/bin/chrome >/dev/null
    set -gx BROWSER "/usr/local/bin/chrome"
end
