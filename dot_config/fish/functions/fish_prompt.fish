function fish_prompt
    set -l st $status

    # Colors
    set -l normal (set_color normal)
    set -l c_err (set_color brred)
    set -l c_ok (set_color brgreen)
    set -l c_info (set_color brblue)
    set -l c_dim (set_color brblack)
    set -l c_git (set_color bryellow)

    # ---- line 1 ----
    if test $st -ne 0
        echo -n $c_err"[✘ $st]"$normal" "
    end

    echo -n $c_ok"[$USER@$hostname"$normal
    echo -n $c_info":"(prompt_pwd)"]"$normal

    set -l vcs (fish_vcs_prompt)
    if test -n "$vcs"
        echo -n " "$c_git"["(string trim -- $vcs)"]"$normal
    end

    # command duration (builtin; ms)
    if set -q CMD_DURATION; and test $CMD_DURATION -ge 1000
        set -l sec (math -s0 "$CMD_DURATION / 1000")
        echo -n " "$c_dim"("$sec"s)"$normal
    end

    echo

    # ---- line 2 ----
    if test $st -eq 0
        echo -n $c_ok"\$ "$normal
    else
        echo -n $c_err"\$ "$normal
    end
end
