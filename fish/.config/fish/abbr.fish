# SYNOPSIS
# abbr --add [SCOPE] WORD EXPANSION
# abbr --erase WORD ...
# abbr --rename [SCOPE] OLD_WORD NEW_WORD
# abbr --show
# abbr --list
# abbr --query WORD ...

abbr -a -U -- cls clear
abbr -a -U -- gco 'git checkout'
abbr -a -U -- java11 'jabba use openjdk@1.11.0'
abbr -a -U -- java17 'jabba use openjdk@1.17.0'
abbr -a -U -- boo 'bkmr search -o --fzf'
