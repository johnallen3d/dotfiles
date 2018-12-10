# Stripped down version of the __terlar_git_prompt
# https://github.com/fish-shell/fish-shell/blob/e598cb235ae903f0bf704edab9bf1866efca71b6/share/functions/__terlar_git_prompt.fish

set -g fish_prompt_git_status_clean '  '
set -g fish_prompt_git_status_dirty '  '

function git_prompt --description 'Write out the git prompt'
    if not command -sq git
        return 1
    end

    set -l branch (git rev-parse --abbrev-ref HEAD ^/dev/null)
    if test -z $branch
        return
    end

    set_color yellow

    echo -n '  '

    set_color normal

    set -l index (git status --porcelain ^/dev/null|cut -c 1-2|sort -u)

    echo -n $branch

    if test -z "$index"
        set_color green
        echo -n $fish_prompt_git_status_clean
    else
        set_color red
        echo -n $fish_prompt_git_status_dirty
    end

    set_color normal
end
