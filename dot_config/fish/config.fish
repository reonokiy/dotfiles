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

