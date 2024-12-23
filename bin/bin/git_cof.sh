#!/usr/bin/env bash

git branch --all | grep -v -E '^\*|remotes' | fzf-tmux -p 80% -- \
  --border-label='GIT BRANCHES' \
  --header-first \
  --header='✅[Enter] git checkout
❌[C-d]   git branch -D
👋[C-c]   exit' \
  --color=header:gray \
  --no-bold \
  --layout=reverse \
  --margin 0% \
  --no-separator \
  --no-info \
  --black \
  --color bg+:black,hl:reverse,hl+:reverse,gutter:black \
  --multi \
  --marker=❌ \
  --with-nth 1 \
  --bind='enter:accept+execute(git checkout {1})' \
  --bind='ctrl-d:accept-non-empty+execute(git branch -D {+1})'

