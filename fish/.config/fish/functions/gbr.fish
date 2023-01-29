function gbr --description "Git browse commits"
    set -l log_line_to_hash "echo {} | grep -o '[a-f0-9]\{7\}' | head -1"
    set -l view_commit "$log_line_to_hash | xargs -I % sh -c 'git show --color=always % | diff-so-fancy | less -R'"
    set -l copy_commit_hash "$log_line_to_hash | pbcopy"
    set -l git_checkout "$log_line_to_hash | xargs -I % sh -c 'git checkout %'"
    set -l open_cmd "open"

    set gitlab_open "$log_line_to_hash | xargs -I % sh -c '$open_cmd https://\$(git config remote.origin.url | cut -f2 -d@ | tr \':\' / | sed \'s/.git//\')/-/commit/%'"

    git log --color=always --format='%C(auto)%h%d %s %C(green)%C(bold)%cr% C(blue)%an' | \
        fzf --no-sort --reverse --tiebreak=index --no-multi --ansi \
            --preview="$view_commit" \
            --header="ENTER to view, CTRL-Y to copy hash, CTRL-O to Gitlab, CTRL-X to checkout" \
            --bind "enter:execute:$view_commit" \
            --bind "ctrl-y:execute:$copy_commit_hash" \
            --bind "ctrl-x:execute:$git_checkout" \
            --bind "ctrl-o:execute:$gitlab_open"
end
