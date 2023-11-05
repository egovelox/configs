# to add brew installed packages
append-to-path /usr/local/bin
append-to-path /usr/sbin
append-to-path $HOME/bin
append-to-path /opt/homebrew/bin
append-to-path /opt/homebrew/sbin
append-to-path $HOME/Library/pnpm/global

setup-rust
append-to-path $CARGO_HOME/bin

if test -d "$HOME/apache-maven-3.6.3"
  append-to-path $HOME/apache-maven-3.6.3/bin
end

# to add awscli to PATH if installed
set -l aws /usr/local/opt/awscli@1
if test -d $aws
  append-to-path /usr/local/opt/awscli@1/bin
end
