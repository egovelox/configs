#!/bin/bash
/opt/homebrew/bin/mozeidon bookmarks -t \
  '{{range .Items}}{{.Url}} 🦊 {{.Title}} {{.Parent}} {{"\u001b[38;5;109m"}} {{.Url}}{{"\033[0m"}}{{"\n"}}{{end}}'\
  | fzf-tmux -p 60% -- \
  --border-label=BOOKMARKS \
  --no-bold \
  --layout=reverse \
  --margin 0% \
  --no-separator \
  --no-info \
  --black \
  --with-nth 2.. \
  --color bg+:black,hl:reverse,hl+:reverse,gutter:black \
  --bind="enter:accept+execute(/opt/homebrew/bin/mozeidon tabs new {1} && open -a firefox)" \
  | xargs -r -I {} sh -c 'exit'


